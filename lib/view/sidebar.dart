import 'package:Invoicemint/view/nd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/utils/app_icons_icons.dart';


class SidebarScreen extends StatefulWidget {
const SidebarScreen({super.key});

  @override
  State<SidebarScreen> createState() => _SidebarScreenState();
} 

class _SidebarScreenState extends State<SidebarScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight:Radius.circular(50))),
      child: Stack(
        children: [
          ListView(
          padding: EdgeInsets.zero,
          children: [
               SizedBox(
                height: 150,
                child: DrawerHeader(
                decoration: const BoxDecoration(
                 borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                color: Colors.transparent,
                image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Rectangle 94.png'))),
                child:Padding(
                  padding: const EdgeInsets.only(bottom:30),
                  child: Image.asset('assets/images/Sidebar logo.png',scale: 3,),
                ), 
                    ),
                    ),  
                  const  Padding(
                    padding:  EdgeInsets.only(left:15,top:50),
                    child: Text('MAIN MENU',  style: TextStyle(
                    fontSize:20,
                    fontFamily: 'poppins-regular',
                    fontWeight: FontWeight.w500,
                    color:Colors.black),),
                  ),             
                const Divider(color: Colors.grey,thickness: 1.2,indent: 15,endIndent: 15,),
                 SizedBox(
                 height: 40,
                  child: ListTile(
                    leading: const Icon(AppIcons.group_433,color: Colors.black54,size: 20,),
                      title: const Text('Dashboard',  style: TextStyle(
                           fontSize:14,
                           fontFamily: 'poppins-medium',
                           fontWeight: FontWeight.w500,
                           color:Colors.black54),),
                    onTap: () {  
                            },
                    ),
                ),
                   SizedBox(
                     height: 40,
                     child: ListTile(
                  leading: const Icon(AppIcons.group_464 ,color: Colors.black54,size: 20,),
                      title: const Text('Analytics',  style: TextStyle(
                      fontSize:14,
                      fontFamily: 'poppins-medium',
                      fontWeight: FontWeight.w500,
                      color:Colors.black54),),
                       onTap: () { 
                            },
                       ),
                   ),
                    
                   SizedBox(
                     height: 40,
                     child: ListTile(
                      leading: const Icon(AppIcons.group_467,color: Colors.black54,size: 20,),
                      title: const Text('Notifications',  style: TextStyle(
                           fontSize:14,
                           fontFamily: 'poppins-medium',
                           fontWeight: FontWeight.w500,
                           color:Colors.black54),),
                         onTap: () {
                            },
                          ),
                   ),
                    const SizedBox(height: 20,),
                 const  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:15),
                    child: Text('SETTINGS',  style: TextStyle(
                    fontSize:20,
                    fontFamily: 'poppins-medium',
                    fontWeight: FontWeight.w500,
                    color:Colors.black),),
                  ),
              const Divider(color: Colors.grey,thickness: 1.2,indent: 15,endIndent: 15,),
               SizedBox(
                      height: 40,
                  child: ListTile(
                    leading: const Icon(Icons.person,color: Colors.black54,size: 20,),
                      title: const Text('User Profile',  style: TextStyle(
                           fontSize:14,
                           fontFamily: 'poppins-medium',
                           fontWeight: FontWeight.w500,
                           color:Colors.black54),),
                    onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddItemScreen()));
                            },
                    ),
                ),
                SizedBox(
                      height: 40,
                  child: ListTile(
                    leading: const Icon(AppIcons.group_469,color: Colors.black54,size: 20,),
                      title: const Text('Privacy Policy',  style: TextStyle(
                           fontSize:14,
                           fontFamily: 'poppins-medium',
                           fontWeight: FontWeight.w500,
                           color:Colors.black54),),
                    onTap: () {
                            },
                    ),
                ),
                   SizedBox(
                        height: 40,
                     child: ListTile(
                     leading: const Icon(AppIcons.group_471 ,color: Colors.black54,size: 20,),
                      title: const Text('Terms & Conditions',  style: TextStyle(
                           fontSize:14,
                           fontFamily: 'poppins-medium',
                           fontWeight: FontWeight.w500,
                           color:Colors.black54),),
                                   onTap: () {
              
                            },
                                   ),
                   ),
                   SizedBox(
                        height: 40,
                     child: ListTile(
                      leading: const Icon(AppIcons.group_473,color: Colors.black54,size: 20,),
                      title: const Text('Help Center',  style: TextStyle(
                           fontSize:14,
                           fontFamily: 'poppins-medium',
                           fontWeight: FontWeight.w500,
                           color:Colors.black54),),
                         onTap: () {
                            },
                          ),
                   ),
                    const SizedBox(height:40,),
                    ListTile(
                    leading: const Icon(AppIcons.group_545,color: Colors.red,size: 20,),
                    title: const Text('Logout',  style: TextStyle(
                         fontSize:18,
                         fontFamily: 'poppins-regular',
                         fontWeight: FontWeight.bold,
                         color:Colors.red),),
                       onTap: () {
                          },
                        ),
                        ],
                    ),
                   Positioned(
                    top: 110,
                    left: 25,
                    child: SizedBox(
                      width:250,
                      child: SearchBar(
                     shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(10)) )),
                    hintStyle: MaterialStateProperty.all(const TextStyle( fontSize:14,
                     fontFamily: 'poppins-regular',)),
                      leading: IconButton(
                      onPressed: (){  
                    }, icon:const Icon(AppIcons.group_462,color:  Color(0xf7070704F),size:20,)),
                       hintText: 'Search...',      
                      ),
                    ),
                  ),     
             Positioned(
             top:30,
             right: 5,
             child: IconButton(onPressed:(){
             Navigator.pop(context);
             }, icon: const Icon(CupertinoIcons.xmark_circle_fill,color: Color.fromARGB(255, 165, 245, 234),))),
             ]  ),
             );
             }
             }