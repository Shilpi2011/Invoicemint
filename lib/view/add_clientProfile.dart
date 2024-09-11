import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/model/user_business_list_response.dart';
import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/manageClient.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddClientProfile extends StatefulWidget {
const AddClientProfile({super.key});

  @override
  State<AddClientProfile> createState() => _AddClientProfileState();
}

class _AddClientProfileState extends State<AddClientProfile> {
  String? _imagePath;

  Future<void> selectFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _imagePath = image.path;
    });
  }

   final _countryController = TextEditingController();
   final GlobalKey<FormState> key = GlobalKey<FormState>();
   final _addressController = TextEditingController();
   final cityController = TextEditingController();
   final postalCodeController = TextEditingController();
   final buisnessController = TextEditingController();
   final contactController = TextEditingController();
   final profileUrlController = TextEditingController();
   final stateController = TextEditingController();
   final cinNumberController = TextEditingController();
   final vatNumberController = TextEditingController();
   final emailController = TextEditingController();
   final gstNumberController = TextEditingController();
   final businessSinceController = TextEditingController();

   String countryCode = '';
   String countryName ='';
   String selectedCountryCode = '';

Future<List<UserBusinessListResponse>> getBusinessListApi() async {
  try {
    final response = await http.get(
      Uri.parse('https://www.invoicemint.in/businesses/selectBusiness?userId=$userId'),
      headers: {
        "Authorization": 'Bearer $accessToken'
      },
    );
    var jsonRes = json.decode(response.body);

    if (response.statusCode == 200) {
      return (jsonRes as List).map((json) => UserBusinessListResponse.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      print("Unauthorized access");
      return [];
    } else {
      print(response.reasonPhrase);
      return [];
    }
  } catch (e) {
    print("Error occurred: $e");
    return [];
  }
}



late Future<List<UserBusinessListResponse>> myFuture  = getBusinessListApi();



  void accessMethod() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      userId = preferences.getInt('userId') ?? 0;
    });
    myFuture = getBusinessListApi();
  }

 var selectedValue;
  String accesstoken = '';
  int userId = 0;

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
               Container(
               height:80,
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
                 padding: const EdgeInsets.only(top:10,bottom:0,left: 20),
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
                    const Text('Add Client Profile',
                     style: TextStyle(
                        color:Colors.white,
                         fontSize:16,
                         fontFamily: 'poppins-regular',
                         fontWeight: FontWeight.w600),
                      ),
                                     
                   ],),
                 ),
                 ), 
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
                            selectFile();
                          },
                          child: Container(
                          height: 70,
                            width: 110,
                          decoration:const  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white), 
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            _imagePath != null
                          ?  Image.file(
                            height: 70,
                            width: 110,
                            File(_imagePath!)
                            ):
                            const Icon(CustomIcons.group_475,color: Colors.black45,size:20,),
                            ],
                          ) ,
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
                       decoration:  InputDecoration(
                       suffixIcon:const Padding(
                      padding: EdgeInsets.only(right:15),
                      child: Icon(Icons.person_2_outlined,color: Colors.black45,size:20,)
                      ),
                        suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                       label: const Text("  Client Name"),
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
                           const  SizedBox(height:20),
                            FutureBuilder(
                          future:getBusinessListApi(),
                          builder: (context, AsyncSnapshot<List<UserBusinessListResponse>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                            return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                );} 
                            else if (snapshot.hasData) {
                            return DropdownButtonFormField<UserBusinessListResponse>(
                             padding: const EdgeInsets.only(left: 20, right: 20),
                             decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                             suffixIconColor:const Color(0xFF000000),
                             enabledBorder: OutlineInputBorder(
                             borderRadius: const BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                               color: Colors.grey.shade300,
                                   ),
                                 ),
                                 focusedBorder:const OutlineInputBorder(
                                   borderSide: BorderSide(
                             color: Color.fromRGBO(34, 31, 31, 0.216),
                                   ),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                               ),
                                 ),
                               style: const TextStyle(color: Colors.black),
                               isExpanded: true,
                              value: snapshot.data?.firstWhere(
                            (item) => item.businessName == selectedValue,
                             orElse: () => snapshot.data!.first,
                                    ),
                          items: snapshot.data?.map((item) {
                            return DropdownMenuItem<UserBusinessListResponse>(
                               value: item,
                               child: Center(
                                 child: Text(
                                   '${item.businessName}',
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
                               onChanged: (value) {
                                   print(value);
                                   setState(() {
                           selectedValue = value!.businessName;
                                   });
                                         },
                                      );
                                       }
                                        }
                                    return const Center(
                                    child: CircularProgressIndicator(
                                            color:  Colors.teal
                                          ),
                                        );
                                      }),
         
                             const SizedBox(height: 20,),
                                             Padding(
                                             padding: const EdgeInsets.only(left:20.0,right:20),
                                             child: TextFormField( 
                                              maxLines: 2,
                                              style:const TextStyle(
                                             fontSize:14 
                                             ),
                                              controller: emailController,
                                              decoration:  InputDecoration(
                                                  suffixIcon:const Padding(
                                             padding: EdgeInsets.only(right:15),
                                             child: Icon(Icons.email_outlined,color: Colors.black45,size:20,)
                                             ),
                                               suffixIconConstraints: const BoxConstraints(maxWidth: 50), 
                                      label: const Text("  Client Email"),
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
                                      label: const Text("  Client Profile Url"),
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
                                      label: const Text("Client Since"),
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
                                            initialSelection: 'IN',
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
                                      label: const Text(" Client CIN Number "),
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
                                      label: const Text("  Client VAT/TAX Number"),
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
                                      label: const Text("  Client GSTIN"),
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
                       
                       const SizedBox(height:40,),
                         Center(
                           child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                             elevation: 5,
                            ),
                            onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const ManageClientScreen()));
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
                                 child: Text('Add Client',
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


