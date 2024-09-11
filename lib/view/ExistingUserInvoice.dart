import 'package:Invoicemint/model/user_business_list_response.dart';
import 'package:Invoicemint/model/user_client_list_response.dart';
import 'package:Invoicemint/view_model/businessList_api_services.dart';
import 'package:Invoicemint/view_model/clientList_api_services.dart';
import 'package:Invoicemint/view_model/get_fields_client.dart';
import 'package:Invoicemint/view_model/invoiceNumber_api_services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:Invoicemint/view/update_fields.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import '../utils/global.dart';

class ExistingUserInvoice extends StatefulWidget {
  const ExistingUserInvoice({super.key});

  @override
  State<ExistingUserInvoice> createState() => _ExistingUserInvoiceState();
}

class _ExistingUserInvoiceState extends State<ExistingUserInvoice> {
PlatformFile? pickedFiles;
bool selectedBuisness = false;
bool selectedClient = false;
bool changedBuisness = false;
bool changedClient = false;
bool showItemData = false;
bool clientSelected = false;

String? selectedDiscountType;
String changeBuisness= 'add_business'; 
String changeClient= 'add_Client';
String newBusiness='';
String country_code = '';
String currency_code='';
String? _selectedCurrencyCode = 'Currency';
String? _selectedCountryName = 'Country Name';
String? currencyName = 'Currency';

  List<Item> itemList = [];
  double totalAmount = 0;
  double totalTax = 0;
  double grandTotal = 0;
  double discount = 0;
  double deduction = 0;
  double? lastDiscountValue;
  String? lastDiscountType; 


  void _addItem(String name, double rate, double quantity, double taxRate) {
    // Calculate values
    double amount = rate * quantity;
    double taxTotal = amount * (taxRate / 100);
    double total = amount + taxTotal;

    // Add the item to the list
    setState(() {
      itemList.add(Item(name, rate, quantity, amount, taxTotal, total,taxRate));
      _updateTotals(); 
    });
  }

  void _removeItem(int index) {
    setState(() {
      itemList.removeAt(index);
      _updateTotals(); // Update the totals when an item is removed
    });
  }

  void _updateTotals() {
    totalAmount = itemList.fold(0.0, (sum, item) => sum + item.amount);
    totalTax = itemList.fold(0.0, (sum, item) => sum + item.taxTotal);
    grandTotal = itemList.fold(0.0, (sum, item) => sum + item.total) - deduction;
  }

