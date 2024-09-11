import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/invoicemint bg.png'))),  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left:20,top: 30),
                  child:  IconButton(
                 onPressed:(){
                Navigator.pop(context);
                 } 
                , icon:const Icon(Icons.arrow_back_ios,size:20, color: Colors.black,)),
                ),
                const  SizedBox(
                  height: 30,
                ),
                  const Padding(
                  padding: EdgeInsets.symmetric(horizontal:35),
                    child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Reset\nPassword',
                    style:TextStyle(
                    fontSize:30,
                    fontFamily:'poppins-regular',
                    fontWeight: FontWeight.w600,
                    color:Color(0xff000000))),
                          ),
                  ),
                const  SizedBox(height:20),
               const Padding(
               padding: EdgeInsets.symmetric(horizontal:35),
                 child: Align(
                  alignment: Alignment.topLeft,
                   child: Text('Please enter your email address to request a password reset.',
                    style:TextStyle(
                    fontSize:16,
                    fontFamily:'poppins-medium',
                    fontWeight: FontWeight.w500,
                    color:Color.fromARGB(111, 97, 97, 90))),
                 ),
               ),  
                  const SizedBox(height: 40,),
                const  Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:45),
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
                          const SizedBox(height: 10,),
                             Padding(
                             padding: const EdgeInsets.symmetric(horizontal:30),
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
                                  borderSide: BorderSide(
                                    color:Color.fromARGB(255, 67, 235, 218),
                                      )),
                                      border: InputBorder.none,
                                      hintText:'  johndoe@gmail.com',
                                      fillColor: Colors.white,
                                      hintStyle: TextStyle(fontFamily: 'poppins-regular'),
                                      filled: true),
                                ),
                              ),
                          const SizedBox(height:50),    
                           Center(
                             child: ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                     padding: EdgeInsets.zero,
                                                     shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(10)),
                             elevation: 5,
                              ),
                             onPressed: () {
                             Navigator.pushNamed(context, RoutesName.VerifyOtp); 
                           
                                          //  if (formKey.currentState!.validate()){
                                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                          //       }
                              },
                              child: Ink(
                              decoration: BoxDecoration(
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
                                    child:Text('Send Reset Password',
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
                           ),
                                  const SizedBox(
                                    height:15
                                  ),
                                 Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const  Text('You Remember Your Password ?',
                                          style:  TextStyle(
                                              fontSize:14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400)),
                                      GestureDetector(
                                        onTap: (){
                                   Navigator.pushNamed(context, RoutesName.login);
                                        },
                                          child: const Row(
                                            children: [
                                              ( 
                                       Text(' Login',
                                        style: TextStyle(
                                                fontSize:14,
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
            ],
          ),
        ),
      ),
    );
  }
}