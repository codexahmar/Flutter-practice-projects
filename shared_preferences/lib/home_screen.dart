import 'package:chap9/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
String email="",age="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
   email =sp.getString("email")?? "";
    age =sp.getString("age")?? "";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email:"),
                Text(email),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Age:"),
                Text(age.toString()),
              ],
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

            sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (const LoginScreen())));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: const Center(
                  child: Text("logout"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
