import 'package:Invoicemint/view_model/SendWhatsAppMessage_api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateItemsFields extends StatefulWidget {
  const UpdateItemsFields({super.key});

  @override
  State<UpdateItemsFields> createState() => _UpdateItemsFieldsState();
}

class _UpdateItemsFieldsState extends State<UpdateItemsFields> {
bool passTaxToggle =false;
bool passRateToggle =false;
bool passQuantityToggle =false;
bool passAmountToggle =false;
bool passTotalTaxToggle =false;
bool passTotalToggle =false;


final controllerItemName =TextEditingController();
final controllerTax =TextEditingController();
final controllerRate =TextEditingController();
final controllerQuantity =TextEditingController();
final controllerAmount =TextEditingController();
final controllerTotalTax =TextEditingController();
final controllerTotal =TextEditingController();



  @override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
         flexibleSpace: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: <Color>[Color.fromARGB(255, 65, 213, 221),Color.fromARGB(255, 77, 76, 76)]
          ),
        )),  
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title:const Text('                 Edit Fields',style: TextStyle(color: Colors.white,fontFamily: 'poppins-regular',fontSize: 18,fontWeight: FontWeight.w400),),
      ),  
     body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
       child: Container(
       decoration: const BoxDecoration(
       image: DecorationImage(
       fit: BoxFit.cover,
       image: AssetImage('assets/images/invoicemint bg.png'))),     
       child: SingleChildScrollView(
         child: Column(
         children: [
          const  Padding(
             padding: EdgeInsets.all(15),
             child: Text('Edit name of fields in the invoice. Use this to edit fields like units, hours,service/product specification etc.',
            style: TextStyle(fontFamily: 'poppins-medium',fontSize:14,color: Colors.blue,fontWeight: FontWeight.w700),),
           ),
           const SizedBox(height:10,),
                       SizedBox(
                        height:700,
                         child: Stack(
                           children:[ 
                        Container(
                            height:630,
                           margin:const EdgeInsets.only(left: 10,right: 10),
                           decoration:const BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2
                            )
                            ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                           Container(
                           height:60 ,
                           width: double.infinity,
                           decoration:const BoxDecoration(
                           borderRadius: BorderRadius.only(topLeft:Radius.circular(18),topRight:Radius.circular(18)),
                            color: Color.fromARGB(255, 0, 140, 150),
                              ),    
                              child:const  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                           Text('Name',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                              fontSize: 14,
                               fontWeight:FontWeight.w500,
                               fontFamily: 'poppins-medium',
                               color: Colors.white)), 
                               VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              ),
                                Text('Type',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                              fontSize: 14,
                               fontWeight:FontWeight.w500,
                               fontFamily: 'poppins-medium',
                               color: Colors.white)), 
                               VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              ),
                                Text('Action',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                              fontSize: 14,
                               fontWeight:FontWeight.w500,
                               fontFamily: 'poppins-medium',
                               color: Colors.white)), 
                              ],  
                              ),
                                  ),
                                    Padding(
                                     padding: const EdgeInsets.only(left:15),
                                         child: Row(
                                         children: [
                                           SizedBox(
                                            height:60,
                                            width:100,
                                             child: TextFormField(
                                              controller:controllerItemName,
                                              decoration: const InputDecoration(  
                                                hintText: "Item Name",
                                                hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                   ),
                                                       ),
                                           ),
                             const SizedBox(width:28),
                               SizedBox(
                                height:60,
                                 width:100,
                                 child: TextFormField(
                                 readOnly:true,
                                decoration: const InputDecoration(
                                  hintText: "Text",
                                  hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                     ),
                                         ),
                                         ),                    
                                       ],
                                       ),
                                     ),
                                  const SizedBox(height: 20,),
                                      Padding(
                                    padding: const EdgeInsets.only(left:15),
                                       child: Row(
                                          children: [
                                            SizedBox(
                                            height:60,
                                            width:100,
                                            child: TextFormField(
                                           controller: controllerTax,
                                             decoration: const InputDecoration(
                                               hintText: "Tax",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                                 ),
                                  const  SizedBox(width:28),
                                         SizedBox(
                                            height:60,
                                            width:100,
                                            child: TextFormField(
                                              readOnly: true,
                                             decoration: const InputDecoration(
                                               hintText: "number",  
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                           ),
                                   const  SizedBox(width:50),
                                     InkWell(
                                 onTap: () {
                                  setState(() {
                                 passTaxToggle = !passTaxToggle;   
                                  });
                                    },
                               child:  Icon(passTaxToggle?Icons.visibility_off:Icons.visibility,size:24,color:Colors.black)) 
                                          ],
                                        ),
                                      ),
                                     const SizedBox(height: 20,),
                                      Padding(
                                      padding: const EdgeInsets.only(left:15),
                                           child: Row(
                                          children: [
                                            SizedBox(
                                            height:60,
                                            width:100,
                                            child: TextFormField(
                                           controller: controllerRate,
                                             decoration: const InputDecoration(
                                               hintText: "Rate",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                                ),
                                      const SizedBox(width:28,),
                                       SizedBox(
                                            height:60,
                                            width:100,
                                            child: TextFormField(
                                            readOnly: true,
                                             decoration: const InputDecoration(
                                               hintText: "number",
                                           hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                                ),  
                                     const  SizedBox(width:50),
                                 InkWell(
                                 onTap: () {
                                  setState(() {
                                 passRateToggle = !passRateToggle;   
                                  });
                                    },
                               child:  Icon(passRateToggle?Icons.visibility_off:Icons.visibility,size:24,color:Colors.black))        
                                          ],
                                        ),
                                      ),
                                   const SizedBox(height:20,),
                                      Padding(
                                    padding:const EdgeInsets.only(left:15),
                                    
                                    
                                                                          child: Row(
                                          children: [
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                            controller: controllerQuantity,
                                             decoration: const InputDecoration(
                                               hintText: "Quantity",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                                 ),
                                           const SizedBox(width:28),
                                           SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                            readOnly: true,
                                             decoration: const InputDecoration(
                                               hintText: "number",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                             ),
                                         const  SizedBox(width:50),
                                 InkWell(
                                 onTap: () {
                                  setState(() {
                                 passQuantityToggle = !passQuantityToggle;   
                                  });
                                    },
                               child:  Icon(passQuantityToggle?Icons.visibility_off:Icons.visibility,size:24,color:Colors.black)) 
                                          ],
                                        ),
                                      ),
                                  const SizedBox(height:20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                            controller: controllerAmount,
                                             decoration: const InputDecoration(
                                               hintText: "Amount",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                                                        ),
                                            const SizedBox(width:28,),
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                              readOnly: true,
                                             decoration: const InputDecoration(
                                               hintText: "(Rate*Quantity)",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                        ),
                                       const  SizedBox(width:50),
                                  InkWell(
                                 onTap: () {
                                  setState(() {
                                 passAmountToggle = !passAmountToggle;   
                                  });
                                    },
                               child:  Icon(passAmountToggle?Icons.visibility_off:Icons.visibility,size:24,color:Colors.black)) 
                                          ],
                                        ),
                                      ),
                                     const SizedBox(height: 20,),
                                      Padding(
                                        padding:const EdgeInsets.only(left:15),
                                        
                                        
                                                                              child: Row(
                                          children: [
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                            controller: controllerTotalTax,
                                             decoration: const InputDecoration(
                                               hintText: "Tax Total",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                              ),
                                            const  SizedBox(width:28,),
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                            readOnly: true,
                                             decoration: const InputDecoration(
                                               hintText: "(Amount*(Tax)/100)",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                              ),
                                       const  SizedBox(width:50),
                               InkWell(
                                 onTap: () {
                                  setState(() {
                                 passTotalTaxToggle = !passTotalTaxToggle;   
                                  });
                                    },
                               child:  Icon(passTotalTaxToggle?Icons.visibility_off:Icons.visibility,size:24,color:Colors.black)) 
                                          ],
                                        ),
                                      ),
                                     const SizedBox(height: 20,),
                                      Padding(
                                     padding: const EdgeInsets.only(left:15),
                                     
                                     
                                                                           child: Row(
                                          children: [
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                             controller: controllerTotal,
                                             decoration: const InputDecoration(
                                               hintText: "Total",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                               ),
                                          const  SizedBox(width:28),
                                            SizedBox(
                                            height:60,
                                            width: 100,
                                            child: TextFormField(
                                            readOnly: true,
                                             decoration: const InputDecoration(
                                               hintText: "(Amount+TaxTotal)",
                                               hintStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'),
                                                  ),
                                                      ),
                                                        ),
                                      const  SizedBox(width:50),
                                   InkWell(
                                 onTap: () {
                                  setState(() {
                                 passTotalToggle = !passTotalToggle;   
                                  });
                                    },
                               child:  Icon(passTotalToggle?Icons.visibility_off:Icons.visibility,size:24,color:Colors.black)) 
                                     
                                          ],
                                        ),
                                      ),
                                ],
                              ),
                            ),
                         Positioned(
                          bottom:46,
                          left: 50,
                           child: Row(
                           children: [
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               padding: EdgeInsets.zero,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10)),
                               elevation: 5,
                             ),
                             onPressed: () {
                               Navigator.pop(context);
                             },
                             child: Ink(
                               decoration: BoxDecoration(
                                   color: const Color(0xFFDBDBDB),
                                   borderRadius: BorderRadius.circular(10)),
                               child: Container(
                                 height:50,
                                 width: 115,
                                 constraints:  const BoxConstraints(minWidth: 88.0),
                                 child: const Center(
                                   child: Text('Cancel',
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                          fontSize: 12,
                                           fontWeight:FontWeight.w400,
                                           fontFamily: 'poppins-medium',
                                           color: Color(0xFF42566A))),
                                 ),
                               ),
                             ),
                           ),
                        const  SizedBox(
                           width: 50,
                           ),
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               padding: EdgeInsets.zero,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10)),
                               elevation: 5,
                             ),
                             onPressed: () async{
                      Provider.of<SentWhatsAppMessageProvider>(context).isSending;
                             },
                             child: Ink(
                               decoration: BoxDecoration(
                                   gradient: const LinearGradient(
                                     begin: Alignment.topCenter,
                                     end: Alignment.bottomCenter,
                                     colors: [
                                       Color(0xff39DEE8),
                                       Color(0xff42566A)
                                     ],
                                   ),
                                   borderRadius: BorderRadius.circular(10)),
                               child: Container(
                                 height:50,
                                 width: 115,
                                 constraints:
                                     const BoxConstraints(minWidth: 88.0),
                                 child: const Center(
                                   child: Text('Save Changes',
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                           fontSize: 12,
                                           fontWeight:FontWeight.w400,
                                           fontFamily: 'poppins-medium',
                                           color: Colors.white)),
                                 ),
                               ),
                               
                             ),
                           ),
                                              ],
                                            ),
                         )   ,
                           
                           
                           
                            ]),
                       )  ,              
                                                  
                       const  SizedBox(height:30,),            
         ],),
       )),
     )   
    );
  }
}





