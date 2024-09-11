import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';
class RecordPaymentScreen extends StatefulWidget {
 const RecordPaymentScreen({super.key});

  @override 
  State<RecordPaymentScreen> createState() => _RecordPaymentScreenState();
}

class _RecordPaymentScreenState extends State<RecordPaymentScreen> {
  final amountReceivedController = TextEditingController();
  final transactionChargeController = TextEditingController();
  final amountSettleController =TextEditingController();
  final paymentDateController = TextEditingController();
  final additionalNotesController = TextEditingController();

final GlobalKey<FormState> key = GlobalKey<FormState>();

@override
Widget build(BuildContext context){
final heightSize = MediaQuery.of(context).size.width;
final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
     body:GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                decoration: const BoxDecoration(
                 image: DecorationImage(
                 fit: BoxFit.cover,
                  image: AssetImage('assets/images/invoicemint bg.png'))),
                child: Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.only(top:45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                          children: [ 
                           Row(
                             children: [
                            GestureDetector(
                              onTap: (){
                             Navigator.pop(context);  
                                          
                                  },
                              child: Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Container(
                                height:40,
                                width: 40,
                                decoration:const  BoxDecoration(
                                boxShadow: [
                                BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                                ),],
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.white
                                ),
                              child:const Icon(Icons.arrow_back ,color: Color(0xFF000000),size:25,)
                                  ),
                              ),
                            ), 
                           SizedBox(width:widthSize-340),
                               const Text('Payment Receving',
                               style: TextStyle(
                               fontSize:20,
                               fontFamily: 'raleway-regular',
                               fontWeight: FontWeight.w600,
                               color:  Color(0xff000000)),
                                ),
                             ],
                           ),
                          const SizedBox(
                              height:30,
                            ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal:30),
                         child: Column(
                          children: [
                           const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Invoice No                      ',
                          style: TextStyle(
                          fontSize:16, 
                          fontFamily: 'raleway-regular',
                          fontWeight: FontWeight.w600,
                          color:  Colors.blue),
                                  ), 
                           Text(':',
                           style: TextStyle(
                           fontSize: 14,
                           fontFamily: 'raleway-regular',
                           fontWeight: FontWeight.bold,
                           color: Colors.black),) ,
                              Text('           IPL - 02 - 2024 - 2',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'raleway-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)      
                              ],
                            ),
                            const SizedBox(
                            height:5
                              ),
                           const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Billed To      ',
                          style: TextStyle(
                          fontSize:16,
                          fontFamily: 'raleway-regular',
                          fontWeight: FontWeight.w600,
                          color:  Colors.blue),
                                  ),  
                           Text(':',
                           style: TextStyle(
                           fontSize: 14,
                           fontFamily: 'raleway-regular',
                           fontWeight: FontWeight.bold,
                           color: Colors.black),) ,
                              Text('IBS Pvt Ltd',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'raleway-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)      
                              ],
                            ),
                           const SizedBox(
                            height:5
                              ),
                           const Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Payment Method',
                          style: TextStyle(
                          fontSize:16,
                          fontFamily: 'raleway-regular',
                          fontWeight: FontWeight.w600,
                          color:  Colors.blue),
                                  ),  
                            Text(':',
                           style: TextStyle(
                           fontSize: 14,
                           fontFamily: 'raleway-regular',
                           fontWeight: FontWeight.bold,
                           color: Colors.black),) ,
                              Text('Account Transfer',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'raleway-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)      
                              ],
                            ),
                             const SizedBox(height:15),
                             SizedBox(
                            height: 30,
                            width:widthSize,
                            child: const Divider(
                             thickness:1,
                            color: Color(0xFF7070704F)
                              ),
                            ),
                           const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Invoice Total',
                          style: TextStyle(
                          fontSize:16,
                          fontFamily: 'raleway-regular',
                          fontWeight: FontWeight.w600,
                          color:  Colors.blue),
                                  ),  
                           Text('(INR)196.127951',
                           style: TextStyle(
                           fontSize: 14,
                           fontFamily: 'raleway-regular',
                           fontWeight: FontWeight.bold,
                           color: Colors.black),) ,
                              Text('( AFN )169.92',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'raleway-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)      
                              ],
                            ),
                              SizedBox(
                            height: 30,
                            width:widthSize,
                            child: const Divider(
                            thickness:1,
                            color: Color(0xFF7070704F)
                              ),
                            ),
                                             const SizedBox(height:15),
                          ],
                         ),
                       ),
                       const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                             padding: EdgeInsets.symmetric(horizontal:40),
                                child:Text('Amount Received ( A )',
                                   style: TextStyle(
                                   fontSize: 14,
                                   fontFamily: 'raleway-regular',
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),)
                              ),
                            ),
                            const SizedBox(
                              height:10,
                            ),       
                            Padding(
                            padding: const EdgeInsets.symmetric(horizontal:25),
                           child: TextFormField(
                            validator:(value){
                             if(value!.isEmpty){
                           return('enter ');
                                      }
                                      return null;
                                    },
                                textInputAction: TextInputAction.next,
                                controller:amountReceivedController,
                                 keyboardType:TextInputType.number,
                                decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                color:Color(0xf7070704F))),
                                focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:Color.fromARGB(255, 67, 235, 218),
                                    )),
                                    border: InputBorder.none,
                                    hintText:'    ( AFN ) 196.80',
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(fontFamily: 'raleway-regular'),
                                    filled: true),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                             padding: EdgeInsets.symmetric(horizontal:40),
                                child:Text('Transactions Charge ( B )',
                                   style: TextStyle(
                                   fontSize: 14,
                                   fontFamily: 'raleway-regular',
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),)
                              ),
                            ),
                            const SizedBox(
                              height:10,
                            ), 
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child:    TextFormField(validator:  (value) {
                            //  if (value!.isEmpty) {
                            //  return ("enter last name");
                            // } else if(_passwordController.text.length < 6){
                            //   return ('Atleast 6 character');
                            //         }
                            //  return null;
                                  },
                             
                            controller:transactionChargeController, 
                             textInputAction: TextInputAction.next,
                              keyboardType:TextInputType.number,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(fontSize: 10),
                              enabledBorder:OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10),),
                                borderSide: BorderSide(
                                color:Color(0xf7070704F))),
                                 focusedBorder:  OutlineInputBorder(
                                 borderSide: BorderSide(
                                  color:Color.fromARGB(255, 67, 235, 218),
                                    )),
                                    border: InputBorder.none,
                                    hintText:'   ( AFN )',
                                    hoverColor: Colors.red,
                                    hintStyle: TextStyle(fontFamily: 'raleway-regular',),
                                    fillColor: Colors.white,
                                    filled: true,
                                    )
                                    ),
                            ),
                         const  SizedBox(height:20,) ,  
                         const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                             padding: EdgeInsets.symmetric(horizontal:40),
                                child:Text('Amount to settle (A+B)',
                                   style: TextStyle(
                                   fontSize: 14,
                                   fontFamily: 'raleway-regular',
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),)
                              ),
                            ),
                            const SizedBox(
                              height:10,
                            ), 
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child:    TextFormField(validator:  (value) {
                            //  if (value!.isEmpty) {
                            //  return ("enter phone no.");
                            // } else if(_passwordController.text.length < 6){
                            //   return ('Atleast 6 character');
                            //         }
                            //  return null;
                                  },
                              controller: amountSettleController,
                             keyboardType:TextInputType.number,
                             textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                             errorStyle: TextStyle(fontSize: 10),
                            enabledBorder:OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10),),
                                borderSide: BorderSide(
                                color:Color(0xf7070704F))),
                                 focusedBorder:   OutlineInputBorder(
                                 borderSide: BorderSide(
                                  color:Color.fromARGB(255, 67, 235, 218),
                                    )),
                                    border: InputBorder.none,
                                    hintText:'   ( AFN ) 0.00',
                                    hoverColor: Colors.red,
                                    hintStyle: TextStyle(fontFamily: 'raleway-regular',),
                                    fillColor: Colors.white,
                                    filled: true,
                                    )
                                    ),
                            ),
                                const SizedBox(height: 20),
                         const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                             padding: EdgeInsets.symmetric(horizontal:40),
                                child:Text('Payment Dates',
                                   style: TextStyle(
                                   fontSize: 14,
                                   fontFamily: 'raleway-regular',
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),)
                              ),
                            ),
                            const SizedBox(
                              height:10,
                            ), 
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child:    TextFormField(validator:  (value) {
                            //  if (value!.isEmpty) {
                            //  return ("enter phone no.");
                            // } else if(_passwordController.text.length < 6){
                            //   return ('Atleast 6 character');
                            //         }
                            //  return null;
                                  },
                              controller:paymentDateController,
                               keyboardType:TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                              enabledBorder:OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10),),
                                borderSide: BorderSide(
                                color:Color(0xf7070704F))),
                                 focusedBorder:  OutlineInputBorder(
                                 borderSide: BorderSide(
                                  color:Color.fromARGB(255, 67, 235, 218),
                                    )),
                                    border: InputBorder.none,
                                    hintText:'   DD-MM-YYYY',
                                    hoverColor: Colors.red,
                                    hintStyle: TextStyle(fontFamily: 'raleway-regular',),
                                    fillColor: Colors.white,
                                    filled: true,
                                    )
                                    ),
                            ),
                                const SizedBox(height: 20),
                         const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                             padding: EdgeInsets.symmetric(horizontal:40),
                                child:Text('Additional Notes',
                                   style: TextStyle(
                                   fontSize: 14,
                                   fontFamily: 'raleway-regular',
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),)
                              ),
                            ),
                            const SizedBox(
                              height:10,
                            ), 
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child:    TextFormField(validator:  (value) {
                            //  if (value!.isEmpty) {
                            //  return ("enter phone no.");
                            // } else if(_passwordController.text.length < 6){
                            //   return ('Atleast 6 character');
                            //         }
                            //  return null;
                                  },
                              controller: additionalNotesController, 
                              keyboardType:TextInputType.number,
                             textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                              enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                                borderSide: BorderSide(
                                color:Color(0xf7070704F))),
                                 focusedBorder:  OutlineInputBorder(
                                 borderSide: BorderSide(
                                  color:Color.fromARGB(255, 67, 235, 218),
                                    )),
                                    border: InputBorder.none,
                                    hintText:'   DD-MM-YYYY',
                                    hoverColor: Colors.red,
                                    hintStyle: TextStyle(fontFamily: 'raleway-regular',),
                                    fillColor: Colors.white,
                                    filled: true,
                                    )
                                    ),
                            ),
                          const SizedBox(
                              height: 50,
                            ),
                           ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)),
                                      elevation: 5,
                                     ),
                                     onPressed: () {
                                 Navigator.pushNamed(context, RoutesName.login);
                                  //  if (formKey.currentState!.validate()){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                  //       }
                                     },
                                     child: Ink(
                                     decoration: BoxDecoration(
                                     gradient: const  LinearGradient(
                                     begin: Alignment.topCenter,
                                     end: Alignment.bottomCenter,
                                      colors: [Color(0xff39DEE8),Color(0xf42566A)],
                                       ),
                                      borderRadius: BorderRadius.circular(10)),
                                       child: Container(
                                        height:65,
                                         width:320,
                                         constraints: const BoxConstraints(minWidth: 88.0),
                                         child: const Center(
                                           child:Text('Save Details',
                                               textAlign: TextAlign.center,
                                               style:TextStyle(
                                               fontSize: 16,
                                               fontFamily: 'raleway-regular',
                                               fontWeight: FontWeight.bold,
                                               color: Colors.white)),
                                         ),
                                       ),
                                     ),
                                   ),
                            const SizedBox(
                              height:15
                            ),
                        
                          ],
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ) ,
     ));
  }
}
