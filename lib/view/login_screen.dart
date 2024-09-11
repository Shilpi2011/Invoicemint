import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Invoicemint/model/login_response.dart';
import 'package:Invoicemint/routes/route_name.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/bottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key}); 

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _emailController = TextEditingController(text:'ibsnilesh1998@gmail.com');
final _passwordController = TextEditingController(text:'1234');
bool first = false;
bool isLogin=false;
bool passToggle =true; 
bool checkBoxValue =false;
final GlobalKey<FormState> key = GlobalKey<FormState>();
  int start = 200;
  int delay = 200;
 

Future<LoginResponse?> loginUser(String email, String password,) async {
  LoginResponse? loginresponse;

  var requestBody = jsonEncode({
    "email": email,
    "password": password,
  });
  var response = await http.post(
    Uri.parse('https://www.invoicemint.in/api/auth/signin'),
    headers: {'Content-Type': 'application/json'},
    body: requestBody,
  );
  print(response);
  if (response.statusCode == 200) {
    var jsonRes = json.decode(response.body);
    loginresponse = LoginResponse.fromJson(jsonRes);
    print(response.body.toString());
   setState(() {
     isLogin = true;
   });
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('accesstoken', loginresponse.jwt);
    await preferences.setInt('userId', loginresponse.userId);
    await preferences.setBool('isLogged', true);
    accessToken = loginresponse.jwt;
     setState(() {
     isLogin = false;
   });
    Fluttertoast.showToast(
      msg: 'Login Successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
Navigator.push(context,MaterialPageRoute(builder: (context) => CustomBottomNavigation()), );
  } else {
    print(response.reasonPhrase);

    Fluttertoast.showToast(
      msg: 'Error',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  return null;
}


  @override
 Widget build(BuildContext context){
 final heightSize = MediaQuery.of(context).size.height;
 final widthSize = MediaQuery.of(context).size.width;
 return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child:  Container(
            height:heightSize,
            width: widthSize,
            decoration: const BoxDecoration(
             image: DecorationImage(
             fit: BoxFit.cover,
              image: AssetImage('assets/images/invoicemint bg.png'))),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 
                     const Text('Welcome To',
                     style: TextStyle(
                      fontFamily: 'poppins-regular',
                     fontSize:20,
                     fontWeight: FontWeight.w400,
                     color:  Color(0xff000000)),
                      ),
                Image.asset('assets/images/invoicemint_logo.png',scale:3),
                    const SizedBox(
                        height:20,
                      ),
                      Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)),
                         elevation: 0,
                                 ),
                                 onPressed: () {
                              //  if (formKey.currentState!.validate()){
                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              //       }
                                 },
                                 child: Ink(
                                 decoration: BoxDecoration(
                                 color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xf7070704F))
                                  ),
                                   child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 25),
                                     child: Container(
                                      height:55,
                                       width:widthSize,
                                       constraints: const BoxConstraints(minWidth: 88.0),
                                       child:Center(
                                         child:Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                          Image.asset('assets/images/Group 383.png'),
                                         const SizedBox(width:15),
                                          const Text('Login with google',
                                                 textAlign: TextAlign.center,
                                                 style:TextStyle(
                                                 fontSize:14,
                                                 fontFamily: 'poppins-regular',
                                                 fontWeight: FontWeight.bold,
                                                 color:Color(0xff000000))),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                      ),
                     const SizedBox(height: 10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(
                    height: 30,
                    width: 70,
                      child: Divider(
                        thickness:1.5,
                        color:  Color(0xf7070704F)
                      ),
                    ),
                    SizedBox(width:4),
                     Text(
                    'Or login with email',
                     style: TextStyle(
                     fontSize: 14,
                     fontFamily: 'poppins-regular',
                     fontWeight: FontWeight.bold,
                    color: Color(0xf7070704F)),
                      ),
                 SizedBox(width:4),
                      SizedBox(
                    height: 30,
                    width: 70,
                      child: Divider(
                        thickness:1.5,
                        color:Color(0xf7070704F)
                      ),
                    ),
                      ],
                    ) ,
                       const SizedBox(
                        height:30,
                      ),
                     const Align(
                      alignment: Alignment.centerLeft,
                       child: Padding(
                       padding: EdgeInsets.symmetric(horizontal:40),
                         child: Text(
                          'Enter Email ID',
                             style: TextStyle(
                             fontSize: 14,
                             fontFamily: 'poppins-regular',
                             fontWeight: FontWeight.bold,
                             color: Colors.black),
                                ),
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
                     return('enter your email');
                                }
                                return null;
                              },
                          textInputAction: TextInputAction.next,
                          controller: _emailController,
                          decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              hintText:'  johndoe@gmail.com',
                              fillColor: Colors.white,
                              hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                       padding: EdgeInsets.symmetric(horizontal:40),
                          child: Text(
                          'Enter Password',
                             style: TextStyle(
                             fontSize: 14,
                             fontFamily: 'poppins-regular',
                             fontWeight: FontWeight.bold,
                             color: Colors.black),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height:10,
                      ), 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child:    TextFormField(validator:  (value) {
                       if (value!.isEmpty) {
                       return ("enter your password");
                      } 
                       return null;
                            },
                        obscureText: passToggle,
                        controller: _passwordController, 
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(errorStyle: const TextStyle(fontSize: 10),
                        enabledBorder: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10),),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                         suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                          passToggle =!passToggle;
                                 });
                             },
                        child: Icon(passToggle?Icons.visibility_off:Icons.visibility,size: 18,color:const Color(0xf7070704F))),
                           focusedBorder: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                           borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              hintText:'  * * * * * * *',
                              hoverColor: Colors.red,
                              fillColor: Colors.white,
                              filled: true,
                              )
                              ),
                      ),
                      const SizedBox(
                    height:10
                      ),
                    Padding(
                    padding: const EdgeInsets.only(left:25,right:28),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,   
                      children: [
                     SizedBox(
                      height: 30,
                      width: 30,
                       child: Checkbox(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)
                        ),
                       side:const BorderSide(color:Color(0xf7070704F)),
                       value:checkBoxValue ,
                       fillColor: MaterialStateProperty.all(Colors.white),
                       checkColor: Colors.blue,
                       onChanged:(newValue){
                        setState(() {
                       checkBoxValue = newValue!;
                           });
                              }),
                     ),
                         const Text(
                          'Remember Me',
                         style: TextStyle(
                         fontSize: 13,
                          fontFamily: 'poppins-regular',
                         fontWeight: FontWeight.w400,
                         color: Color(0xff000000)),
                            ),
                        ],),
                        GestureDetector(
                          onTap: ()=> Navigator.pushNamed(context, RoutesName.resetPassword),
                          child: const Text(
                            'Forgot Password ?',
                           style: TextStyle(
                           fontSize: 13,
                            fontFamily: 'poppins-regular',
                           fontWeight: FontWeight.w400,
                           color: Color(0xff3E38F5)),
                              ),
                        ),
                          ],
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
                         if (key.currentState!.validate()){
                          loginUser(_emailController.text, _passwordController.text);
                    
                               }
                               },
                               child: Ink(
                               decoration: BoxDecoration(
                                color:Colors.red,
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
                                     child:Text('Login',
                                         textAlign: TextAlign.center,
                                         style:TextStyle(
                                         fontSize: 20,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white)),
                                   ),
                                 ),
                               ),
                             ),
                      const SizedBox(
                        height:20
                      ),
                     Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const  Text('New To Invoicemint ?',
                              style:  TextStyle(
                                  fontSize:14,
                                  fontFamily: 'poppins-regular',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          GestureDetector(
                            onTap: (){
                      Navigator.pushNamed(context, RoutesName.CreateAccount);
                            },
                              child: const Row(
                                children: [
                                  ( 
                           Text(' Create Account',
                            style: TextStyle(
                                    fontSize:14,
                                    fontFamily: 'poppins-regular',
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
                    ],
                  ),
            ),
          ),
        ) ,
    ));
    
  }
}