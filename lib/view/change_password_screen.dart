import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

final _newPasswordController = TextEditingController();
final _passwordController = TextEditingController();
  bool passToggle =true;
  @override
  Widget build(BuildContext context) {
 final heightSize = MediaQuery.of(context).size.height;
 final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height:heightSize ,
            width: widthSize,
            decoration: const BoxDecoration(
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/invoicemint bg.png'))),  
            child: Column(
            children: [
            Align(
            alignment: Alignment.topLeft,
           child: Padding(
             padding: const EdgeInsets.only(left:20,top: 30),
             child:  IconButton(
             onPressed:(){
             Navigator.pop(context);
                 } 
            , icon:const Icon(Icons.arrow_back_ios,size:20, color: Colors.black,)),
           )),
           const SizedBox(height: 20,),
              const Padding(
              padding: EdgeInsets.symmetric(horizontal:35),
                child: Align(
                alignment: Alignment.topLeft,
                child: Text('Create New Password',
                style:TextStyle(
                fontSize:25,
                fontFamily:'poppins-regular',
                fontWeight: FontWeight.bold,
                color:Color(0xff000000))),
                      ),
              ),
            const  SizedBox(height:16),
           const Padding(
           padding: EdgeInsets.symmetric(horizontal:35),
             child: Align(
              alignment: Alignment.topLeft,
               child: Text('This password should be different from\nthe previous password.',
                style:TextStyle(
                fontSize:16,
                fontFamily:'poppins-medium',
                fontWeight: FontWeight.w500,
                color:Color(0xf7070704F))),
             ),
           ),  
              const SizedBox(height:40),
            const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                           padding: EdgeInsets.symmetric(horizontal:40),
                              child: Text(
                              'New Password',
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
                          } else if(_passwordController.text.length < 6){
                            return ('Atleast 6 character');
                                  }
                           return null;
                                },
                            obscureText: passToggle,
                            controller: _newPasswordController, 
                            textInputAction: TextInputAction.next,
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
                          child: Icon(passToggle?Icons.visibility_off:Icons.visibility,size: 16,color:Color(0xf7070704F))),
                               focusedBorder: const OutlineInputBorder(
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
               const SizedBox(height: 25),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                           padding: EdgeInsets.symmetric(horizontal:40),
                              child: Text(
                              'Confirm Password',
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
                          } else if(_passwordController.text.length < 6){
                            return ('Atleast 6 character');
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
                            child: Icon(passToggle?Icons.visibility_off:Icons.visibility,size: 16, color:Color(0xf7070704F))),
                               focusedBorder: const OutlineInputBorder(
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
                      const SizedBox(height:80),    
                       ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                                        elevation: 5,
                                       ),
                                       onPressed: () {
                                            Navigator.pushNamed(context, RoutesName.login);
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
                                             child:Text('Reset Password',
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
                       
          ], 
          ),
          ),
        ),
      ),
    );
  }
}