import 'package:Invoicemint/utils/global.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

class EditUserInvoice extends StatefulWidget {
  const EditUserInvoice({super.key});

  @override
  State<EditUserInvoice> createState() => _EditUserInvoiceState();
}

class _EditUserInvoiceState extends State<EditUserInvoice> {
  PlatformFile? pickedFiles;
bool selectedBuisness = false;
bool selectedClient = false;
bool changedBuisness = false;
bool changedClient = false;
String countryCode = '';
 String countryName ='';
 String selectedCountryCode = '';
 String newBusiness='';
 String country_code = '';
 String currency_code='';
String changeBuisness= 'add_business';
String changeClient= 'add_Client';

 final Controller = TextEditingController(); 
 final searchController = TextEditingController();
 final _invoiceDateController = TextEditingController();
 final _dueDateController = TextEditingController();
 final _addressController = TextEditingController(text: 'tuytqwt');
 final cityController = TextEditingController(text:'delhi');
 final postalCodeController = TextEditingController(text:'93872');
 final stateController = TextEditingController();
 final itemNameController = TextEditingController();
 final taxController = TextEditingController();
 final rateController = TextEditingController();
 final quantityController = TextEditingController();
 final amountController = TextEditingController();
  final taxTotalController = TextEditingController();
 final totalController = TextEditingController();
 final descriptionController = TextEditingController();
  String? _selectedCurrencyCode = 'Currency';
String? _selectedCountryName = 'Country Name';
String? currencyName = 'Currency';
 String? selectedDiscountType;
 String? selectedBank;

  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isInvoiceDate) async {
    DateTime now = DateTime.now();
    DateTime initialDate = now;
    if (controller.text.isNotEmpty) {
      initialDate = DateFormat('dd/MM/yyyy').parse(controller.text);
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(picked);
        if (isInvoiceDate) {
          DateTime dueDate = picked.add(const Duration(days: 20));
          _dueDateController.text = DateFormat('dd/MM/yyyy').format(dueDate);
        }
      });
    }
  }
  


Future<void> selectFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;

  setState(() {
  });
}
SignatureController controller = SignatureController(
penStrokeWidth: 3,
penColor: const Color.fromARGB(255, 23, 190, 196),
exportBackgroundColor: Colors.yellowAccent,
  );

bool showItemData =false; 

final List<String> buisnessTypes = [
    'IBS',
    'hcl pvt. ltd',
    'Blossosm',
    'Deutshce Bank'
  ];
String? selectedBuisnessType;


final List<String> discountTypes = [
          '%',
          'Amount',
            ];  
