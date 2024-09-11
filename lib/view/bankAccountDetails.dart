import 'package:flutter/material.dart';
import 'package:Invoicemint/view/ExistingUserInvoice.dart';
class BankAccountScreen extends StatefulWidget {
 const BankAccountScreen({super.key});

  @override 
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}
class _BankAccountScreenState extends State<BankAccountScreen> {
  final bankNameController = TextEditingController();
  final accountTypeController = TextEditingController();
  final accountNumberController =TextEditingController();
  final confirmAccountController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final holderNameController =TextEditingController();
  final phoneNumberController = TextEditingController();
  final swiftCodeController = TextEditingController();

  final List<String> buisnessTypes = [
    'IBS'
    'hcl pvt. ltd',
    'Blossosm',
    'Deutshce Bank'
  ];

final List<String> accountTypes = [
'Saving',
'Current',
  ];

String? selectedAccountType;               
String? selectedBuisnessType;

final GlobalKey<FormState> key = GlobalKey<FormState>();          
  @override
Widget build(BuildContext context){
final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
         flexibleSpace: Container(
            height: 130,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: <Color>[Color.fromARGB(255, 65, 213, 221),Color.fromARGB(255, 77, 76, 76)]
          ),
          ),
              ),   
             title:const Text('Add Bank Account ',  style: TextStyle(
             fontSize:18,
             fontFamily: 'poppins-regular',
             fontWeight: FontWeight.w600,
             color:  Colors.white),),
             actions: [
              Padding(
              padding:const EdgeInsets.only(top:13,right:10,bottom: 12),
              child: ElevatedButton(
              style: ButtonStyle(
                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                              ),
                              ),
                           backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 253, 237, 237)),
                            ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ()));
                                     },
                                child:const Text('Skip&Preview', 
                                   style: TextStyle(
                                   fontSize:12,
                                   fontFamily: 'poppins-regular',
                                   fontWeight: FontWeight.w600,
                                   color:  Colors.black),),
                              ),
                            ), 
                               ],
      ),
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
                         const  Text('This Bank Detail Will Be Mentioned On The Invoice\n                  For Clients To Pay You Easily.',
                         style: TextStyle(fontFamily: 'poppins-regular',fontSize:14,color: Color(0xFF50BEFF),fontWeight: FontWeight.w600),),
                           const SizedBox(
                            height: 25,
                           ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                       decoration:const BoxDecoration(
                          boxShadow: [ BoxShadow(
                       color: Colors.grey,
                      blurRadius: .25,
                        ),],
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 198, 246, 255)
                        ),
                          width: widthSize,
                           child: Column(
                            children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40,vertical:15),
                                  child:Text('Select Buisness',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)
                                ),
                              ),     
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal:25),
                             child:              DropdownButtonFormField<String>(
                                                 padding:const EdgeInsets.only(left:3,right: 3),
                                                      decoration: const InputDecoration(
                                                    filled: true,
                                                   fillColor:Color.fromARGB(118, 255, 255, 255),
                                                      suffixIconColor: Color(0xFF000000),
                                                      enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      borderSide: BorderSide(
                                                      color: Color.fromRGBO(34, 31, 31, 0.216),
                                                       ),
                                                      ),
                                                     focusColor: Color.fromRGBO(255, 255, 255, 1),
                                                     focusedBorder: OutlineInputBorder( 
                                                     borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),
                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                     ),
                                                      ),
                                                   style: const TextStyle(color: Colors.black),
                                                   isExpanded: true,
                                                   items: buisnessTypes.map((String type) {
                                                   return DropdownMenuItem<String>(
                                                   value: type,
                                                   child: Center(
                                                    child: Text(
                                                     type,
                                                      style: const TextStyle(
                                                      fontFamily: 'poppins-regular',
                                                      color: Color(0xFF000000),
                                                      fontSize: 14,
                                                      ),
                                                      ),
                                                     ),
                                                   );
                                                }).toList(),
                                                hint:const Text(
                                               "    Select Buisness",
                                               style: TextStyle(
                                              fontFamily: 'poppins-regular',
                                              color: Color(0xFF000000),
                                              fontSize: 14,
                                             ),
                                             ),
                                            onChanged: (value) {
                                            setState(() {
                                            selectedBuisnessType = value;
                                              });
                                               },
                                             value: selectedBuisnessType,
                                                ),
                              ),
                             const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40,vertical:15),
                                  child:Text('Bank Name',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)
                                ),
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
                                  controller:bankNameController,
                                  decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                  color: Color(0xf7070704F))),
                                  focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'    Enter Bank Name',
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      hintStyle: TextStyle(fontFamily: 'poppins-light',fontSize: 14,color:Color(0xFF000000)),
                                      filled: true),
                                ),
                              ),
                              const SizedBox(height: 25),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('Account Type',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)
                                ),
                              ),
                              const SizedBox(
                                height:10,
                              ), 
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal:25),
                             child:              DropdownButtonFormField<String>(
                                                 padding:const EdgeInsets.only(left:3,right: 3),
                                                      decoration: const InputDecoration(
                                                    filled: true,
                                                   fillColor:Color.fromARGB(118, 255, 255, 255),
                                                      suffixIconColor: Color(0xFF000000),
                                                      enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      borderSide: BorderSide(
                                                      color: Color.fromRGBO(34, 31, 31, 0.216),
                                                       ),
                                                      ),
                                                     focusColor: Color.fromRGBO(255, 255, 255, 1),
                                                     focusedBorder: OutlineInputBorder( 
                                                     borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),
                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                     ),
                                                      ),
                                                   style: const TextStyle(color: Colors.black),
                                                   isExpanded: true,
                                                   items: accountTypes.map((String type) {
                                                   return DropdownMenuItem<String>(
                                                   value: type,
                                                   child: Center(
                                                    child: Text(
                                                     type,
                                                      style: const TextStyle(
                                                      fontFamily: 'poppins-regular',
                                                      color: Color(0xFF000000),
                                                      fontSize: 14,
                                                      ),
                                                      ),
                                                     ),
                                                   );
                                                }).toList(),
                                                hint: const Text(
                                               "   Select Account Type",
                                               style: TextStyle(
                                              fontFamily: 'poppins-regular',
                                              color: Color(0xFF000000),
                                              fontSize: 14,
                                             ),
                                             ),
                                            onChanged: (value) {
                                            setState(() {
                                            selectedAccountType = value;
                                              });
                                               },
                                             value: selectedAccountType,
                                                ),
                              ),
                           const  SizedBox(height:20,) ,  
                           const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('Account Number',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
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
                                controller: accountNumberController,
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
                                           color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'   Enter Account Number',
                                      hoverColor: Colors.red,
                                      hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14,color:Color(0xFF000000)),
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      filled: true,
                                      )
                                      ),
                              ),
                                  const SizedBox(height: 20),
                           const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('Confirm Account Number',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
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
                                controller:confirmAccountController,
                                 keyboardType:TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                                enabledBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10),),
                                  borderSide: BorderSide(
                                  color:Color(0xf7070704F))),
                                   focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'   Enter Confirm Account Number',
                                      hoverColor: Colors.red,
                                      hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14,color:Color(0xFF000000)),
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      filled: true,
                                      )
                                      ),
                              ),
                                  const SizedBox(height: 20),
                           const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('IFSC Code ',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black),)
                                ),
                              ),
                              const SizedBox(
                                height:10,
                              ), 
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                validator:  (value) {
                              //  if (value!.isEmpty) {
                              //  return ("enter phone no.");
                              // } else if(_passwordController.text.length < 6){
                              //   return ('Atleast 6 character');
                              //         }
                              //  return null;
                                    },
                                controller: ifscCodeController, 
                                keyboardType:TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                                enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10),),
                                borderSide: BorderSide(
                                  color:Color(0xf7070704F))),
                                   focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'   ifsc',
                                      hoverColor: Colors.red,
                                      hintStyle: TextStyle(
                                      fontFamily: 'poppins-regular',fontSize: 14,color:Color(0xFF000000)),
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      filled: true,
                                      )
                                      ),
                                    ),
                                  const SizedBox(height: 20),
                                const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('Account Holder Name',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
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
                                controller: holderNameController, 
                               textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                                enabledBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10),),
                                  borderSide: BorderSide(
                                  color:Color(0xf7070704F))),
                                   focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'   Account Holder Name',
                                      hoverColor: Colors.red,
                                      hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14,color:Color(0xFF000000)),
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      filled: true,
                                      )
                                      ),
                              ),
                                  const SizedBox(height: 20),
                               const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('Phone Number',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
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
                                controller: phoneNumberController, 
                                keyboardType: TextInputType.number,
                               textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                                enabledBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10),),
                                  borderSide: BorderSide(
                                  color:Color(0xf7070704F))),
                                   focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'   Enter Phone Number',
                                      hoverColor: Colors.red,
                                      hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14,color:Color(0xFF000000)),
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      filled: true,
                                      )
                                      ),
                              ), 
                                  const SizedBox(height: 20),
                             const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:40),
                                  child:Text('Swift Code',
                                     style: TextStyle(
                                     fontSize: 14,
                                     fontFamily: 'poppins-regular',
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
                                controller: swiftCodeController, 
                                keyboardType: TextInputType.number,
                               textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(errorStyle: TextStyle(fontSize: 10),
                                enabledBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10),),
                                  borderSide: BorderSide(
                                  color:Color(0xf7070704F))),
                                   focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                                     color: Colors.black,
                                                      ),),
                                      border: InputBorder.none,
                                      hintText:'   Enter Swift Code ( Optional )',
                                      hoverColor: Colors.red,
                                      hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14,color:Color(0xFF000000)),
                                      fillColor:Color.fromARGB(118, 255, 255, 255),
                                      filled: true,
                                      )
                                      ),
                              ),    
                            ],
                           ),
                             ),
                      ),
                     
                          const SizedBox(
                              height: 50,
                            ),
                                                    Center(
                                                    child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)),
                                                       elevation: 5,
                                                      ),
                                                      onPressed: () {
                                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExistingUserInvoice()));
                                                      },
                                                      child: Ink(
                                                      decoration: BoxDecoration(
                                                      gradient: const  LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                   
                                colors: [Color(0xff39DEE8),Color(0xff42566A)],
                                                        ),
                                                       borderRadius: BorderRadius.circular(25)),
                                                        child: Container(
                                                         height: 60,
                               width:240,
                               constraints: const BoxConstraints(minWidth: 88.0),
                               child: const Center(
                                 child: Text('Save Details',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white)),
                               ),
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
