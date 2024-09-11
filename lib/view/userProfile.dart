import 'package:flutter/material.dart';                                                
import 'package:Invoicemint/view/userEditProfile.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});
                                                     
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
   final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final widthsize = mediaQueryData.size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
      decoration: const BoxDecoration(
     image: DecorationImage(
     fit: BoxFit.cover,
     image: AssetImage('assets/images/invoicemint bg.png'))),       
          child: Column(
            children: [
              Stack(
              children:[
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [  
                 Container(
                height:100,
                width: widthsize,
                decoration:  BoxDecoration(
                gradient:const LinearGradient(
                 colors: [Color(0xff39DEE8), Color(0xff42566A)],
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter),     
                  boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                       blurRadius: 4)
                        ],
                    borderRadius: const  BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                           ),
                         ),
                    child:  Stack(children: [
                    Padding(
                   padding:const EdgeInsets.fromLTRB(10,20,0,0),
                   child: Row(
                     children: [
                    IconButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size:18,)),
                     const  Text('Profile',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize:18,
                           fontFamily: 'poppins-regular',
                           fontWeight: FontWeight.w700),
                        ),
                     ],
                   ),
                 ),  
                    ],),
                 ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                   const SizedBox(
                      height: 70,
                        ),
                  Column(
                      children: [
                         Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                         height: 80,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Colors.white,
                            boxShadow: [
                                 BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4)
                                              ],
                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                         ),
                         child:  const Padding(
                           padding: EdgeInsets.fromLTRB(
                             20,
                             0,
                             20,
                             0,
                           ),
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                      Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                          " User Name",
                                             textAlign: TextAlign.start,
                                             style: TextStyle(
                                             fontFamily: 'poppins-regular',
                                                 color: Colors.grey, fontSize: 12),
                                           )),
                                           SizedBox(height:8),
                                       Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(' Shilpi Tiwari',
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 14,
                                                 fontFamily: 'poppins-regular',
                                                 fontWeight: FontWeight.w700),
                                           )),
                                     ]),
                                 Icon(Icons.person)
                               ]),
                         ),
                       ),
                       const SizedBox(height: 20,) ,
                       Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                         height: 80,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Colors.white,
                            boxShadow: [
                                 BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4)
                                              ],
                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                         ),
                         child: const Padding(
                           padding:  EdgeInsets.fromLTRB(
                             20,
                             0,
                             20,
                             0,
                           ),
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                     Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                          'Email Id',
                                             textAlign: TextAlign.start,
                                             style: TextStyle(
                                             fontFamily: 'poppins-regular',
                                                 color: Colors.grey, fontSize: 12),
                                           )),
                                       SizedBox(
                                         height: 10,
                                       ),
                                       Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                             'shilpitiwari@gmail.com',
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 14,
                                                 fontFamily: 'poppins-regular',
                                                 fontWeight: FontWeight.w700),
                                           )),
                                     ]),
                                 Icon(Icons.email)
                               ]),
                         ),
                       ),  
                       const SizedBox(height: 20,) ,
                       Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                         height: 80,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Colors.white,
                            boxShadow: [
                                 BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4)
                                              ],
                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                         ),
                         child: const Padding(
                           padding: EdgeInsets.fromLTRB(
                             20,
                             0,
                             20,
                             0,
                           ),
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                    Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                        'Phone Number',
                                             textAlign: TextAlign.start,
                                             style:  TextStyle(
                                                 color: Colors.grey, fontSize: 12,
                                             fontFamily: 'poppins-regular'
                                                 ),
                                           )),
                                       SizedBox(
                                         height: 10,
                                       ),
                                       Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                           "8707825790",
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 14,
                                                 fontFamily: 'poppins-regular',
                                                 fontWeight: FontWeight.w700),
                                           )),
                                     ]),
                                 Icon(Icons.phone)
                               ]),
                         ),
                       ),
                     const  SizedBox(height: 20,),
                      Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                         height: 80,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Colors.white,
                            boxShadow: [
                                 BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4)
                                              ],
                           borderRadius: const BorderRadius.all(Radius.circular(20)),
                         ),
                         child: const Padding(
                           padding: EdgeInsets.fromLTRB(
                             20,
                             0,
                             20,
                             0,
                           ),
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                            "Country Name",
                                             textAlign: TextAlign.start,
                                             style: TextStyle(
                                                 color: Colors.grey, 
                                             fontFamily: 'poppins-regular' ,fontSize: 12),
                                           )),
                                       SizedBox(
                                         height: 10,
                                       ),
                                       Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(
                                            "India",
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 14,
                                                 fontFamily: 'poppins-regular',
                                                 fontWeight: FontWeight.w700),
                                           )),
                                     ]),
                                 Icon(Icons.location_city_rounded)
                               ]),
                         ),
                       ),
                       const SizedBox(height: 60,),
                         Center(
                               child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)),
                                                       elevation: 5,
                                                      ),
                                                      onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: ((context) => const UserEditProfile())));                   
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
                                 child: Text('Edit Profile',
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
                  Positioned(
                    top: 45,
                    left:140,
                    child: Container(
                    height:100,
                    width:120,
                    decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                      color: Colors.teal.withOpacity(.5),
                       blurRadius: 5)
                        ],
                    color: Colors.white,
                    borderRadius:const BorderRadius.all(Radius.circular(20))
                    ),
              child: Image.asset('assets/images/App Icon.png',)))
                      ]
                      ),
            ],
          ),
        ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
          
      ),
    );
  }
}


