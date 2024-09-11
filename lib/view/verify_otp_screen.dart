import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';
class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/invoicemint bg.png'))),  
                child: Column(
                children: [
                Align(
                alignment: Alignment.topLeft,
               child: Padding(
                 padding: const EdgeInsets.only(left:10,top: 30),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:   IconButton(
                 onPressed:(){
                Navigator.pop(context);
                 } 
                , icon:const Icon(Icons.arrow_back_ios,size:20, color: Colors.black,)),
                 ),
               )),
                const SizedBox(
                  height: 30,
                ),
                  const Padding(
                  padding: EdgeInsets.symmetric(horizontal:35,),
                    child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Please Check Your Email',
                    style:TextStyle(
                    fontSize:25,
                    fontFamily:'poppins-regular',
                    fontWeight: FontWeight.bold,
                    color:Color(0xff000000))),
                          ),
                  ),
          const Text('Send ',style:TextStyle(fontFamily:'poppins-regular',fontSize: 12,fontWeight: FontWeight.w200),),
              const SizedBox(height:20),
               const Padding(
               padding: EdgeInsets.symmetric(horizontal:35),
                 child: Align(
                  alignment: Alignment.topLeft,
                   child:  Text.rich(
                                TextSpan(children:[
                               TextSpan(text:'We have sent the code to',
                                 style: TextStyle(
                                 fontSize: 15,
                                 fontFamily: 'poppins-regular',
                                 fontWeight: FontWeight.bold,
                                 color: Color(0xf7070704F)), ),
                                TextSpan(text:' Eon12@gmail.com',
                                 style: TextStyle(
                                 fontSize: 15,
                                 fontFamily: 'poppins-regular',
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black), )
                                ])
                              )
                         ),
                         ),
                    const SizedBox(height:50),    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:65 ,
                          width: 60,
                         decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 255, 255, 251),
                         border: Border.all(color:const Color(0xf7070704F)),
                         borderRadius:const BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                         const SizedBox(width: 10,),
                        Container(
                          height:65 ,
                          width: 60,
                         decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 255, 255, 251),
                         border: Border.all(color:const Color(0xf7070704F)),
                         borderRadius:const BorderRadius.all(Radius.circular(20))
                          ),
                        ), 
                          const SizedBox(width: 10,),
                        Container(
                          height:65 ,
                          width: 60,
                         decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 255, 255, 251),
                         border: Border.all(color:const Color(0xf7070704F)),
                         borderRadius:const BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                           const SizedBox(width: 10,),
                        Container(
                          height:65 ,
                          width: 60,
                         decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 255, 255, 251),
                         border: Border.all(color:const  Color(0xf7070704F)),
                         borderRadius:const BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                           const SizedBox(width: 10,),
                        Container(
                          height:65 ,
                          width: 60,
                         decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 255, 255, 251),
                         border: Border.all(color:const  Color(0xf7070704F)),
                         borderRadius:const BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ],
                    ),
                   const SizedBox(height: 70,),
                       ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)),
                               elevation: 5,
                                           ),
                                           onPressed: () {
                                                Navigator.pushNamed(context, RoutesName.changePassword);
                                        //  if (formKey.currentState!.validate()){
                                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                        //       }
                                           },
                                           child: Ink(
                                           decoration: BoxDecoration(
                                           gradient: const  LinearGradient(
                                         begin: Alignment.topCenter,
                                         end: Alignment.bottomCenter,
                                         colors: [Color(0xff39DEE8),Color(0xff42566A)],
                                             ),
                                            borderRadius: BorderRadius.circular(10)),
                                             child: Container(
                                              height:65,
                                               width:320,
                                               constraints: const BoxConstraints(minWidth: 88.0),
                                               child: const Center(
                                                 child:Text('Verification',
                                                     textAlign: TextAlign.center,
                                                     style:TextStyle(
                                                     fontSize: 16,
                                                     fontFamily: 'poppins-regular',
                                                     fontWeight: FontWeight.bold,
                                                     color: Colors.white)),
                                               ),
                                             ),
                                           ),
                                         ),
                              
              ], 
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




         