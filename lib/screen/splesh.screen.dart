import 'package:flutter/material.dart';
import 'package:internshala_search/screen/home.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.spa_rounded,color: Colors.lightBlue,size: 200,),
            Text(
              "Welcome to Internshala search",
              style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
