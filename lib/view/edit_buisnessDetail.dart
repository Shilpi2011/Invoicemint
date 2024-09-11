import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class EditBuisnessDetail extends StatefulWidget {
  const EditBuisnessDetail({super.key});

  @override
  State<EditBuisnessDetail> createState() => _EditBuisnessDetailState();
}

class _EditBuisnessDetailState extends State<EditBuisnessDetail> {
  PlatformFile? pickedFiles;
Future<void> selectFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;

  setState(() {
  });
}

 final GlobalKey<FormState> Key = GlobalKey<FormState>();
   final _dueDateController = TextEditingController(text: 'Interest Bud Solutions');
   final dateController = TextEditingController(text:'ibs.shilpi@gmail.com');
   final _addressController = TextEditingController(text: 'E212 near fng chowk,noida');
   final cityController = TextEditingController(text:'uttar Pradesh');
   final postalCodeController = TextEditingController(text: '201310');
   final buisnessController = TextEditingController(text: '2013');
   final contactController = TextEditingController(text:'8790837879');
   final countryController = TextEditingController(text:'India');
   final profileUrlController = TextEditingController(text:'http://sgyxduy.com');
   final stateController = TextEditingController(text:'Noida');
   String country_code = '';

  @override
  Widget build(BuildContext context) {
   final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final heightsize = mediaQueryData.size.height;
    final widthsize = mediaQueryData.size.width;
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
       height: heightsize,
       decoration: const BoxDecoration(
       image: DecorationImage(
       fit: BoxFit.cover,
       image: AssetImage('assets/images/invoicemint bg.png'))), 
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  
               SizedBox(
               height:180,
               width: widthsize, 
                 child: Stack(
                   children: [
                    Container(
                    height:110,
                    width: widthsize,
                    decoration:  BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                         blurRadius: 4)
                          ],
                      borderRadius: const  BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                             ),
                      image: const DecorationImage(
                       fit: BoxFit.cover,
                      image: AssetImage('assets/images/recImage.png'))),
                      child:  Padding(
                      padding: const EdgeInsets.only(top:10,bottom:35,left: 20),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                                           InkWell(
                                           onTap: () {
                                           Navigator.pop(context);
                        },
                        child:const Icon(Icons.chevron_left,color: Colors.white,size: 30,),
                                           ),  
                            const SizedBox(width:10),
                         const Text('Edit Business Details',
                          style: TextStyle(
                             color:Colors.white,
                              fontSize:17,
                              fontFamily: 'raleway-regular',
                              fontWeight: FontWeight.w800),
                           ),
                                          
                        ],),
                      ),
                      ),
                    Positioned(
                  top:60,
                  left:widthsize/2.7,
                  child: DottedBorder(
                   radius:const Radius.circular(20),
                   color:  Colors.red,
                  strokeWidth: 2,
                  dashPattern: [6, 3],
                  borderType: BorderType.RRect, 
                  child: InkWell(
                    onTap: (){
                    selectFile();  
                    },
                  child: Image.asset('assets/images/App Icon.png',scale:10,))))
               ] ),
               ), 
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Container(
                                margin: const EdgeInsets.only(left: 20,right: 20),
                               height: 80,
                               width: double.infinity,
                               decoration:const  BoxDecoration(
                                color:Colors.transparent,
                                 borderRadius:  BorderRadius.all(Radius.circular(20)),
                               ),
                                      child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                   20,
                                   0,
                                   20,
                                   0,
                                 ),
                                        child:  Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                               const  Align(
                                                     alignment: Alignment.centerLeft,
                                                     child: Text(
                                                    'Buisness Name',
                                                       textAlign: TextAlign.start,
                                                       style: TextStyle(
                                                           color: Colors.grey, fontSize: 12),
                                                     )),
                                                     const SizedBox(height: 15,),
                                                 Align(
                                                     alignment: Alignment.centerLeft,
                                                     child:SizedBox(
                                                      height: 20,
                                                      width: 250,
                                                       child: TextFormField(
                                                      controller: _dueDateController,
                                                      decoration: const InputDecoration(
                                                        labelText: "",
                                                        labelStyle:TextStyle(fontSize: 10),
                                                           ),
                                                               ),
                                                     ),),
                                               ]),
                                           const Icon(Icons.person)
                                         ]),
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                     Container(
                                margin: const EdgeInsets.only(left: 20,right: 20),
                               height: 80,
                               width: double.infinity,
                               decoration:const BoxDecoration(
                                color:Colors.transparent,
                                 borderRadius:  BorderRadius.all(Radius.circular(20)),
                               ),
                                      child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                   20,
                                   0,
                                   20,
                                   0,
                                 ),
                                        child:  Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                               const  Align(
                                                     alignment: Alignment.centerLeft,
                                                     child: Text(
                                                    'Buisness Email',
                                                       textAlign: TextAlign.start,
                                                       style: TextStyle(
                                                           color: Colors.grey, fontSize: 12),
                                                     )),
                                                     const SizedBox(height: 15,),
                                                 Align(
                                                     alignment: Alignment.centerLeft,
                                                     child:SizedBox(
                                                      height: 20,
                                                      width: 250,
                                                       child: TextFormField(
                                                        readOnly: true,
                                                      controller: dateController,
                                                      decoration: const InputDecoration(
                                                        labelText: "",
                                                        labelStyle:TextStyle(fontSize: 10),
                                                           ),
                                                               ),
                                                     ),),
                                               ]),
                                           const Icon(Icons.person)
                                         ]),
                                      ),
                                    ),
                             ],
                           ), 
                    const SizedBox(height: 20,) ,
                   const Row(
                    children: [
                       Text('       Personal Information',
                              style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway-regular',
                              fontWeight: FontWeight.w700,
                              color: Colors.black), ),
                          SizedBox(width: 15,),
                        Icon(Icons.edit,color: Colors.black,)
                    ],
                  ),
                                    const SizedBox(
                                      height:10,
                                    ),  
                                      Container(
                                  margin: const EdgeInsets.only(left: 28,right: 28),
                                 height: 80,
                                 width: double.infinity,
                                 decoration:const BoxDecoration(
                                  color:Colors.transparent,
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                 ),
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                     20,
                                     0,
                                     20,
                                     0,
                                   ),
                                          child:  Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                 const  Align(
                                                       alignment: Alignment.centerLeft,
                                                       child: Text(
                                                      'Buisness Profile Url',
                                                         textAlign: TextAlign.start,
                                                         style: TextStyle(
                                                             color: Colors.grey, fontSize: 12),
                                                       )),
                                                       const SizedBox(height: 15,),
                                                   Align(
                                                       alignment: Alignment.centerLeft,
                                                       child:SizedBox(
                                                        height: 20,
                                                        width: 250,
                                                         child: TextFormField(
                                                        controller: profileUrlController,
                                                        decoration: const InputDecoration(

                                                          labelText: "",
                                                          labelStyle:TextStyle(fontSize: 10),
                                                             ),
                                                                 ),
                                                       ),),
                                                 ]),
                                             const Icon(Icons.link)
                                           ]),
                                        ),
                                      ),
                                   const   SizedBox(height: 10,),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                 Container(
                                 height: 50,
                                 width: 160,
                                     margin: const EdgeInsets.only(left: 25),
                                 decoration:const BoxDecoration(
                                  color:Colors.transparent,
                                   borderRadius: BorderRadius.all(Radius.circular(13)),
                                 ),
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                     15,
                                     1,
                                     20,
                                     0,
                                   ),
                                          child:  Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                 const  Align(
                                                       alignment: Alignment.centerLeft,
                                                       child: Text(
                                                      'Buisness Since',
                                                         textAlign: TextAlign.start,
                                                         style: TextStyle(
                                                             color: Colors.grey, fontSize: 12),
                                                       )),
                                                       const SizedBox(height:8),
                                                   Align(
                                                       alignment: Alignment.centerLeft,
                                                       child:SizedBox(
                                                        height: 20,
                                                        width:100,
                                                         child: TextFormField(
                                                          style: const TextStyle(
                                                          fontSize: 12.0, 
                                                                ),
                                                        controller:buisnessController,
                                                        decoration: const InputDecoration(

                                                          labelText: "",
                                                          labelStyle:TextStyle(fontSize: 10),
                                                             ),
                                                                 ),
                                                       ),),
                                                 ]),
                                             const Icon(Icons.timeline_outlined,size:25,)
                                           ]),
                                        ),
                                      ), 
                                       Container(
                                   margin: const EdgeInsets.only(right: 25),
                                     height: 50,
                                     width: 160,
                                     decoration: const BoxDecoration(
                                      color:Colors.transparent,
                                       borderRadius:  BorderRadius.all(Radius.circular(13)),
                                     ),
                                            child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                         15,
                                         1,
                                         20,
                                         0,
                                       ),
                                              child:  Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                               children: [
                                                 Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                     children: [
                                                     const  Align(
                                                           alignment: Alignment.centerLeft,
                                                           child: Text(
                                                          'Phone',
                                                             textAlign: TextAlign.start,
                                                             style: TextStyle(
                                                                 color: Colors.grey, fontSize: 12),
                                                           )),
                                                           const SizedBox(height: 10),
                                                       Align(
                                                           alignment: Alignment.centerLeft,
                                                           child:SizedBox(
                                                            height: 20,
                                                            width: 90,
                                                             child: TextFormField(
                                                              style:const TextStyle(
                                                             fontSize:14 
                                                           ),
                                                            controller: contactController,
                                                            decoration: const InputDecoration(
    
                                                              labelText: "",
                                                              labelStyle:TextStyle(fontSize: 10),
                                                                 ),
                                                                     ),
                                                           ),),
                                                     ]),
                                                 const Icon(Icons.phone,size:20)
                                               ]),
                                            ),
                                          ),
            
                 ],
               ),  
               const SizedBox(
                                      height:10,
                                    ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                   Container(
                                   margin: const EdgeInsets.only(left: 25),
                                     height: 50,
                                     width: 160,
                                     decoration: BoxDecoration(
                                      color:Colors.transparent,
                                       borderRadius: const BorderRadius.all(Radius.circular(13)),
                                     ),
                                            child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                         15,
                                         1,
                                         20,
                                         0,
                                       ),
                                              child:  Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                               children: [
                                                 Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                     children: [
                                                     const  Align(
                                                           alignment: Alignment.centerLeft,
                                                           child: Text(
                                                          'Country',
                                                             textAlign: TextAlign.start,
                                                             style: TextStyle(
                                                                 color: Colors.grey, fontSize: 12),
                                                           )),
                                                           const SizedBox(height: 10),
                                                       Align(
                                                           alignment: Alignment.centerLeft,
                                                           child:SizedBox(
                                                            height: 20,
                                                            width: 90,
                                                             child: TextFormField(
                                                              style:const TextStyle(
                                                             fontSize:14 
                                                           ),
                                                            controller: countryController,
                                                            decoration: const InputDecoration(
    
                                                              labelText: "",
                                                              labelStyle:TextStyle(fontSize: 10),
                                                                 ),
                                                                     ),
                                                           ),),
                                                     ]),
                                                 const Icon(Icons.location_history,size:20)
                                               ]),
                                            ),
                                          ),
                                 Container(
                                 height: 50,
                                 width: 160,
                                     margin: const EdgeInsets.only(right: 25),
                                 decoration: BoxDecoration(
                                  color:Colors.transparent,
                                   borderRadius: const BorderRadius.all(Radius.circular(13)),
                                 ),
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                     15,
                                     1,
                                     20,
                                     0,
                                   ),
                                          child:  Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                 const  Align(
                                                       alignment: Alignment.centerLeft,
                                                       child: Text(
                                                      'State',
                                                         textAlign: TextAlign.start,
                                                         style: TextStyle(
                                                             color: Colors.grey, fontSize: 12),
                                                       )),
                                                       const SizedBox(height:8),
                                                   Align(
                                                       alignment: Alignment.centerLeft,
                                                       child:SizedBox(
                                                        height: 20,
                                                        width:100,
                                                         child: TextFormField(
                                                          style: const TextStyle(
                                                          fontSize: 14.0, 
                                                                ),
                                                        controller:stateController,
                                                        decoration: const InputDecoration(

                                                          labelText: "",
                                                          labelStyle:TextStyle(fontSize: 10),
                                                             ),
                                                                 ),
                                                       ),),
                                                 ]),
                                             const Icon(Icons.location_city,size:25,)
                                           ]),
                                        ),
                                      ), 
                                                 
                 ],
               ), 
                       const  SizedBox(height: 10,),
                                           Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                   Container(
                                   margin: const EdgeInsets.only(left: 25),
                                     height: 50,
                                     width: 160,
                                     decoration: BoxDecoration(
                                      color:Colors.transparent,
                                       borderRadius: const BorderRadius.all(Radius.circular(13)),
                                     ),
                                            child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                         15,
                                         1,
                                         20,
                                         0,
                                       ),
                                              child:  Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                               children: [
                                                 Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                                     children: [
                                                     const  Align(
                                                           alignment: Alignment.centerLeft,
                                                           child: Text(
                                                          'City',
                                                             textAlign: TextAlign.start,
                                                             style: TextStyle(
                                                                 color: Colors.grey, fontSize: 12),
                                                           )),
                                                           const SizedBox(height: 10),
                                                       Align(
                                                           alignment: Alignment.centerLeft,
                                                           child:SizedBox(
                                                            height: 20,
                                                            width: 90,
                                                             child: TextFormField(
                                                              style:const TextStyle(
                                                             fontSize:14 
                                                           ),
                                                            controller: cityController,
                                                            decoration: const InputDecoration(
    
                                                              labelText: "",
                                                              labelStyle:TextStyle(fontSize: 10),
                                                                 ),
                                                                     ),
                                                           ),),
                                                     ]),
                                                 const Icon(Icons.location_city_sharp,size:20)
                                               ]),
                                            ),
                                          ),
                                 Container(
                                 height: 50,
                                 width: 160,
                                     margin: const EdgeInsets.only(right: 25),
                                 decoration: BoxDecoration(
                                  color:Colors.transparent,
                                   borderRadius: const BorderRadius.all(Radius.circular(13)),
                                 ),
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                     15,
                                     1,
                                     20,
                                     0,
                                   ),
                                          child:  Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                 const  Align(
                                                       alignment: Alignment.centerLeft,
                                                       child: Text(
                                                      'Postal Code',
                                                         textAlign: TextAlign.start,
                                                         style: TextStyle(
                                                             color: Colors.grey, fontSize: 12),
                                                       )),
                                                       const SizedBox(height:8),
                                                   Align(
                                                       alignment: Alignment.centerLeft,
                                                       child:SizedBox(
                                                        height: 20,
                                                        width:100,
                                                         child: TextFormField(
                                                          style: const TextStyle(
                                                          fontSize: 14.0, 
                                                                ),
                                                        controller:postalCodeController,
                                                        decoration: const InputDecoration(

                                                          labelText: "",
                                                          labelStyle:TextStyle(fontSize: 10),
                                                             ),
                                                                 ),
                                                       ),),
                                                 ]),
                                             const Icon(Icons.pin_drop,size:25,)
                                           ]),
                                        ),
                                      ), 
                                                 
                 ],
               ),
                     const  SizedBox(height: 10,),
                                                   Container(
                                margin: const EdgeInsets.only(left: 28,right: 28),
                               height: 80,
                               width: double.infinity,
                               decoration: BoxDecoration(
                                color:Colors.transparent,
                                 borderRadius: const BorderRadius.all(Radius.circular(20)),
                               ),
                                      child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                   20,
                                   0,
                                   20,
                                   0,
                                 ),
                                        child:  Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                               const  Align(
                                                     alignment: Alignment.centerLeft,
                                                     child: Text(
                                                    'Street Address',
                                                       textAlign: TextAlign.start,
                                                       style: TextStyle(
                                                           color: Colors.grey, fontSize: 12),
                                                     )),
                                                     const SizedBox(height: 15,),
                                                 Align(
                                                     alignment: Alignment.centerLeft,
                                                     child:SizedBox(
                                                      height: 20,
                                                      width: 250,
                                                       child: TextFormField(
                                                      controller: _addressController,
                                                      decoration: const InputDecoration(
                                                        labelText: "",
                                                        labelStyle:TextStyle(fontSize: 10),
                                                           ),
                                                               ),
                                                     ),),
                                               ]),
                                           const Icon(Icons.link)
                                         ]),
                                      ),
                                    ),
                                  const  SizedBox(height: 20,),
                             Center(
                               child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)),
                                                       elevation: 5,
                                                      ),
                                                      onPressed: () {
                                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminLogin()));
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
                                                         height: 50,
                               width: 175,
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
                            const SizedBox(height: 20,)
                ],
                ),
            ),
          ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            
        ),
      ),
    );
  }

}


