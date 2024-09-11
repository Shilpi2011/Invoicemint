import 'package:flutter/material.dart';
import 'package:Invoicemint/view/userProfile.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}
class _UserEditProfileState extends State<UserEditProfile> {
final addressController = TextEditingController(text: 'D block near smile dental sector 63A, noida');
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final GlobalKey<FormState> _formProfileKey = GlobalKey<FormState>();

@override
 final GlobalKey<FormState> Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: () => FocusScope.of(context).unfocus(), 
     child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 30,
            ),
          ),
          title: const Text('Edit-Profile', 
               style:  TextStyle(
               color: Colors.black,
               fontSize: 20,
               fontFamily: 'poppins-regular',
               fontWeight: FontWeight.w700),
                       ),
                ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
              left: 10,
              right: 10),
          child: Form(
            key: _formProfileKey,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10,top: 20),
                    child: Column(
                      children: [
                        Image.asset('assets/images/invoicemint_logo.png',scale: 3.5,),
                        const SizedBox(height: 40,),
                          TextFormField(
                          //  validator:(value){
                          //  if(value!.isEmpty){
                          //         return(AppLocale.firstEmpty.getString(context));
                          //       }
                          //       return null;
                          //     },
                            textAlignVertical: TextAlignVertical.center,
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              hintText:'User Name',
                              hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              prefixIcon:Icon(Icons.person,color: Colors.black,),
                            ),
                         textInputAction: TextInputAction.next),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            controller: emailController,
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              hintText: 'Email Id',
                                 hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                          prefixIcon: Icon(Icons.email,color: Colors.black,),
                            ),
                            textInputAction: TextInputAction.next),
                            const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          // validator: (value) {
                          //     if(value!.isEmpty){
                          //     return(AppLocale.Enter_your_phone.getString(context));
                          //    }else if (phoneController.text.length > 10){
                          //    return ('Enter only 10 digits');
                          //           };
                          //   },
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              hintText:'Phone Number',
                                 hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                          prefixIcon: Icon(Icons.phone,color: Colors.black,),
                            ),
                            textInputAction: TextInputAction.done),
                              const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          //  validator:(value){
                          //  if(value!.isEmpty){
                          //         return(AppLocale.lastName.getString(context));
                          //       }
                          //       return null;
                          //     },
                            controller:lastNameController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration:const  InputDecoration(
                              hintText: 'Country Name',
                                 hintStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              prefixIcon: Icon(Icons.person,color: Colors.black,),
                            ),
                            textInputAction: TextInputAction.next),
                           
                        const SizedBox(
                          height: 60,
                        ),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 5,
              ),
              onPressed: ()  { 
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const UserProfile())));      
              },
              child: Ink(
                decoration: BoxDecoration(
               gradient: const  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,  
            colors: [Color(0xff39DEE8),Color(0xff42566A)],
                  ),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(15),
                  constraints: const BoxConstraints(minWidth: 88.0),
                  child:const Text('Save Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                            ),
                          ),
                        ),
                             ]),
                             )]
                             ))
                             ))),
                          );
                           }
                           }
             