// import 'package:Invoicemint/view_model/get_fields_client.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class UpdateItemsFields extends StatefulWidget {
// const UpdateItemsFields({super.key});

//   @override
//   State<UpdateItemsFields> createState() => _UpdateItemsFieldsState();
// }

// class _UpdateItemsFieldsState extends State<UpdateItemsFields> {
// final controllerItemName =TextEditingController();
// final controllerTax =TextEditingController();
// final controllerRate =TextEditingController();
// final controllerQuantity =TextEditingController();
// final controllerAmount =TextEditingController();
// final controllerTotalTax =TextEditingController();
// final controllerTotal =TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//         elevation: 0,
//          flexibleSpace: Container(
//         decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//             colors: <Color>[Color.fromARGB(255, 65, 213, 221),Color.fromARGB(255, 77, 76, 76)]
//           ),
//         )),  
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: Colors.transparent,
//         title:const Text('                 Edit Fields',style: TextStyle(color: Colors.white,fontFamily: 'poppins-regular',fontSize: 18,fontWeight: FontWeight.w400),),
//       ), 
//       body: Column(
//         children: [
//          const  Padding(
//          padding: EdgeInsets.all(15),
//          child: Text('Edit name of fields in the invoice. Use this to edit fields like units, hours,service/product specification etc.',
//          style: TextStyle(fontFamily: 'poppins-medium',fontSize:14,color: Colors.blue,fontWeight: FontWeight.w700),),
//            ),    
//          SizedBox(
//           height: 120,
//           width: double.infinity,
//             child: FutureBuilder(
//               future: Provider.of<ClientFieldsProvider>(context, listen: false).fetchClientFields(),
//               builder: (BuildContext context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator(
//                     color: Colors.red,
//                   ));
//                 } else if (snapshot.hasError) {
//                   return const Center(child: Text('An error occurred!'));
//                 } else {
//                   return Consumer<ClientFieldsProvider>(
//                     builder: (BuildContext context, provider, child) => Column(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Table(
//                               border: TableBorder.all(color: Colors.transparent, width: 2),
//                               columnWidths: const {
//                                 0: FlexColumnWidth(.5),
//                                 1: FlexColumnWidth(.5),
//                                 2: FlexColumnWidth(.5),
//                               },
//                               children: [
//                               const TableRow(
//                               decoration: BoxDecoration(
//                               boxShadow: [
//                               BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2,
//                                 )
//                                  ],
//                             borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(18),
//                             topRight: Radius.circular(18),
//                               ),
//                             color: Color.fromARGB(255, 0, 140, 150),
//                                 ),
//                               children: [
//                             SizedBox(
//                             height: 60, 
//                             child: Padding(
//                             padding: EdgeInsets.fromLTRB(0,20, 8, 10),
//                             child: Text(
//                              'Name',
//                            style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                           ),
//                              ),
//                                ),
//                             SizedBox(
//                             height: 60,
//                             child: Padding(
//                             padding: EdgeInsets.fromLTRB(0,20, 8, 8),
//                             child: Text(
//                              'Type',
//                            style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                           ),
//                              ),
//                                ),
//                             SizedBox(
//                             height: 60,
//                             child: Padding(
//                             padding: EdgeInsets.fromLTRB(0,20, 8, 8),
//                             child: Text(
//                              'Action',
//                            style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                           ),
//                              ),
//                                ),
//                                    ],
//                                     ),
//                                 ...provider.clientFields.map((field) {
//                                   return TableRow(
//                                     children: [
//                                       Padding(
//                                      padding: const EdgeInsets.fromLTRB(8,15,30,8),
//                                         child: TextFormField(
//                                     style:const TextStyle(
//                                    fontSize: 12,
//                                    fontWeight: FontWeight.w400,
//                                    fontFamily: 'poppins-regular'
//                                        ),       
//                                           initialValue: field.fields,
//                                         ),
//                                       ),
//                                       Padding(
//                                              padding: const EdgeInsets.fromLTRB(25,15,20,8),
//                                         child: TextFormField(
//                                           style:const TextStyle(
//                                             fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'poppins-regular'
//                                           ),
//                                           initialValue: field.fieldsType,
//                                           decoration: const InputDecoration(
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                    padding: const EdgeInsets.fromLTRB(25,15,20,8),
//                                         child: IconButton(
//                                           icon: Icon(
//                                             field.hide
//                                                 ? Icons.visibility_off
//                                                 : Icons.visibility,
//                                             color: Colors.grey,
//                                           ),
//                                           onPressed: () {
//                                 Navigator.push(context,MaterialPageRoute(builder: (context)=> const UpdateItemsFields()));
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 }).toList(),
//                               ],
//                             ),
//                           ),
//                         ),
                      
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),                  
//         ],
//       ),
//     );
//   }
// }