 void _applyDiscount(double discountValue, String discountType) {
    setState(() {
      if (discountType == '%') {
        deduction = grandTotal * (discountValue / 100);
      } else {
        deduction = discountValue;
      }
      lastDiscountValue = discountValue;
      lastDiscountType = discountType;

      grandTotal = itemList.fold(0.0, (sum, item) => sum + item.total) - deduction;
    });
  }


final Controller = TextEditingController(); 
final searchController = TextEditingController();
final _invoiceDateController = TextEditingController();
final _dueDateController = TextEditingController();








  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isInvoiceDate) async {
    DateTime now = DateTime.now();
    DateTime initialDate = now;
    if (controller.text.isNotEmpty) {
      initialDate = DateFormat('dd-MM-yyyy').parse(controller.text);
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd-MM-yyyy').format(picked);
        if (isInvoiceDate) {
          DateTime dueDate = picked.add(const Duration(days: 20));
          _dueDateController.text = DateFormat('dd-MM-yyyy').format(dueDate);
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


  final List<String> noCilent = [
    'no cilent data',
  ];


final List<String> discountTypes = [
            '%',
          'Amount',
            ];  

final List<String> _taxTypes = ['Tax Rate', 'GST Rate', 'VAT', 'PPN', 'HST'];
String _selectedTaxType = 'Tax Rate';
String  selectedTaxValue = '';

void _onBusinessSelected(UserBusinessListResponse selectedBusiness) async {
  String abbreviation = selectedBusiness.businessName
      .split(' ')
      .map((word) => word[0].toUpperCase())
      .join();

  DateTime invoiceDate = DateFormat('dd-MM-yyyy').parse(_invoiceDateController.text); 
  String formattedDate = DateFormat('MM-yyyy').format(invoiceDate);
  String invoiceNumber = '$abbreviation-$formattedDate-';

setState(() {
  invoiceNo = invoiceNumber;
});
}

  @override
 Widget build(BuildContext context) {
 final businessListProvider = Provider.of<BusinessListProvider>(context);
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                 const Text('Create Invoice',
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
                    Consumer<InvoiceNumberProvider>(
                builder: (context, invoiceProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text(
                  '     # Invoice No. :  ',
                     style:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontFamily:'poppins-regular'
                         ),
                ),
                const SizedBox(height: 10),
                invoiceProvider.invoiceNumber.isNotEmpty
                    ? Text(
                    '$invoiceNo${invoiceProvider.invoiceNumber}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily:'poppins-regular'
                         ),
                      )
                    :const Text(''), 
              ],
            );
          },
        ),        
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ 
             selectedBuisness?
                 Container(
                 height:90,
                width:140,
                decoration:BoxDecoration(
                border:Border.all(color: Colors.teal),
                borderRadius:const  BorderRadius.all(Radius.circular(15))
                  ),  
               child:Image.network(
                       "https://www.invoicemint.in/web/download-image/$businessLogo}",
                        scale: 3,
                       errorBuilder: (context, error, stackTrace) {
                       return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Icon(Icons.close,color: Colors.red,),
                        Text('No Data',style:TextStyle(fontSize:12,color: Colors.black,fontWeight:FontWeight.bold,fontFamily: 'poppins-regular'))
        ],
                       );
                       },
                       ) 
                      ):      
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
                          Text('Business Logo',style: TextStyle(fontWeight:FontWeight.w300,fontFamily: 'poppins-regular',fontSize: 13,color: Colors.white),)
                           ],
                         )),
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
                                           invoiceDate = _invoiceDateController.text.toString();
                                           print(invoiceDate);
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
                                         _selectDate(context, _invoiceDateController, true);
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
         const SizedBox(height: 10,)  ,
                Align(
                        alignment: Alignment.topLeft,
                         child:Row(
                           children: [
                           const  Text('     Billed By',
                                style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins-medium',
                                fontWeight: FontWeight.w500,
                                color: Colors.black), ),
                           IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {
                     showCustomerAlertDialog(context);
                        },
                      ),     
                      const SizedBox(
                      width:105,
                        ),
                      
                           ],
                         ),
                       ), 
                Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Container(
                  height:210,
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
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height: 20,),
             SizedBox(
             height:60,
             child:GestureDetector(
             onTap: () {
             if (_invoiceDateController.text.isEmpty) {
             showDialog(
         context: context,
         builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Select Invoice Date"),
            content: const Text("Please select the invoice date before selecting a business."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
            }
            },
  child: AbsorbPointer(
    absorbing: _invoiceDateController.text.isEmpty, 
    child: DropdownButtonFormField<UserBusinessListResponse>(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const InputDecoration(
        suffixIconColor: Color(0xFF000000),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color.fromRGBO(34, 31, 31, 0.216),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(34, 31, 31, 0.216),
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      isExpanded: true,
      items: businessListProvider.businessList.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Center(
            child: Text(
              item.businessName,
              style: const TextStyle(
                fontFamily: 'poppins-regular',
                color: Color(0xFF000000),
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
      hint: const Center(
        child: Text(
          "Select Business",
          style: TextStyle(
            fontFamily: 'poppins-regular',
            color: Color(0xFF000000),
            fontSize: 14,
          ),
        ),
      ),
      onChanged: _invoiceDateController.text.isEmpty
          ? null
          : (value) async{
              setState(() {
                businessId = value!.id;
                selectedBusinessName = value.businessName;
                address = value.streetAddress;
                cin = value.cin;
                companyPan= value.pan;
                gstin = value.gstin;
                selectedBuisness = true;
                businessLogo = value.imageUrl;
                print(businessLogo);
              });
                _onBusinessSelected(value!);
         await Provider.of<InvoiceNumberProvider>(context, listen: false).fetchInvoiceNumber();
         await Provider.of<ClientListProvider>(context, listen: false).getClientListApi();
            },
    ),
  ),
),   
                 ),   
                 const SizedBox(
                  height: 20,
                 ),
             selectedBuisness?
             Container(
             margin:const EdgeInsets.only(left:20,right:20),
              height: 100,
              decoration:  BoxDecoration(
              color:Colors.white,
              border: Border.all(color: Colors.teal,style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(15)),   
              ),
             child: Padding(
               padding: const EdgeInsets.only(left:10,top:20),
               child: Row(
               children: [
               const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Business Name',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                   Text('Address',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('   :  ',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                   Text('   :  ',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(selectedBusinessName,
                  style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-regular',
                  fontWeight: FontWeight.w500,
                  color: Colors.black), ),
                   Text(address,
                  style:const TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-regular',
                  fontWeight: FontWeight.w500,
                  color: Colors.black), ),
                  ],
                             ),
                         ],
                ),
             ),
             )
             :  Container(
                child: Column(
                 children:[
                 const Center(
                 child: Text('Select a business from list\n Or ',
                style: TextStyle(
                fontSize: 16,
                fontFamily: 'poppins-medium',
                fontWeight: FontWeight.w400,
                color: Colors.black), ),
                ), 
                  SizedBox(
                height: 40,
                width:widthSize,
                child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal:15),
             child: ElevatedButton.icon(
               style: ButtonStyle( 
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
               ),
              ),
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 140, 150),)),
                  onPressed: () {
                showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      enableDrag: true,
                         shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                      builder:(BuildContext context){
                      return                      Container(
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
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
                               padding: const EdgeInsets.only(left:20),
                              child: InkWell(
                              onTap: () {
                              Navigator.pop(context);  
                              },
                              child: const Icon(Icons.chevron_left,color: Colors.white,size:25,)),
                                 ),
                                 const SizedBox(width: 100,),
                                  const Text(
                                  'Add Business',
                                  style: TextStyle(
                                      fontSize:14,
                                      color: Colors.white,
                                      fontFamily: 'poppins-regular',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                       const SizedBox(height: 10),
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
                          controller: _dueDateController,
                          decoration: InputDecoration(
                            border:InputBorder.none,
                            labelText: "Select Country *",
                            labelStyle:const TextStyle(fontSize: 14),
                            suffixIcon: CountryCodePicker(
                                     closeIcon : const Icon(Icons.close),
                                    hideMainText: true,
                                    flagWidth: 30,
                                   textStyle:const TextStyle(color: Colors.black54),
                                    onChanged: (value) {
                                      country_code = value.dialCode.toString();
                                    },
                                    favorite: const ['+91', 'भारत'], 
                                                           ),
                                     ),
                                   ),
                        ),
                      ),
                       const SizedBox(height: 20,)  ,
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
                          controller: _dueDateController,
                          decoration: const InputDecoration(
                            border:InputBorder.none,
                            labelText: "Business Name*",
                            labelStyle: TextStyle(fontSize: 14),
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
                             controller: _dueDateController,
                             decoration: const InputDecoration(
                              border:InputBorder.none,
                               labelText: " Business Email*",
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
                                controller: _dueDateController,
                                decoration: const InputDecoration(
                                  border:InputBorder.none,
                                  labelText: "State",
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
                             controller: _dueDateController,
                             decoration: const InputDecoration(
                              border:InputBorder.none,
                               labelText: "Address ( Optional )",
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
                                controller: _dueDateController,
                                decoration: const InputDecoration(
                                  border:InputBorder.none,
                                  labelText: "City ( Optional )",
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
                             controller: _dueDateController,
                             decoration: const InputDecoration(
                              border:InputBorder.none,
                               labelText: "Postal Code( Optional )",
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
                                controller: _dueDateController,
                                decoration: const InputDecoration(
                                  border:InputBorder.none,
                                  labelText: "Contact No. *",
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
                               controller: _dueDateController,
                               decoration: const InputDecoration(
                                 labelText: " Enter TAX / VAT Number ( Optional ) ",
                                 border:InputBorder.none,
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
                             )                           
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
                  icon: const Icon(Icons.add,size:16,color: Colors.white,),
                  label: const Text('Add More Item',style: TextStyle(fontSize: 10,color: Colors.white,fontFamily: 'poppins-medium',),),
                        ),
                ),
              ),
                  ]
                ),
              )
                  ],
                 )
                ),
              ),   
              const SizedBox(height: 10,)  ,
                     Align(
                        alignment: Alignment.topLeft,
                         child: Row(
                           children: [
                           const  Text('     Billed To',
                                style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins-medium',
                                fontWeight: FontWeight.w500,
                                color: Colors.black), ),
                           IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {
                     showClientAlertDialog(context);
                        },
                      ), 
                    const SizedBox(
                      width:105,
                        ),   
                           ],
                         ),
                       ),
                 Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Container(
                  height:210,
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
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height: 20,),
                 SizedBox(
                  height:60,
                   child:
                   businessId!= 0?
                 Consumer<ClientListProvider>(
                 builder: (context, clientListProvider, child) {
                return DropdownButtonFormField<UserClientListResponse>(
                   padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const InputDecoration(
                      suffixIconColor: Color(0xFF000000),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    isExpanded: true,
                    items: clientListProvider.clientList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Center(
                          child: Text(
                            item.clientBusinessName,
                            style: const TextStyle(
                              fontFamily: 'poppins-regular',
                              color: Color(0xFF000000),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Center(
                      child: Text(
                        "Select Client",
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          color: Color(0xFF000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                    setState(() {
                    selectedClientName = value!.clientBusinessName;
                    clientId = value.id;
                    clientSelected = true;
                      });
                    },
                  );
               },
                  ):                
                 DropdownButtonFormField(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const InputDecoration(
                suffixIconColor: Color(0xFF000000),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                color: Color.fromRGBO(34, 31, 31, 0.216),
                 ),
                ),
               focusColor: Color.fromRGBO(255, 255, 255, 1),
               focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(
               color: Color.fromRGBO(34, 31, 31, 0.216),
                ),
             borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                 ),
                style: const TextStyle(color: Colors.black),
                isExpanded: true,
                  items:noCilent.map((String type) {
                  return DropdownMenuItem(
                  value: type,
                  child: Center(
                 child: Text(type,
              style: const TextStyle(
              fontFamily: 'poppins-regular',
               color: Color(0xFF000000),
             fontSize: 14,
                  ),
                  ),
                    ));
                }).toList(),
              hint:const Center(
                child: Text(
                  "Select Client",
                 style: TextStyle(
                  fontFamily: 'poppins-regular',
                  color: Color(0xFF000000),
                  fontSize: 14,
                  ),
                   ),
                  ),
               onChanged: (value) {
               print(value);
               setState(() {
               selectedValue= value!;
               });
                },
                ), 
                 ),   
                 const SizedBox(
                  height: 20,
                 ),
             selectedClient?
             Container(
             margin:const EdgeInsets.only(left:20,right:20),
              height: 100,
              decoration:  BoxDecoration(
              color:Colors.white,
              border: Border.all(color: Colors.teal,style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(15)),   
              ),
             child:const Padding(
               padding: EdgeInsets.only(left:10,top:20),
               child: Row(
               children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Client Name',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                   Text('Address',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('   :  ',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                   Text('   :  ',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w400,
                  color: Colors.black), ),
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('   Interset Bud Solutions',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-regular',
                  fontWeight: FontWeight.w500,
                  color: Colors.black), ),
                   Text('  SweetBall Buisness Center',
                  style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'poppins-regular',
                  fontWeight: FontWeight.w500,
                  color: Colors.black), ),
                  ],
                             ),
                         ],
                ),
             ),
             )
             :   Container(
                child: Column(
                  children:[
                      const Center(
                  child: Text('Select a Client from list\n                   Or ',
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w400,
                          color: Colors.black), ),
                ), 
                  SizedBox(
                height: 40,
                width:widthSize,
                child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal:15),
             child: ElevatedButton.icon(
               style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
               ),
              ),
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 140, 150),)),
                  onPressed: () {
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
                               height: 60,
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
                               padding: const EdgeInsets.only(left:20),
                              child: InkWell(
                              onTap: () {
                              Navigator.pop(context);  
                              },
                              child: const Icon(Icons.chevron_left,color: Colors.white,size:25,)),
                                 ),
                                 const SizedBox(width: 100,),
                                  const Text(
                                     'Add Client',
                                     style: TextStyle(
                                         fontSize:16,
                                         color: Colors.white,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ],
                               ),
                             ),
                             Expanded(
                               child: SingleChildScrollView(
                                 child: Padding(
                                   padding: const EdgeInsets.only(bottom:30.0,top:10),
                                   child: Column(
                                     children: [
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
                             controller: _dueDateController,
                             readOnly: true,
                             decoration: InputDecoration(
                              border:InputBorder.none,
                               labelText: "Select Country *",
                               labelStyle:const TextStyle(fontSize: 14),
                               suffixIcon: CountryCodePicker(
                                        closeIcon : const Icon(Icons.close),
                                       hideMainText: true,
                                       flagWidth: 30,
                                      textStyle:const TextStyle(color: Colors.black54),
                                       onChanged: (value) {
                                         country_code = value.dialCode.toString();
                                       },
                                       favorite: const ['+91', 'भारत'], 
                                                              ),
                                        ),
                                      ),
                           ),
                         ),
                          const SizedBox(height: 20,)  ,
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
                             controller: _dueDateController,
                             decoration: const InputDecoration(
                              border:InputBorder.none,
                               labelText: "Client's Business Name*",
                               labelStyle: TextStyle(fontSize: 14),
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
                                controller: _dueDateController,
                                decoration: const InputDecoration(
                                  labelText: " Business Email*",
                                  border:InputBorder.none,
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
                                   controller: _dueDateController,
                                   decoration: const InputDecoration(
                                    border:InputBorder.none,
                                     labelText: "State",
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
                                controller: _dueDateController,
                                decoration: const InputDecoration(
                                  border:InputBorder.none,
                                  labelText: "Address ( Optional )",
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
                                   controller: _dueDateController,
                                   decoration: const InputDecoration(
                                     labelText: "City ( Optional )",
                                     border:InputBorder.none,
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
                                controller: _dueDateController,
                                decoration: const InputDecoration(
                                  border:InputBorder.none,
                                  labelText: "Postal Code( Optional )",
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
                                   controller: _dueDateController,
                                   decoration: const InputDecoration(
                                    border:InputBorder.none,
                                     labelText: "Contact No. *",
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
                                  controller: _dueDateController,
                                  decoration: const InputDecoration(
                                    border:InputBorder.none,
                                    labelText: " Enter TAX / VAT Number ( Optional ) ",
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
                                 ),
                               ),
                             ),
                           ],
                         ),
                       );
                      });      

                  },
                  icon: const Icon(Icons.add,size:16,color: Colors.white,),
                  label: const Text('Add More Item',style: TextStyle(fontSize: 10,color: Colors.white,fontFamily: 'poppins-medium',),),
                        ),
                ),
              ),
                  ]
                ),
              )
                  ],
                 )
                ),
              ), 
                    const SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.topRight,
                         child:   Row(
                           children: [
                           const  Text('     Items',
                                style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins-medium',
                                fontWeight: FontWeight.w500,
                                color: Colors.black), ),
                          
                     const SizedBox(
                      width:10,
                        ),
                Row(
                children: [
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
          height: 30,
          width: 90,
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
            currencyName ?? ' Currency', 
              textAlign: TextAlign.start,
              style:const TextStyle(
                fontFamily: 'poppins-medium',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:12,
              ),
            ),
         const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
               ],
              ), 
               ),
              ),    
              const SizedBox(width:125),
                            SizedBox(
                              height:30,
                              width: 100,
                              child: ElevatedButton(
                               style: ButtonStyle(
                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    ),
                                 backgroundColor:clientSelected? MaterialStateProperty.all(const Color.fromARGB(255, 224, 33, 33)):
                                  MaterialStateProperty.all( const Color.fromARGB(255, 253, 215, 215))
                                  ),
                              onPressed: clientSelected ? () async{
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateItemsFields()));
                         await Provider.of<ClientFieldsProvider>(context, listen: false).fetchClientFields();
                                           }:() {
                                           },
                                      child: Text('Update Fields', 
                                         style: TextStyle(
                                         fontSize:10,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color:clientSelected?Colors.white:Colors.black),),
                                    ),
                                  ),
                                 ],
                      ),              
                           ],
                         ),
                       ),
                  const SizedBox(height:5),
                        InkWell(
                      onTap: () {
               _showAddItemModal(context);
                        },
                      child: Container(
                      height:55,
                      padding: const EdgeInsets.symmetric(horizontal:15),
                     margin:const EdgeInsets.symmetric(horizontal:15),
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
             showItemData?
             SizedBox(
             height: 300,
             child: ListView.builder(
             itemCount: itemList.length,
             itemBuilder: (context, index) {
             final item = itemList[index];
             return Padding(
             padding: const EdgeInsets.only(left:12,right:12),
             child: Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
             ),
              color: const Color.fromARGB(255, 0, 140, 150),
               child: ExpansionTile(
             iconColor: Colors.white,
            collapsedIconColor: Colors.white,
               title: Text( item.name,
               style:  const TextStyle(
               fontSize: 15,
               fontFamily: 'poppins-medium',
               fontWeight: FontWeight.w500,
               color: Colors.white,
               ),),
               children: [
              Container(
             height:235,
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
              color: Colors.white
              ),
            child: Column(
              children: [
               Padding(
                  padding: const EdgeInsets.only(top:0,left:15,right:15),
                  child:  Row(
                    children: [
                      const Column(
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
                          SizedBox(height:5),
                          Text(
                            "Tax Rate",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                            "Rate",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                            "Amount",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                            "Tax Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
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
                      const SizedBox(width: 20),
                      const Column(
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
                          SizedBox(height:5),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
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
                          SizedBox(height:5),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                            '       :',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height:5),
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
                      const SizedBox(width:30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text(item.name,
                            style:  const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height:5),
                        Text(item.taxRate.toString(),
                            style:  const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height:5),
                          Text(item.rate.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height:5),
                          Text(item.quantity.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height:5),
                          Text(item.amount.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height:5),
                          Text(item.taxTotal.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins-light',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height:5),
                          Text(item.total.toStringAsFixed(2),
                            style: const TextStyle(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.black),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                _removeItem(index);  
                        });
         
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),                
                 ],
                  ),
                ),
              );
              },
             ),
             ):
          const Text(''),
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
                              Row( 
                              children: [
                              const Column( 
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                     Text('   Deductions',
                                      style: TextStyle(
                                      fontSize:18, 
                                      fontFamily: 'poppins-regular',
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xf7070704F)),
                                              ), 
                                  SizedBox(height:6),
                                  Text('   Amount',
                                      style: TextStyle(
                                      fontSize:18, 
                                      fontFamily: 'poppins-regular',
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xf7070704F)),
                                       ), 
                                      SizedBox(height:6),
                                      Text('   Tax',
                                      style:TextStyle(
                                      fontSize:18, 
                                      fontFamily: 'poppins-regular',
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xf7070704F)),
                                        ), 
                                    ],
                                   ),
                                    const SizedBox(width: 20,),
                                   const Column(
                                    children: [
                                        Text('       :',
                                       style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'poppins-regular',
                                       fontWeight: FontWeight.w500,
                                       color: Color(0xf7070704F)),) ,
                                             SizedBox(height:6),                           
                                         Text('       :',
                                       style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'poppins-regular',
                                       fontWeight: FontWeight.w500,
                                       color: Color(0xf7070704F)),) ,
                                                  SizedBox(height:6),
                                          Text('       :',
                                       style: TextStyle(
                                       fontSize: 18,
                                       fontFamily: 'poppins-regular',
                                       fontWeight: FontWeight.w500,
                                       color: Color(0xf7070704F)),) ,
                                    ],
                                   ),
                                              Column(
                                                children: [
                                                Text(deduction.toStringAsFixed(2),
                                                 style: const TextStyle(
                                                 fontSize:18,
                                                 fontFamily: 'roboto-regular',
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.black),),
                                                   const SizedBox(height:6),
                                                 Text(totalAmount.toStringAsFixed(2),
                                                 style: const TextStyle(
                                                 fontSize:18,
                                                 fontFamily: 'roboto-regular',
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.black),),
                                                            const SizedBox(height:6),
                                                  Text(totalTax.toStringAsFixed(2),
                                                 style: const TextStyle(
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
                          _showDiscountDialog(context);                      
                              },
                                child: const Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                 Icon(CustomIcons.group_490,color: Colors.blue,size: 20,),
                                 Text(' Give Discount On Total',
                                  style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'poppins-regular',
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
                           Padding(
                            padding: const EdgeInsets.symmetric( horizontal:10.0),
                            child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             const Text(' Total ( INR )          :   ',
                            style: TextStyle(
                            fontSize:18, 
                            fontFamily: 'poppins-medium',
                            fontWeight: FontWeight.w500,
                            color:Color(0xf7070704F)),
                                    ), 
                            Text(grandTotal.toStringAsFixed(2),
                            style: const TextStyle(
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
                     const SizedBox(
                      height:30,),       
                     Align(
                      alignment: Alignment.bottomRight,
                       child: SizedBox(
                        height:70,
                        width:160,
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
                  width: 130,
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
                              'Preview',
                              style: TextStyle(
                                fontSize: 17.0, 
                                fontFamily: 'poppins-regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                             Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size:17.0,
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



  void _showDiscountDialog(BuildContext context) {
    TextEditingController discountController = TextEditingController(
      text: lastDiscountValue != null ? lastDiscountValue.toString() : '0.0',
    );
    final List<String> discountTypes = ['%', 'Amount'];
    String? selectedDiscountType = lastDiscountType;

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
                  height: 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(255, 65, 213, 221),
                        Color.fromARGB(255, 77, 76, 76)
                      ]
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIcons.group_490, color: Colors.white, size: 25),
                      SizedBox(width: 5),
                      Text(
                        'Add Discount',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: TextField(
                        controller: discountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0.0',
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 196, 242, 245),
                            Color.fromARGB(255, 243, 211, 211)
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
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
                          },
                          value: selectedDiscountType,
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
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontFamily: 'poppins-medium',
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontFamily: 'poppins-medium',
                          ),
                        ),
                        onPressed: () {
                          double discountValue =
                              double.tryParse(discountController.text) ?? 0;

                          if (selectedDiscountType != null) {
                            _applyDiscount(discountValue, selectedDiscountType!);
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(content: Text('Please select a discount type')),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
          
   void _showAddItemModal(BuildContext context) {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController quantityController = TextEditingController(text: "1");
  TextEditingController taxRateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController taxTotalController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // ignore: no_leading_underscores_for_local_identifiers
  void _updateCalculatedValues() {
    double rate = double.tryParse(rateController.text) ?? 0;
    double quantity = double.tryParse(quantityController.text) ?? 1;
    double taxRate = double.tryParse(taxRateController.text) ?? 0;

    // Calculate amount, taxTotal, and total
    double amount = rate * quantity;
    double taxTotal = amount * (taxRate / 100);
    double total = amount + taxTotal;

    // Update the TextFormField controllers
    amountController.text = amount.toStringAsFixed(2);
    taxTotalController.text = taxTotal.toStringAsFixed(2);
    totalController.text = total.toStringAsFixed(2);
  }
  showModalBottomSheet(
   context: context,
   isScrollControlled: true,
   enableDrag: true,
    shape: const RoundedRectangleBorder(
   borderRadius: BorderRadius.only(
       topLeft: Radius.circular(20),
       topRight: Radius.circular(20))),
   builder:(context){
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
               Padding(
               padding: const EdgeInsets.only(left:15.0,right:15,top:15),
               child: TextFormField( 
                maxLines: 2,
                style:const TextStyle(
               fontSize:14 
               ),
          controller:itemNameController,
          validator: (value) => value?.isEmpty ?? true ? 'Item Name is required' : null,
                     decoration:  InputDecoration(
                 label: const Text("Item Name"),
          labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                   filled: true,
                   fillColor: Colors.white,
                   border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                   enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                  hintText: "HeadPhone",
                  hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                     ),
             ),
                  ),   
          const   SizedBox(height: 20,),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                 Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(left:15.0,right:10),
                   child:Container(
                   height: 58,
                   width: 170,
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: const BorderRadius.all(Radius.circular(15)),
                   border: Border.all(color: Colors.grey.shade300),
                   ),
                   child: Row(
                   children: [
                   Expanded(
                   child: DropdownButtonFormField<String>(
                   style: const TextStyle(
                   color: Colors.black, 
                   fontSize: 9, 
                   fontFamily: 'poppins-regular',
                   ),
                   value: _selectedTaxType,
                   items: _taxTypes.map((String taxType) {
                   return DropdownMenuItem<String>(
                       value: taxType,
                       child: Text(taxType),
                     );
                   }).toList(),
                   onChanged: (String? newValue) {
                     setState(() {
                       _selectedTaxType = newValue!;
                   selectedTaxValue = _selectedTaxType;
                     });
                   },
                   decoration: const InputDecoration(
                     enabledBorder: InputBorder.none,
                     hintText: 'Tax Type',
                     isDense: true, 
                     contentPadding: EdgeInsets.only(bottom: 10),
                   ),
                   ),
                    ),
                 const SizedBox(width: 10), 
                   Expanded(
                   child: TextFormField(
                   onChanged: (value) {
                  _updateCalculatedValues(); 
                },
                   style: const TextStyle(fontSize: 12),
                   keyboardType: TextInputType.number,
                   controller: taxRateController,
                   decoration: const InputDecoration(
                     enabledBorder: InputBorder.none,
                     hintText: "Rate%",
                     hintStyle: TextStyle(fontSize: 12, color: Colors.black),
                     isDense: true,
                     contentPadding: EdgeInsets.only(bottom: 10),
                    ),
                
                      ),
                      ),
                     ],
                      ),
                     ),
                      ),
               ),
                  Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(left:10.0,right:15),
                   child: TextFormField( 
                    style:const TextStyle(
                   fontSize:14 
                   ),
                  keyboardType: TextInputType.number,
                    controller: rateController,
                   onChanged: (value) {
                  _updateCalculatedValues(); 
                },
                    decoration:  InputDecoration(
                   label: const Text("Enter Rate"),
                                     labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                   filled: true,
                   fillColor: Colors.white,
                   border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                   enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                  hintText: "1299",
                  hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                     ),
                         ),
               ),
             ),         
               ],
                 ),  
           const SizedBox(
             height:20,
           ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0,right:10),
                      child: TextFormField( 
                       style:const TextStyle(
                      fontSize:14 
                      ),
                        onChanged: (value) {
                  _updateCalculatedValues(); 
                },
                       controller: quantityController,                   
                       keyboardType: TextInputType.number,
                       decoration:  InputDecoration(
                        suffixIconConstraints: const BoxConstraints(maxWidth: 50),
                  label: const Text("Quantity"),
          labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                       hintText: "1",
                       hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
  ),
      ),
                    ),
                  ),
                     Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0,right:15),
                      child: TextFormField( 
                                            readOnly: true,
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: amountController,
                                             keyboardType: TextInputType.number,
                                             decoration:  InputDecoration(
                                              label: const Text("Amount"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "1327",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                      ]), 
                                         const  SizedBox(height: 20,),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:15.0,right:10),
                                            child: TextFormField( 
                                              readOnly: true,
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller:taxTotalController,
                                              keyboardType: TextInputType.number,
                                             decoration:  InputDecoration( 
                                        label: const Text("Tax Total"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "124",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                           Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:10.0,right:15),
                                            child: TextFormField( 
                                            readOnly:true,
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: totalController,
                                             keyboardType: TextInputType.number,
                                             decoration:  InputDecoration(
                                              label: const Text("Enter Total"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "2102",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                      ]), 
                                         const  SizedBox(height: 20,),
                                             Padding(
                                               padding: const EdgeInsets.only(left:15.0,right:15),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: descriptionController,
                                                decoration:  InputDecoration(
                                        label: const Text("Description Here..."),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "About Product",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ), 
                                const SizedBox(height: 20,) ,                      
                                 Center(
                                   child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                        padding: EdgeInsets.zero,
                                                        shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(30)),
                                                           elevation: 5,
                                                          ),
                                                   onPressed: () {
                                                setState(() {
                                             showItemData = true;    
                                             String itemName = itemNameController.text;
                                            double rate = double.tryParse(rateController.text) ?? 0;
                                            double quantity = double.tryParse(quantityController.text) ?? 1;
                                            double taxRate = double.tryParse(taxRateController.text) ?? 0;
                                            _addItem(itemName, rate, quantity, taxRate);
                                            Navigator.pop(context);
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

  //  void _calculate() {
  //   final rate = double.tryParse(rateController.text) ?? 1;
  //   final quantity = double.tryParse(quantityController.text) ?? 1;
  //   final taxRate = double.tryParse(taxController.text) ?? 0;
  //   final effectiveRate = rate < 1 ? 1 : rate;
  //   final effectiveQuantity = quantity < 1 ? 1 : quantity;
  //  _amount = effectiveRate * effectiveQuantity.toDouble();
  //   _taxTotal = (_amount * (taxRate / 100));
  //   _total = _amount + _taxTotal;
  //   totalController.text = _total.toString();
  //       amountController.text = _amount.toString();
  //           taxTotalController.text = _taxTotal.toString();

  //   setState(() {});
  //  }
}
 
 class Item {
  String name;
  double rate;
  double taxRate;
  double quantity;
  double amount;
  double taxTotal;
  double total;

  Item(this.name, this.rate, this.quantity, this.amount, this.taxTotal, this.total, this.taxRate);
}
 
 
 















  