final List<String> bankList = [
  'Bank of Baroda',
  'PNB',
  'SBI'
];





   final _countryController = TextEditingController();
   final GlobalKey<FormState> Key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
 final widthSize = MediaQuery.of(context).size.width; 
 return Scaffold(
body: Container(
     width: widthSize,
      decoration: const BoxDecoration(
     image: DecorationImage(
     fit: BoxFit.cover,
     image: AssetImage('assets/images/invoicemint bg.png'))), 
     child: SingleChildScrollView(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
            height:80,
            width: widthSize,
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
              padding: const EdgeInsets.only(top:15,left: 20),
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
                const SizedBox(width:95),
                 const Text('Edit Invoice',
                  style: TextStyle(
                     color:Colors.white,
                      fontSize:17,
                      fontFamily: 'poppins-regular',
                      fontWeight: FontWeight.w800),
                   ),
                                  
                ],),
              ),
              ), 
               const SizedBox(height: 20,)  ,
                   Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [       
                        Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                       const Text('   #Invoice No. : 1',
                        style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily:'poppins-regular'
                         ),),
                        const SizedBox(height:5,),
                           InkWell(
                            onTap: (){
                            selectFile();  
                            },
                  child: Container(
                             height:90,
                            width:140,
                            decoration: const BoxDecoration(
                            color:Color(0xFF42566A),
                            boxShadow: [BoxShadow(
                            color: Colors.grey,
                            blurRadius:1
                              )],
                            borderRadius: BorderRadius.all(Radius.circular(15))
                              ),  
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(CustomIcons.group_475,color: Colors.white,),
                              SizedBox(height:10),
                             Text('Buisness Logo',style: TextStyle(fontWeight:FontWeight.w300,fontFamily: 'poppins-regular',fontSize: 13,color: Colors.white),)
                              ],
                            )),
                  ),
                         ],
                       ),
                const  SizedBox(width:15),
                 Padding(
                     padding: const EdgeInsets.only(top:10),
                     child: Column(
                       children: [
                         Container(
                                     height: 50,
                                     width: 160,
                                         margin: const EdgeInsets.only(left: 25),
                                     decoration: BoxDecoration(
                                    color:  Colors.white,
                                    border: Border.all(color: Colors.teal),
                                        boxShadow: [
                                             BoxShadow(
                                             color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 4)
                                                          ],
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
                                                 Align(
                                            alignment: Alignment.centerLeft,
                                            child:SizedBox(
                                            height: 20,
                                            width:100,
                                            child: TextFormField(
                                            style: const TextStyle(
                                            fontSize: 12.0, 
                                                   ),
                                            controller:_invoiceDateController,
                                                 decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                        hintText: "Select Invoice Date",
                                                        hintStyle:TextStyle(fontSize: 10,color: Colors.black,fontFamily: 'poppins-regular'),
                                                           ),
                                                               ),
                                                     ),),
                                                 InkWell(
                                               onTap: (){
                                         _selectDate(context, _invoiceDateController, true);
                                                },
                                         child:const Icon(CustomIcons.group_484,color: Colors.black,size: 20,),
                                                   )
                                               ]),
                                            ),
                                          ), 
                        const SizedBox(height: 15,),
                          Container(
                                     height: 50,
                                     width: 160,
                                         margin: const EdgeInsets.only(left: 25),
                                     decoration: BoxDecoration(
                                    color:  Colors.white,
                                    border: Border.all(color: Colors.teal),
                                        boxShadow: [
                                             BoxShadow(
                                             color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 4)
                                                          ],
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
                                                 Align(
                                                     alignment: Alignment.centerLeft,
                                                     child:SizedBox(
                                                      height: 20,
                                                      width:100,
                                                       child: TextFormField(
                                                        style: const TextStyle(
                                                        fontSize: 12.0, 
                                                              ),
                                                      controller:_dueDateController,
                                                 decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                 hintText: "Select Due Date",
                                                        hintStyle:TextStyle(fontSize: 10,color: Colors.black,fontFamily: 'poppins-regular'),
                                                           ),
                                                               ),
                                                     ),),
                                                 InkWell(
                                               onTap: (){
                                         _selectDate(context, _invoiceDateController, false);
                                                },
                                         child:const Icon(CustomIcons.group_484,color: Colors.black,size: 20,),
                                                   )
                                               ]),
                                            ),
                                          ), 
                       ],
                     ),
                   ), 
                     ],
                   ),
                       const SizedBox(height: 20,)  ,
                         Padding(
                           padding: const EdgeInsets.only(right:25),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                             const  Text('     Billed By',
                                  style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'poppins-medium',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black), ),
                      InkWell(
                       onTap: (){
                     showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: true,
                         shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                        builder:(BuildContext context){
                        return  Container(
                        height: 400,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height:60,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Row(
                           children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: InkWell(
                              onTap: () {
                               Navigator.pop(context);  
                                },
                              child: const Icon(Icons.chevron_left,color: Colors.white,size:25,)),
                            ),
                              const  Center(
                                  child:  Text(
                                      'Edit Details',
                                      style: TextStyle(
                                          fontSize:16,
                                          color: Colors.white,
                                          fontFamily: 'poppins-regular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                ), 
                                ],
                              ),
                            ),
                            const SizedBox(height:30),
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:15,right:10),
                                            child: TextFormField( 
                                              readOnly: true,
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: _countryController,
                                               validator:(value) {
                                                if (value!.isEmpty) {
                                               return ('Select Country');
                                                      }
                                                 return null;
                                                    },
                                             decoration:  InputDecoration(
                                              suffixIconConstraints: const BoxConstraints(maxWidth: 50),
                                              suffixIcon:  CountryCodePicker(
                                              flagWidth: 20,
                                              padding:const EdgeInsets.all(0),
                                              onChanged: (value) {
                                             _countryController.text = value.name ?? '';
                                               setState(() {
                                            selectedCountryCode = value.code ?? '';
                                                  });
                                              },
                                              initialSelection: 'US',
                                             hideMainText: true,
                                            
                                              favorite: const ['+91', 'IN'],
             
                                            ),
                                        label: const Text("Country"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                           Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:0.0,right:15),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: stateController,
                                             decoration:  InputDecoration(
                                              suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:0),
                                               child: Icon(Icons.maps_home_work_outlined,color: Colors.black45,size:20,)
                                               ),
                                              label: const Text("State"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g. Uttar Pradesh",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                      ]), 
                                         const  SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:15,right:10),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: cityController,
                                             decoration:  InputDecoration(
                                                suffixIcon:  Padding(
                                                padding: const EdgeInsets.only(right:0),
                                                    child: Image.asset(
                                                 'assets/images/buildings.png',
                                                  height: 20,
                                                  width: 30,
                                                  ),
                                                  ),
                                              suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("City"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g Noida",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                           Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:0,right:15),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: postalCodeController,
                                             decoration:  InputDecoration(
                                              suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:0),
                                               child: Icon(Icons.pin_drop_outlined,color: Colors.black54,size:20,)
                                               ),
                                              label: const Text("Postal Code"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g.201021",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                      ]), 
                                         const  SizedBox(height: 10,),
                                 const  SizedBox(height: 10,),
                                             Padding(
                                               padding: const EdgeInsets.only(left:15,right:15),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: _addressController,
                                                decoration:  InputDecoration(
                                                   suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
                                                    child: Image.asset(
                                                 'assets/images/location.png',
                                                  height: 20,
                                                  width: 30,
                                                  ),
                                                  ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("  Street Address"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g Noida",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
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
                                                    Navigator.pop(context);
                                                    setState(() {
                                                   showItemData = true;  
                                                    });
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
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white)),
                                   ),
                                                            ),
                                                          ),
                                                        ),
                                 ),
                          ],
                        ),
                      );
                        });                
                              },
                        child: Image.asset('assets/images/edit.png',scale:30)),   
                             ],
                           ),
                         ),
                Padding(
                padding: const EdgeInsets.only(left:15,right:15,top:5),
                child: Container(
               padding: const EdgeInsets.only(left:15,right:8,top:5),
                  height:130,
                 decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.5
                    )
                  ]
                  ),
            child:Row( 
               children: [
              Column( 
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                       Text('Business Name',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                       ), 
                      const SizedBox(height:5),
                       Text('Address',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                        ), 
                      const SizedBox(height:5),
                       Text('CIN',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                      ),
                         const SizedBox(height:5),
                      Text('Company Pan',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                      ), 
                         const SizedBox(height:5),
                        Text('GSTIN',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                      ),     
                     ],
                    ),
                   const SizedBox(width: 20,),
                  Column(
                     children: [
                    Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                     const SizedBox(height:5),  
                      Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                      const SizedBox(height:5),
                       Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,   
                             const SizedBox(height:5),      
                     Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                      const SizedBox(height:5),
                       Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                     ],
                    ),
                 const Column( 
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                       Text('      Interest Bud Solutions Pvt Ltd',
                       style: TextStyle(
                       fontSize:10, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                       ), 
                   SizedBox(height:5),
                       Text('      E212 Eblock sector 63, noida',
                       style: TextStyle(
                       fontSize:10, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                        ), 
                      SizedBox(height:5),
                       Text('      67286874',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                      ),
                         SizedBox(height:5),
                      Text('      62348343',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                      ), 
                         SizedBox(height:5),
                        Text('      3497859347',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                      ),     
                     ],
                    ),
                         ],
                        )  ,
                  ),
                  ),
              const SizedBox(height: 20,)  ,
                     Padding(
                       padding: const EdgeInsets.only(left:5.0,right:25),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         const  Text('     Billed To',
                              style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black), ),
                          InkWell(
                          onTap:(){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: true,
                         shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                        builder:(BuildContext context){
                        return  Container(
                        height: 400,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height:60,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Row(
                           children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: InkWell(
                              onTap: () {
                               Navigator.pop(context);  
                                },
                              child: const Icon(Icons.chevron_left,color: Colors.white,size:25,)),
                            ),
                              const  Center(
                                  child:  Text(
                                      'Edit Details',
                                      style: TextStyle(
                                          fontSize:16,
                                          color: Colors.white,
                                          fontFamily: 'poppins-regular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                ), 
                                ],
                              ),
                            ),
                            const SizedBox(height:30),
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:15,right:10),
                                            child: TextFormField( 
                                              readOnly: true,
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: _countryController,
                                               validator:(value) {
                                                if (value!.isEmpty) {
                                               return ('Select Country');
                                                      }
                                                 return null;
                                                    },
                                             decoration:  InputDecoration(
                                              suffixIconConstraints: const BoxConstraints(maxWidth: 50),
                                              suffixIcon:  CountryCodePicker(
                                              flagWidth: 20,
                                              padding:const EdgeInsets.all(0),
                                              onChanged: (value) {
                                             _countryController.text = value.name ?? '';
                                               setState(() {
                                            selectedCountryCode = value.code ?? '';
                                                  });
                                              },
                                              initialSelection: 'US',
                                             hideMainText: true,
                                            
                                              favorite: const ['+91', 'IN'],
             
                                            ),
                                        label: const Text("Country"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                           Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:0.0,right:15),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: stateController,
                                             decoration:  InputDecoration(
                                              suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:0),
                                               child: Icon(Icons.maps_home_work_outlined,color: Colors.black45,size:20,)
                                               ),
                                              label: const Text("State"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g. Uttar Pradesh",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                      ]), 
                                         const  SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:15,right:10),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: cityController,
                                             decoration:  InputDecoration(
                                                suffixIcon:  Padding(
                                                padding: const EdgeInsets.only(right:0),
                                                    child: Image.asset(
                                                 'assets/images/buildings.png',
                                                  height: 20,
                                                  width: 30,
                                                  ),
                                                  ),
                                              suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("City"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g Noida",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                           Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:0,right:15),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: postalCodeController,
                                             decoration:  InputDecoration(
                                              suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:0),
                                               child: Icon(Icons.pin_drop_outlined,color: Colors.black54,size:20,)
                                               ),
                                              label: const Text("Postal Code"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g.201021",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                      ]), 
                                         const  SizedBox(height: 10,),
                                 const  SizedBox(height: 10,),
                                             Padding(
                                               padding: const EdgeInsets.only(left:15,right:15),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: _addressController,
                                                decoration:  InputDecoration(
                                                   suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
                                                    child: Image.asset(
                                                 'assets/images/location.png',
                                                  height: 20,
                                                  width: 30,
                                                  ),
                                                  ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("  Street Address"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g Noida",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
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
                                                    Navigator.pop(context);
                                                    setState(() {
                                                   showItemData = true;  
                                                    });
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
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white)),
                                   ),
                                                            ),
                                                          ),
                                                        ),
                                 ),
                          ],
                        ),
                      );
                        });                
                            },
                           child: Image.asset('assets/images/edit.png',scale:30))
                         ],
                       ),
                     ),
                  Padding(
                padding: const EdgeInsets.only(left:15,right:15,top:5),
                child: Container(
               padding: const EdgeInsets.only(left:15,right:8,top:5),
                  height:130,
                 decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.5
                    )
                  ]
                  ),
            child:Row( 
               children: [
              Column( 
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                       Text('Business Name',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                       ), 
                      const SizedBox(height:5),
                       Text('Address',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                        ), 
                      const SizedBox(height:5),
                       Text('CIN',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                      ),
                         const SizedBox(height:5),
                      Text('Company Pan',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                      ), 
                         const SizedBox(height:5),
                        Text('GSTIN',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.grey.shade600),
                      ),     
                     ],
                    ),
                   const SizedBox(width: 20,),
                  Column(
                     children: [
                    Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                     const SizedBox(height:5),  
                      Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                      const SizedBox(height:5),
                       Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,   
                             const SizedBox(height:5),      
                     Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                      const SizedBox(height:5),
                       Text('       :',
                        style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),) ,
                     ],
                    ),
                 const Column( 
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                       Text('      Interest Bud Solutions Pvt Ltd',
                       style: TextStyle(
                       fontSize:10,
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                       ), 
                   SizedBox(height:5),
                       Text('      E212 Eblock sector 63, noida',
                       style: TextStyle(
                       fontSize:10, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                        ), 
                      SizedBox(height:5),
                       Text('      67286874',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                      ),
                         SizedBox(height:5),
                      Text('      62348343',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                      ), 
                         SizedBox(height:5),
                        Text('      3497859347',
                       style: TextStyle(
                       fontSize:13, 
                       fontFamily: 'poppins-regular',
                       fontWeight: FontWeight.w500,
                       color:  Colors.black),
                      ),     
                     ],
                    ),
                         ],
                        )  ,
                  ),
                  ),
                    const SizedBox(height: 20,),
                       Padding(
                         padding: const EdgeInsets.only(left:10,right:25),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text('     Items',
                               style: TextStyle(
                               fontSize: 16,
                               fontFamily: 'poppins-medium',
                               fontWeight: FontWeight.w500,
                               color: Colors.black), ),
           InkWell(
           onTap: () {
          showCurrencyPicker(
          context: context,
          onSelect: (Currency currency) {
            setState(() {
              _selectedCountryName = currency.flag;
              _selectedCurrencyCode = currency.symbol; 
              currencyName ='${_selectedCurrencyCode}-${_selectedCountryName}';
            });
          },
        );
      },
      child: Container(
        height: 35,
        width: 90,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
            currencyName ?? 'Currency', 
              textAlign: TextAlign.start,
              style:const TextStyle(
                fontFamily: 'poppins-medium',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:13,
              ),
            ),
         const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
               ],
              ),
               ),
              ),
                          ],
                       ),
                       ),
                        const SizedBox(height:2),
     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: const Color.fromARGB(255, 0, 140, 150),
      child: ExpansionTile(
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text(
          "MacBook Pro",
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'poppins-medium',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        children: [
          Container(
            height:235,
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
              color: Colors.white
              ),
            child: Column(
              children: [
               const Padding(
                  padding: EdgeInsets.only(top:20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Item Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Tax Rate",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Rate",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Amount",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Tax Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HeadPhone",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "10%",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "1299",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "32456",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "3450",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "28900",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                alignment:Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    ),
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: const Color.fromARGB(255, 0, 140, 150),
      child: ExpansionTile(
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text(
          "HeadPhones Speaker",
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'poppins-medium',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        children: [
          Container(
            height:235,
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
              color: Colors.white
              ),
            child: Column(
              children: [
               const Padding(
                  padding: EdgeInsets.only(top:20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Item Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Tax Rate",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Rate",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Amount",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Tax Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HeadPhone",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "10%",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "1299",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "32456",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "3450",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "28900",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                alignment:Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    ),
    

                         InkWell(
                        onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: true,
                         shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                        builder:(BuildContext context){
                        return  Container(
                        height: 500,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height:60,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: InkWell(
                              onTap: () {
                               Navigator.pop(context);  
                                },
                              child: const Icon(Icons.chevron_left,color: Colors.white,size:25,)),
                            ),
                           const SizedBox(width:10),
                                const  Text(
                                    'Add Items',
                                    style: TextStyle(
                                        fontSize:16,
                                        color: Colors.white,
                                        fontFamily: 'poppins-regular',
                                        fontWeight: FontWeight.bold),
                                  ), 
                               
                                ],
                              ),
                            ),
                           const  SizedBox(height: 10),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:30.0),
                                  child: Column(
                                    children: [
                            Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const SizedBox(height: 20,)  ,
                        const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           ],
                           ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:15.0),
                            child: Container(
                              height: 70,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                               color: Colors.grey,
                              blurRadius: 1.5
                                )
                              ]
                              ),
                              child: TextFormField(
                              controller:itemNameController,
                              decoration:const  InputDecoration(
                                border:InputBorder.none,
                                labelText: "Item Name/Service etc.",
                                labelStyle:TextStyle(fontSize: 14),
                                         ),
                                       ),
                            ),
                          ),
                           const SizedBox(height: 20,)  ,
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal:15.0),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height:60,
                                width: 170,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                 color: Colors.grey,
                                blurRadius: 1.5
                                  )
                                ]
                                ),
                                child: TextFormField(
                                 controller: taxController,
                                   keyboardType: TextInputType.number,
                                 decoration: const InputDecoration(
                                  border:InputBorder.none,
                                   labelText: "Tax Rate%",
                                   labelStyle:TextStyle(fontSize: 13),
                                      ),
                                          ),
                              ),
                                 Container(
                                height:60,
                                width: 170,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                 color: Colors.grey,
                                blurRadius: 1.5
                                  )
                                ]
                                ),
                                   child: TextFormField(
                                    controller: rateController,
                                      keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border:InputBorder.none,
                                      labelText: "Enter Rate%",
                                      labelStyle:TextStyle(fontSize: 14),
                                         ),
                                             ),
                                 ), 
                            ],
                                             ),
                         ), 
                          const SizedBox(height: 20,)  ,
                        Padding(
                         padding: const EdgeInsets.symmetric(horizontal:15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                             height:60,
                                width: 170,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                 color: Colors.grey,
                                blurRadius: 1.5
                                  )
                                ]
                                ),
                                child: TextFormField(
                                 controller: quantityController,
                                   keyboardType: TextInputType.number,
                                 decoration: const InputDecoration(
                                  border:InputBorder.none,
                                   labelText: "Enter Quantity",
                                   labelStyle:TextStyle(fontSize: 13),
                                      ),
                                          ),
                              ),
                                 Container(
                               height:60,
                                width: 170,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                 color: Colors.grey,
                                blurRadius: 1.5
                                  )
                                ]
                                ),
                                   child: TextFormField(
                                    controller: taxTotalController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border:InputBorder.none,
                                      labelText: "Enter Amount",
                                      labelStyle:TextStyle(fontSize: 13),
                                         ),
                                             ),
                                 ), 
                            ],
                          ),
                        ), 
                         const SizedBox(height: 20,)  ,
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                            height:60,
                                width: 170,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                 color: Colors.grey,
                                blurRadius: 1.5
                                  )
                                ]
                                ),
                                child: TextFormField(
                                 controller: taxTotalController,
                                   keyboardType: TextInputType.number,
                                 decoration: const InputDecoration(
                                  border:InputBorder.none,
                                   labelText: "Enter Tax Total",
                                   labelStyle:TextStyle(fontSize: 13),
                                      ),
                                          ),
                              ),
                                 Container(
                               height:60,
                                width: 170,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                 color: Colors.grey,
                                blurRadius: 1.5
                                  )
                                ]
                                ),
                                   child: TextFormField(
                                  controller: totalController,
                                  keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border:InputBorder.none,
                                      labelText: "Enter Total",
                                      labelStyle:TextStyle(fontSize: 13),
                                         ),
                                             ),
                                 ), 
                            ],
                          ),
                        ), 
                         const SizedBox(height: 20,)  ,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:15.0),
                          child: Container(
                             height:70,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                               color: Colors.grey,
                              blurRadius: 1.5
                                )
                              ]
                              ),
                            child: TextFormField(
                                   controller: descriptionController,
                                     keyboardType: TextInputType.number,
                                   decoration: const InputDecoration(
                                    border:InputBorder.none,
                                     labelText: "Description Here... ",
                                     labelStyle:TextStyle(fontSize: 13),
                                        ),
                                            ),
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
                                                    Navigator.pop(context);
                                                    setState(() {
                                                   showItemData = true;  
                                                    });
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
                                     child: Text('Submit',
                                         textAlign: TextAlign.center,
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white)),
                                   ),
                                                            ),
                                                          ),
                                                        ),
                                 ),
                        ],
                       ),        
                                   
                                                            
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                        });
    
    
                        },
                        child: Container(
                        height:55,
                        padding: const EdgeInsets.symmetric(horizontal:15),
                       margin:const EdgeInsets.symmetric(horizontal:20),
                        width: double.infinity,
                        decoration:const BoxDecoration(
                          color:Color.fromARGB(255, 0, 140, 150),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.plus_circle_fill ,color: Colors.white,),
                            SizedBox(width: 10,),
                                    Text('Add Items                 '        ,
                                    style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'poppins-medium',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),),
                          ],
                        ),
                        ),
                      ),
             const SizedBox(height:30),
              Padding(
                     padding: const EdgeInsets.symmetric(horizontal:15),
                     child: Container(
                     padding: const EdgeInsets.symmetric(horizontal:10,),
                     height: 240,
                     decoration:const BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 0.5)
                     ],
                     borderRadius:BorderRadius.all(Radius.circular(14))
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const  SizedBox(height:20),
                             const Row( 
                              children: [
                              Column( 
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                      Text('   Deductions',
                                      style: TextStyle(
                                      fontSize:18, 
                                      fontFamily: 'poppins-medium',
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xf7070704F)),
                                              ), 
                                   SizedBox(height:5),
                                      Text('   Amount',
                                      style: TextStyle(
                                      fontSize:18, 
                                      fontFamily: 'poppins-medium',
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xf7070704F)),
                                       ), 
                                           SizedBox(height:5),
                                      Text('   Tax',
                                      style: TextStyle(
                                      fontSize:18, 
                                      fontFamily: 'poppins-medium',
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xf7070704F)),
                                        ), 
                                    ],
                                   ),
                                    SizedBox(width: 20,),
                                   Column(
                                    children: [
                                        Text('       :',
                                       style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'poppins-medium',
                                       fontWeight: FontWeight.w500,
                                       color: Color(0xf7070704F)),) ,
                                             SizedBox(height:5),                           
                                         Text('       :',
                                       style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'poppins-medium',
                                       fontWeight: FontWeight.w500,
                                       color: Color(0xf7070704F)),) ,
                                                  SizedBox(height:5),
                                          Text('       :',
                                       style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'poppins-medium',
                                       fontWeight: FontWeight.w500,
                                       color: Color(0xf7070704F)),) ,
                                    ],
                                   ),
                                              Column(
                                                children: [
                                                Text('                          0.00',
                                                 style: TextStyle(
                                                 fontSize:18,
                                                 fontFamily: 'roboto-regular',
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.black),),
                                                   SizedBox(height:5),
                                                 Text('                          0.00',
                                                 style: TextStyle(
                                                 fontSize:18,
                                                 fontFamily: 'roboto-regular',
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.black),),
                                                            SizedBox(height:5),
                                                  Text('                          0.00',
                                                 style: TextStyle(
                                                 fontSize: 18,
                                                 fontFamily: 'roboto-regular',
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.black),),
                                             ],
                                           )
                                    ],
                                  )  ,
                             const SizedBox(height:5),
                              InkWell(
                                onTap: () {
                   showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            width: 300.0,
            height: 200.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
              height:50,
              decoration: const BoxDecoration(
              gradient: LinearGradient(
               begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: <Color>[Color.fromARGB(255, 65, 213, 221),Color.fromARGB(255, 77, 76, 76)]
          ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                  ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Icon(CustomIcons.group_490,color: Colors.white,size:25,),
             SizedBox(width:5),
           Text('Add Discount',style: TextStyle(fontSize:16,color:Colors.white),),
                    ],
                  ),
                ),
             const SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                const SizedBox(
                  width: 80,
                  child:TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: ' 0.0',
                      ),
                    ),
            ),
              Container(
                width:110,
                decoration: const BoxDecoration(
              gradient: LinearGradient(
               begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 196, 242, 245), Color.fromARGB(255, 243, 211, 211)],
          ),
                borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                child: Center(
                  child: DropdownButtonFormField<String>( 
                            decoration:const  InputDecoration(
                                           border: InputBorder.none,),
                                             style: const TextStyle(color: Colors.black),
                                            isExpanded: true,
                                             items: discountTypes.map((String type) {
                                            return DropdownMenuItem<String>(
                                           value: type,
                                           child: Center(
                                            child: Text(
                                             type,
                                              style: const TextStyle(
                                              fontFamily: 'poppins-medium',
                                              color: Colors.black,
                                              fontSize: 14,
                                              ),
                                            ),
                                          ),
                                         );
                                       }).toList(),
                                        onChanged: (value) {
                                        setState(() {
                                       selectedDiscountType = value;
                                      });
                                       print(value);
                                       },
                                         value:selectedDiscountType,
                                                ),
                ),
              ),
            ],
          ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              TextButton(
                child:const Text('Cancel',style: TextStyle(fontSize:16,color:Colors.teal,fontFamily:'poppins-medium'),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child:const  Text('OK',style: TextStyle(fontSize:16,color:Colors.teal,fontFamily:'poppins-medium'),),
                onPressed: () {
                  // Handle OK action
                  Navigator.of(context).pop();
                },
              ),
              ],
                      ),
            )
                ],
              ),
            ),
        );
      },
    );
                                },
                                child: const Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                 Icon(CustomIcons.group_490,color: Colors.blue,size: 20,),
                                 Text(' Give Discount On Total',
                                  style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'poppins-medium',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                                 )
                                 ],
                                                           ),
                              ),
                              const SizedBox(height:5),
                               const Divider(
                             indent:10,
                            endIndent: 20,
                          color:Color.fromARGB(110, 153, 152, 152),
                          thickness: 1,
                          ), 
                            const SizedBox(height:10),
                          const Padding(
                            padding: EdgeInsets.symmetric( horizontal:10.0),
                            child: Row(
                            children: [
                             Text(' Total ( INR )          :   ',
                            style: TextStyle(
                            fontSize:18, 
                            fontFamily: 'poppins-medium',
                            fontWeight: FontWeight.w500,
                            color:Color(0xf7070704F)),
                                    ), 
                            Text('                   0.00',
                            style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'roboto-regular',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                              ],
                            ),
                          )  ,
                          const SizedBox(height:10),
                               const Divider(
                             indent:10,
                            endIndent:20,
                          color:Color.fromARGB(110, 153, 152, 152),
                          thickness: 1,
                          ), 
                          ],
                        ),
                      ),
                   ),
                  const SizedBox(height: 30,),
                const Align(
                 alignment: Alignment.centerLeft,
                 child: Padding(
                 padding: EdgeInsets.symmetric(horizontal:20,),
                 child: Text(
                  'Important Notes',
                   style: TextStyle(
                   fontSize: 15,
                   fontFamily: 'poppins-medium',
                   fontWeight: FontWeight.w500,
                   color: Colors.black),
                        ),
                        ),
                        ),  
                    const SizedBox(height:10),
                   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:TextFormField(validator:  (value) {
                if (value!.isEmpty) {
                return ("enter last name");
                } else if(Controller.text.length < 6){
                return ('Atleast 6 character');
                      }
                return null;
                    },                
                 maxLines: 5,
                controller: Controller, 
               textInputAction: TextInputAction.next,
                decoration:const InputDecoration(
                  filled: true,
                 errorStyle: TextStyle(fontSize: 10),
                 hintMaxLines: 3,
                 enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(14),),
                  borderSide: BorderSide(
                  color:Color.fromARGB(255, 236, 236, 236))),
                   focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                    color:Colors.white
                      )),
                      border: InputBorder.none,
                      hintText:'  Important Note Visible In Invoice ( Optional )',
                      hoverColor: Colors.black,
                      hintStyle:TextStyle(fontFamily: 'poppins-medium',fontSize: 12),
                      fillColor:Colors.white
                      )
                                    ),
                              ),
                    const SizedBox( height:30,),  
                    Container(
                    height:40,
                    width: widthSize - 40,
                    decoration: const BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                    color:Colors.grey,
                    blurRadius: 1.5
                        )
                      ],
                    color:Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedBank,
                    items: bankList.map((item) {
                    return DropdownMenuItem(
                    value: item,
                    child: Text(
                    item,
                    style: const TextStyle(
                    fontFamily: 'poppins-regular',
                    color: Color(0xFF000000),
                    fontSize: 14,
                  ),
                  ),
                  );
               }).toList(),
              onChanged: (value) {
              setState(() {
            selectedBank = value;
           });
            },
         ),
         ),
         const SizedBox(height:30),
                     Align(
                      alignment: Alignment.bottomRight,
                       child: SizedBox(
                        height:70,
                        width:130,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:18),
                          child: GestureDetector(
                           onTap: (){
                         selectFile();
                            },
                            child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius:const Radius.circular(10),
                            dashPattern: [4,6],
                            color: const Color.fromARGB(255, 54, 51, 51),
                             strokeWidth: 3,
                            child: const Center(
                            child: Text("      Add\nSignature",style: TextStyle(
                            fontSize:16, 
                            fontFamily: 'poppins-medium',
                            fontWeight: FontWeight.bold,
                            color:  Colors.blue),))),
                          ),
                        ),
                                         ),
                     ),
                 const SizedBox(height: 150,)
        ],
       ),
     ),
      ),

  bottomNavigationBar: BottomAppBar( 
  color: Colors.transparent,
  shape: const CircularNotchedRectangle(),
  notchMargin: 5.0,
  clipBehavior: Clip.antiAlias,
  child: Container(
    height:80,
    decoration:const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
    color:  Color(0xFF42566A),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                   const  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          Text(
                             'Total Amount',
                             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0,color: Colors.white,fontFamily: 'poppins-regular'),
                           ),
                             Text(
                             '₹0.00',
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0,color: Colors.white,fontFamily: 'poppins-medium'),
                           ),
                       ],
                     ),
                    const   SizedBox(width:40),
                SizedBox(
                  height: 55,
                  width: 135,
                  child: Padding(
                    padding: const EdgeInsets.only(top:3.0),
                    child: ElevatedButton(
                    onPressed: () { 
                        },
                        style: ElevatedButton.styleFrom(
                          primary:const  Color.fromARGB(255, 95, 185, 201), 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Save Details',
                              style: TextStyle(
                                fontSize: 16, 
                                fontFamily: 'poppins-regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ), 
                          ],
                        ),
                      ),
                  ),
                ) 
        ],
      ),
    ),
  ),
),
    );
  }

 void showCustomerAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Buisness'),
          content:const Text(
            'Please click on Select buisness to add a new buisness.',
          ),
          actions: <Widget>[
            TextButton(
              child:const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
void showClientAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Client'),
          content:const Text(
            'Please click on add Client to add a new Client.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showItemAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Items'),
          content:const Text(
            'Please click on Select items to add items.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



}
 
 
 
 
 















  