// ignore: unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/providers/RandomProvider.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<RandomDogProvider>(context,listen: false).showRandomDog();
    });

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:const Text("Random Dog Images")),
      body: Consumer<RandomDogProvider>(
        builder: (context,randomCtrl,child) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: randomCtrl.isLoading||randomCtrl.dogImage==null?50:size.height*0.75,
                  child: randomCtrl.isLoading||randomCtrl.dogImage==null?const CircularProgressIndicator(color: Colors.green):Image.network(randomCtrl.dogImage.toString())
                ),
                MaterialButton(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: (){
                  Provider.of<RandomDogProvider>(context,listen: false).showRandomDog();
                },child: const Text("Show Image",style: TextStyle(color: Colors.white),),)
              ],
            ),
          );
        }
      )
    );
  }
}




