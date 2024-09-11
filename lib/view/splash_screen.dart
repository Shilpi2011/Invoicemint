import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  super.initState();
  startTimer();
    // Timer(
    // const Duration(seconds: 2),() => Nav
    //    );
           }
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
  final heightSize =size.height;
  final widthSize = size.width;
    return Scaffold(
      body: Container(
        height:heightSize,
        width:widthSize,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage('assets/images/Mask Group 2.png'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
          height: 120,
          width: 150,
          decoration: const BoxDecoration(
           shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image:AssetImage('assets/images/Group 402.png'))  ),),
        const SizedBox(height: 0,),
         SizedBox(child: Image.asset('assets/images/Group 380.png')),
         const SizedBox(height: 15,),
        const  Text('Create professional Invoices In seconds!',style: TextStyle(fontSize:16,color: Color(0xFF000000),fontFamily:'raleway-regular',fontWeight: FontWeight.w600),)
        ],
      ),),
    );
  }
 void startTimer() {
    Timer( const Duration(seconds: 2), () {
      Navigator.pushNamed(context, RoutesName.login);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateInvoice()));
    });
  }
  }



