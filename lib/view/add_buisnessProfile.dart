import 'dart:io';
import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/manageBuisness.dart';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BuisnessProfileScreen extends StatefulWidget {
  const BuisnessProfileScreen({super.key});

  @override
  State<BuisnessProfileScreen> createState() => _BuisnessProfileScreenState();
}

class _BuisnessProfileScreenState extends State<BuisnessProfileScreen> {
  Future<void> selectLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    setState(() {
      imagePath=image.path;
    });
  }


 Future<void> selectSignature() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      signaturePath = image.path;
    });
  }


 String accesstoken = '';


  @override
  void initState() {
    super.initState();
    accessMethod();
  }

  void accessMethod() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      accesstoken = preferences.getString('accesstoken') ?? "Not found";
      userId = preferences.getInt('userId') ?? 0;
    });
  }



Future<void> addUserBusiness(
    int userId,
    String businessName,
    String profileUrl,
    String businessSince,
    String country,
    String state,
    String city,
    String pinCode,
    String streetAddress,
    String email,
    String cin,
    String number,
    String vatNumber,
    String gstin,
    String companyPan,
    ) async {

  var uri = Uri.parse('https://www.invoicemint.in/businesses/add');
  var request = http.MultipartRequest('POST', uri);

  request.fields['userId'] = userId.toString();
  request.fields['businessName'] = businessName;
  request.fields['profileUrl'] = profileUrl;
  request.fields['businessSince'] = businessSince;
  request.fields['country'] = country;
  request.fields['state'] = state;
  request.fields['city'] = city;
  request.fields['pinCode'] = pinCode;
  request.fields['streetAddress'] = streetAddress;
  request.fields['email'] = email;
  request.fields['cin'] = cin;
  request.fields['number'] = number;
  request.fields['vatNumber'] = vatNumber;
  request.fields['gstin'] = gstin;
  request.fields['companyPan'] = companyPan;

  // if (businessLogoPath.isNotEmpty) {
  //   request.files.add(await http.MultipartFile.fromPath('businessLogo', businessLogoPath));
  // }
  // if (signaturePath.isNotEmpty) {
  //   request.files.add(await http.MultipartFile.fromPath('signature', signaturePath));
  // }

  request.headers['Authorization'] = 'Bearer $accesstoken';
  var response = await request.send();

  if (response.statusCode == 200) {
    print(response.statusCode);
    String responseBody = await response.stream.bytesToString();
    Fluttertoast.showToast(
      msg: 'Business added successfully: $responseBody',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.push(context,MaterialPageRoute(builder: (context) =>  ManageBusinessScreen()),);
  } else {
    String responseBody = await response.stream.bytesToString();
    Fluttertoast.showToast(
      msg: 'Error: ${response.reasonPhrase}, $responseBody',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


   final _countryController = TextEditingController();
   final GlobalKey<FormState> Key = GlobalKey<FormState>();
   final _addressController = TextEditingController(text: 'tuytqwt');
   final cityController = TextEditingController(text:'delhi');
   final postalCodeController = TextEditingController(text:'93872');
   final buisnessController = TextEditingController(text:'hybe enterprise');
   final contactController = TextEditingController(text:'387639873');
   final profileUrlController = TextEditingController();
   final stateController = TextEditingController();
   final cinNumberController = TextEditingController();
   final vatNumberController = TextEditingController();
   final emailController = TextEditingController(text:'ibs.shilkpi@gmaiul.com');
   final gstNumberController = TextEditingController();
   final businessSinceController = TextEditingController();
  final  panNumberController = TextEditingController();
String countryCode = '';
String countryName ='';
String selectedCountryCode = '';
  @override
  Widget build(BuildContext context) {
   final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final heightsize = mediaQueryData.size.height;
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
          elevation: 0.0,
         flexibleSpace: Container(
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
           colors: <Color>[Color(0xff39DEE8),Color(0xff42566A)]),
         ),
           ),
          automaticallyImplyLeading: true,
          title: const Text(
            'Add Business Profile',
            style: TextStyle(fontSize: 18),
          ),
          shape:const  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
         ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
               height: heightsize,
               decoration: const BoxDecoration(
               image: DecorationImage(
               fit: BoxFit.cover,
               image: AssetImage('assets/images/invoicemint bg.png'))), 
            child: SingleChildScrollView(
              child: Form(
                key: Key,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [  
                          Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           Padding(
                          padding: const EdgeInsets.only(left:24,top: 30),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                         const Icon(Icons.add_circle_sharp,color: Colors.black,size:25,),
                         const Text('   Business Logo',
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w600,
                          color: Colors.black), ),
                         const SizedBox(width: 70,),
                        DottedBorder(
                     radius:const Radius.circular(20),
                     color:  Colors.grey.shade400,
                    strokeWidth: 2,
                    dashPattern: [6, 3],
                    borderType: BorderType.RRect, 
                          child: InkWell(
                            onTap: () {
                              selectLogo();
                            },
                            child: Container(
                            height: 70,
                              width: 110,
                            decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white), 
                            child:  imagePath != null
                            ?  Container(
                            height: 50,
                            width: 160,
                            decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.white), 
                            child: Image.file(
                              File(
                                imagePath!
                              )),
                            ):
                            const Icon(CustomIcons.group_475,color: Colors.black45,size:20,) ,
                            ),
                          ),
                        ) 
              
                         ],
                        ),
                       ),   
                                               Padding(
                                               padding: const EdgeInsets.only(top:20,left:20.0,right:20),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: buisnessController,
                                                validator:(value) {
                                                if (value!.isEmpty) {
                                               return ('Enter Business Name');
                                                      }
                                                 return null;
                                                    },
                                                decoration:  InputDecoration(
                                                suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:15),
                                               child: Icon(Icons.person_2_outlined,color: Colors.black45,size:20,)
                                               ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("  Business Name"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g Interest Bud Solutions Pvt. Ltd",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ),  
                                      const SizedBox(height: 20,),
                                               Padding(
                                               padding: const EdgeInsets.only(left:20.0,right:20),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: emailController,
                                                  validator:(value) {
                                                if (value!.isEmpty) {
                                               return ('Enter Business Email');
                                                      }
                                                 return null;
                                                    },
                                                decoration:  InputDecoration(
                                                    suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:15),
                                               child: Icon(Icons.email_outlined,color: Colors.black45,size:20,)
                                               ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("  Business Email"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g ibs.shilpi@gmail.com",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ),        
                               ],
                             ), 
                      const SizedBox(height: 20,) ,
                   const   Padding(
                     padding: EdgeInsets.only(left:24,bottom: 10),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add_circle_sharp,color: Colors.black,size:25,),
                           Text('   Personal Information',
                                  style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'poppins-regular',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black), ),
                        ],
                      ),
                   ),
                                      const SizedBox(height:10,),
                                               Padding(
                                               padding: const EdgeInsets.only(left:32.0,right:32),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: profileUrlController,
                                                decoration:  InputDecoration(
                                                    suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:15),
                                               child: Icon(Icons.link,color: Colors.black45,size:20,)
                                               ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("  Business Profile Url"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g www.google.com",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ),   
                                     const   SizedBox(height: 10,),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                          Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:32.0,right:10),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: businessSinceController,
                                             decoration:  InputDecoration(
                                                suffixIcon:Padding(
                                               padding: EdgeInsets.only(right:15),
                                               child: Image.asset('assets/images/since.png',
                                               height: 20,
                                               )
                                               ),
                                              suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("Business Since"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g 2021",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
                                          ),
                                        ),
                                           Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:10.0,right:33),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                           keyboardType: TextInputType.number,
                                             controller: contactController,
                                               validator:(value) {
                                                if (value!.isEmpty) {
                                               return ('Enter Phone No.');
                                                      }
                                                 return null;
                                                    },
                                             decoration:  InputDecoration(
                                                suffixIcon:const Padding(
                                               padding: EdgeInsets.only(right:0),
                                               child: Icon(Icons.phone_outlined,color: Colors.black45,size:20,)
                                               ),
                                              label: const Text("Phone"),
                                              labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                              enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                             hintText: "e.g.8707825790",
                                             hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                ),
                                                    ),
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
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:32.0,right:10),
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
                                            padding: const EdgeInsets.only(left:10.0,right:33),
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
                                            padding: const EdgeInsets.only(left:32.0,right:10),
                                            child: TextFormField( 
                                             style:const TextStyle(
                                            fontSize:14 
                                            ),
                                             controller: cityController,
                                             decoration:  InputDecoration(
                                                suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
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
                                            padding: const EdgeInsets.only(left:10.0,right:33),
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
                                               padding: const EdgeInsets.only(left:32.0,right:32),
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
                                const SizedBox(height: 20,) ,
                        const  Padding(
                          padding:EdgeInsets.only(left:24),
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             Icon(Icons.add_circle_sharp,color: Colors.black,size:25,),
                               Text('   Legal Information (Optional)',
                                  style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'poppins-regular',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black), ),
                                         ],
                                     ),
                                    ),   
                              const  SizedBox(height:20)  ,
                                               Padding(
                                               padding: const EdgeInsets.only(left:32.0,right:32),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: cinNumberController,
                                                decoration:  InputDecoration(
                                                   suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
                                                    child: Image.asset(
                                                 'assets/images/number-blocks.png',
                                                  height: 20,
                                                  width: 30,
                                                  color: Colors.black45
                                                  ),
                                                  ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text(" Business CIN Number "),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g 43968492736",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ),             
                             const  SizedBox(height: 20,)  ,
                                            selectedCountryCode== 'IN'?
                                              Padding(
                                               padding: const EdgeInsets.only(left:32.0,right:32),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: panNumberController,
                                                decoration:  InputDecoration(
                                                   suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
                                                    child: Image.asset(
                                                 'assets/images/tax.png',
                                                  height: 20,
                                                  width: 30,
                                                  color: Colors.black45
                                                  ),
                                                  ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                              label: const Text("  Business Company Pan Number"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g 349872435",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ):
                                              Padding(
                                               padding: const EdgeInsets.only(left:32.0,right:32),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: vatNumberController,
                                                decoration:  InputDecoration(
                                                   suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
                                                    child: Image.asset(
                                                 'assets/images/tax.png',
                                                  height: 20,
                                                  width: 30,
                                                  color: Colors.black45
                                                  ),
                                                  ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                              label: const Text("  Business VAT/TAX Number"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g 349872435",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ),    
                                selectedCountryCode == 'IN'?
                                             Padding(
                                               padding: const EdgeInsets.only(left:32.0,right:32,top: 20),
                                               child: TextFormField( 
                                                maxLines: 2,
                                                style:const TextStyle(
                                               fontSize:14 
                                               ),
                                                controller: gstNumberController,
                                                decoration:  InputDecoration(
                                                  suffixIcon:  Padding(
                                                    padding: const EdgeInsets.only(right:15.0),
                                                    child: Image.asset(
                                                 'assets/images/gst.png',
                                                  height: 28,
                                                  width: 30,
                                                  color: Colors.black45,
                                                  ),
                                                  ),
                                                 suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                        label: const Text("  Business GSTIN"),
                                labelStyle: const TextStyle( color: Colors.black, fontSize: 12,fontFamily:'poppins-regular'),
                                                 filled: true,
                                                 fillColor: Colors.white,
                                                 border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(15)),
                                                 enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(15)),
                                                hintText: "e.g 7436842",
                                                hintStyle: const TextStyle(fontSize: 14,color: Colors.grey),
                                                   ),
                                                       ),
                                             ):
                          const Text(''),
                          const SizedBox(height: 20,),
                          Padding(
                          padding: const EdgeInsets.only(left:24,top: 0),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          const Icon(Icons.add_circle_sharp,color: Colors.black,size:25),
                        const  Text('   Business Signature',
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w600,
                          color: Colors.black), ),
                        const  SizedBox(width: 20,),
                        InkWell(
                        onTap:(){
                       selectSignature(
                       );
                          },
                       child: Container(
                          height: 50,
                          width: 110,
                        decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1
                        )
                      ],
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius:const BorderRadius.all(Radius.circular(15)),
                        color: Colors.white), 
                        child:signaturePath != null
                            ?  Container(
                            height: 50,
                            width: 160,
                            decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.white), 
                            child: Image.file(
                              File(
                                signaturePath!
                              )),
                            ):
                            const Icon(CustomIcons.group_475,color: Colors.black45,size:20,) ,
                        ) ), 
                         ],
                        ),
                       ),   
                         const SizedBox(height:30),
                           Center(
                             child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                               elevation: 5,
                              ),
                              onPressed: () {
                           if (Key.currentState!.validate()){
                          addUserBusiness(
                           userId,
                           buisnessController.text,
                           profileUrlController.text,
                           businessSinceController.text,
                           _countryController.text,
                           stateController.text,
                           cityController.text,
                           postalCodeController.text,
                           _addressController.text,
                          emailController.text,
                          cinNumberController.text,
                           contactController.text,
                           vatNumberController.text,
                           gstNumberController.text,
                           panNumberController.text,
                          );
                               } 
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
                                   child: Text('Add Business',
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                           fontSize: 14,
                                           fontFamily: 'poppins-regular',
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white)),
                                 ),
                                                          ),
                                                        ),
                                                      ),
                               ),      
                              const SizedBox(height: 100,)
                  ],
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}


