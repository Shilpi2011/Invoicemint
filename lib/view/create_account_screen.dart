import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/model/register_response.dart';
import 'package:Invoicemint/routes/route_name.dart';
import 'package:Invoicemint/view/login_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}
class _CreateAccountState extends State<CreateAccount> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _countryController = TextEditingController();

  bool first = false;
  bool isLogin = false;
  bool passToggle = true;
  bool checkBoxValue = false;

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  int start = 200;
  int delay = 200;
  String countryCode = '';



Future<RegisterResponse?> registerUser(String email, String name, String country, String phone, String password) async {
  RegisterResponse? registerResponse;
  var requestBody = {
    "name": name,
    "phone": phone,
    "email": email,
    "country": country,
    "password": password,
  };
  
  var response = await http.post(
    Uri.parse('https://www.invoicemint.in/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
    body: jsonEncode(requestBody),
  );
  
  print(response);
  
  if (response.statusCode == 200) {
    String responseBody = response.body;
    print(responseBody);
    
    Fluttertoast.showToast(
      msg: responseBody,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
    );
    Navigator.push( context,MaterialPageRoute(builder: (context) => const LoginScreen()) );
  } else {
    String responseBody = response.body;
    print(response.reasonPhrase);
    Fluttertoast.showToast(
      msg: responseBody,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
  
  return registerResponse;
}
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
                    padding: const EdgeInsets.only(top: 55),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome To',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000)),
                        ),
                        Image.asset('assets/images/invoicemint_logo.png', scale: 3),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xf7070704F))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  height: 55,
                                  width: widthSize,
                                  constraints: const BoxConstraints(minWidth: 88.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/Group 383.png'),
                                        const SizedBox(width: 15),
                                        const Text('Continue with google',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff000000))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 145,
                              child: Divider(thickness: 1.5, color: Color(0xf7070704F)),
                            ),
                            SizedBox(width: 4),
                            Text(
                              ' Or',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'poppins-regular',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xf7070704F)),
                            ),
                            SizedBox(width: 4),
                            SizedBox(
                              height: 30,
                              width: 145,
                              child: Divider(thickness: 1.5, color: Color(0xf7070704F)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ])),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter Name');
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            controller: _nameController,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Color(0xf7070704F))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 67, 235, 218))),
                                border: InputBorder.none,
                                labelText: '   Enter Name',
                                fillColor: Colors.white,
                                labelStyle: const TextStyle(fontFamily: 'poppins-regular', fontSize: 12),
                                filled: true),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Country',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                                TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ])),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Select Country');
                                }
                                return null;
                              },
                              readOnly: true,
                              controller:   _countryController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                suffixIcon: CountryCodePicker(
                                  flagWidth: 20,
                                  padding:const EdgeInsets.only(left:0),
                                  onChanged: (value) {
                                    _countryController.text = value.name ?? '';
                                  },
                                  initialSelection: 'IN',
                                 hideMainText: true,
                                  favorite: const ['+91', 'IN'],
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Color(0xf7070704F))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 67, 235, 218))),
                                border: InputBorder.none,
                                labelText: '     Select Country',
                                fillColor: Colors.white,
                                labelStyle: const TextStyle(fontFamily: 'poppins-regular', fontSize: 12),
                              )),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Phone Number',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                                TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ])),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter Phone Number');
                              }
                              return null;
                            },
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon:Container(
                                margin: const EdgeInsets.only(right:10),  
                                  height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xf7070704F)),
                          borderRadius: const BorderRadius.only(topLeft:Radius.circular(10),bottomLeft: Radius.circular(10))
                            ),
                            child: CountryCodePicker(
                              flagWidth: 25,
                              padding:const EdgeInsets.only(left:0),
                                    onChanged: (value) {
                                    },
                                    initialSelection: 'IN',
                                   hideMainText: true,
                                    favorite: const ['+91', 'IN'],
                                  ),
                          ),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Color(0xf7070704F))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 67, 235, 218))),
                                border: InputBorder.none,
                                labelText: '   Enter Phone Number',
                                fillColor: Colors.white,
                                labelStyle: const TextStyle(fontFamily: 'poppins-regular', fontSize: 12),
                                filled: true),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Email',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                                TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ])),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter Email');
                              }
                              return null;
                            },
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Color(0xf7070704F))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 67, 235, 218))),
                                border: InputBorder.none,
                                labelText: '   Enter Email',
                                fillColor: Colors.white,
                                labelStyle: const TextStyle(fontFamily: 'poppins-regular', fontSize: 12),
                                filled: true),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Password',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                                TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ])),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ('Enter Password');
                              }
                              return null;
                            },
                            controller: _passwordController,
                            textInputAction: TextInputAction.done,
                            obscureText: passToggle,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(passToggle
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye_fill),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Color(0xf7070704F))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 67, 235, 218))),
                                border: InputBorder.none,
                                labelText: '   Enter Password',
                                fillColor: Colors.white,
                                labelStyle: const TextStyle(fontFamily: 'poppins-regular', fontSize: 12),
                                filled: true),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: Checkbox(
                                value: checkBoxValue,
                                activeColor: const Color.fromARGB(255, 67, 235, 218),
                                onChanged: (newValue) {
                                  setState(() {
                                    checkBoxValue = newValue ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'I agree to the Terms of Service and Privacy Policy',
                              style: TextStyle(
                                  fontFamily: 'poppins-regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],

                        ),
                        const SizedBox(height: 30),
                         ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)),
                                      elevation: 5,
                                     ),
                                     onPressed: () {
                           if (key.currentState!.validate() && checkBoxValue) {
                            registerUser(
                            _emailController.text,
                            _nameController.text,
                            _countryController.text,
                            _phoneController.text,
                            _passwordController.text,
                            );
                                   } },
                                     child: Ink(
                                     decoration: BoxDecoration(
                                     gradient:   const LinearGradient(
                                    begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   colors: [Color(0xff39DEE8),Color(0xff42566A)],
                                       ),
                                      borderRadius: BorderRadius.circular(10)),
                                       child: Container(
                                        height:65,
                                         width:320,
                                         constraints:const BoxConstraints(minWidth: 88.0),
                                         child:  const Center(
                                           child:Text('Create Account',
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
                        const SizedBox(height: 10),
                   Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                  const Text('Already have an account ?',
                                    style:  TextStyle(
                                        fontSize:16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                GestureDetector(
                                  onTap: (){
                                   Navigator.pushNamed(context, RoutesName.login);
                                  },
                                    child:  const Row(
                                      children: [
                                        ( 
                                 Text(' Login',
                                  style: TextStyle(
                                          fontSize:16,
                                          color: Color(0xff3E38F5),
                                          fontWeight: FontWeight.w400),
                                        )),
                                       Icon(CupertinoIcons.arrow_up_right,
                                       size: 20,
                                         color: Color(0xff3E38F5),)
                                      ],
                                    )
                                    )
                              ],
                            ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
          )],
                )
                )
                )
                )
                );
             
  }
}
