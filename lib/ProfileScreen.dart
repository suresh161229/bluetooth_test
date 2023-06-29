import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/RandomProvider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<RandomDogProvider>(context,listen: false).showPerson();
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Muy Profile"),
      ),
      body: Consumer<RandomDogProvider>(
        builder: (context,ranCtrl,child) {
          var data = ranCtrl.data?[0];
          return SizedBox(
            height: size.height,
            width: size.width,
            child: ranCtrl.isLoading1||data==null?const Center(child: CircularProgressIndicator(color: Colors.green,),):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(ranCtrl.data?[0]["picture"]["large"]),
                Text("Name  : ${ranCtrl.data?[0]["name"]["title"]}"),
                Text("Email : ${ranCtrl.data?[0]["email"]}"),
                Text("DOB   : ${ranCtrl.data?[0]["dob"]["date"]}"),
                Text("location :${ranCtrl.data?[0]["location"]["street"]["name"]}"),
                Text("Number of days passed since registered : ${ranCtrl.data?[0]["registered"]["date"]}"),
              ],
            ),
          );
        }
      ),
    );
  }
}