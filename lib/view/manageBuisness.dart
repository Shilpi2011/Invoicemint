import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/model/active_buisness_response.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/view/add_buisnessProfile.dart';
import 'package:Invoicemint/view/buisness_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ManageBusinessScreen extends StatefulWidget {
const ManageBusinessScreen({super.key});

  @override
  State<ManageBusinessScreen> createState() => _ManageBusinessScreenState();
}

class _ManageBusinessScreenState extends State<ManageBusinessScreen> {
  bool toggleValue = false;


 Future<ManageBusinessResponse> getActiveBuisnessList() async {
  var response = await http.get(
    Uri.parse('https://www.invoicemint.in/businesses/active'),
    headers: {
      "Authorization":'Bearer $accesstoken',
    },
  );

 var jsonRes = json.decode(response.body);
  try {
    if (response.statusCode == 200) {
    } else {
      print('Failed to load invoices: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load invoices: ${response.statusCode}');
    }
  } catch (e) {
    print('Error decoding JSON: $e');
    throw Exception('Failed to load invoices: $e');
  }
      return ManageBusinessResponse.fromJson(jsonRes);
}




Future<ManageBusinessResponse> getDeletedBusinessList() async {
  var response = await http.get(
    Uri.parse('https://www.invoicemint.in/businesses/all-deleted?page=0&size=15&userId=$userId'),
    headers: {
      "Authorization":'Bearer $accesstoken',
    },
  );

 var jsonRes = json.decode(response.body);
  try {
    if (response.statusCode == 200) {
    } else {
      print('Failed to load invoices: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load invoices: ${response.statusCode}');
    }
  } catch (e) {
    print('Error decoding JSON: $e');
    throw Exception('Failed to load invoices: $e');
  }
      return ManageBusinessResponse.fromJson(jsonRes);
}

late Future<ManageBusinessResponse> myFuture  = getActiveBuisnessList();
late Future<ManageBusinessResponse>  getDeleted = getDeletedBusinessList();

String accesstoken = '';
int userId = 0;

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
      print(userId);
    });
    myFuture = getActiveBuisnessList();
    getDeleted = getDeletedBusinessList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        flexibleSpace: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color.fromARGB(255, 65, 213, 221),Color.fromARGB(15, 172, 214, 255)]),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/recImage.png'))),
              ),
          automaticallyImplyLeading: false,
          title: const Text(
            'Manage Business',
            style: TextStyle(fontSize: 20),
          ),
        
          bottom: TabBar(
            indicatorWeight: 6,
            indicatorColor: Colors.teal[50],
            tabs:const  [
              Tab(text: 'Active Business Profile'),
              Tab(text: 'Deleted Business Profile'),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10,top:20,bottom:1),
              child: Container(
                height: 30,
                width: 148,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(255, 196, 242, 245), Color.fromARGB(255, 243, 211, 211)],
                  ),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const  BuisnessProfileScreen()));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'Business Profile',
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          fontSize:12,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
          FutureBuilder(
          future: myFuture,
          builder: (context, AsyncSnapshot<ManageBusinessResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
           return const Center(
             child: Padding(
               padding: EdgeInsets.only(top: 130),
               child: CircularProgressIndicator(
                 color: Colors.red,
               ),
             ),
           );
          } else if (snapshot.hasData) {
           return SizedBox(
             height: 600,
             child: ListView.builder(
               itemCount: snapshot.data!.content.length,
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                       margin: const EdgeInsets.all(10),
                       height: 120,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4),
                         ],
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                        Padding(
                        padding: const EdgeInsets.only(left:10,top:0),
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             const Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                       Text('Business Name',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),),
                                         
                                         Text('Phone No.',
                                           style: TextStyle(
                                             fontSize:12,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black54,
                                           ),),
                                             
                                           Text('Country',
                                           style: TextStyle(
                                             fontSize:12,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black54,
                                           ),),
                                          
                                           Text('Email Id',
                                           style: TextStyle(
                                             fontSize:12,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black54,
                                           ),)                
                               ],
                             ),
                             const SizedBox(width: 10,),
                                const Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),) ,
                                  
                                        Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),),
                                 
                                              Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),) ,
                                   
                                         Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),) 
                               ],
                             ),
                             const SizedBox(width:8),
                                   Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                           Text(snapshot.data!.content[index].businessName,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                            
                                              Text(snapshot.data!.content[index].number,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                            
                                               Text(snapshot.data!.content[index].country,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                            
                                           Text(snapshot.data!.content[index].email,
                                           overflow: TextOverflow.ellipsis,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                          ],
                                        )      ,
                                SizedBox(
                                 height: 60,
                                 width:50,
                                child: Center(
                                child: Image.network(
                                "https://www.invoicemint.in/web/download-image/${snapshot.data!.content[index].businessLogo}",
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
                                ),
                                ),
                             ),
                           ],
                         ),
                        ),
                     Padding(
                      padding: const EdgeInsets.only(top: 10,right: 20),
                      child: InkWell(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuisnessDetailScreen() ));
                         },
              child:const Align(
               alignment: Alignment.bottomRight,
               child:  Text('View',style: TextStyle(fontFamily: 'poppins-medium,',fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 18, 200, 182)),))),
                        )                          
                         ],
                       ),
                     );
               },
             ),
           );
          }
        }
        return const Center(
          child: CircularProgressIndicator(
           color: Colors.teal,
          ),
        );
        },
         ),
       FutureBuilder(
          future:getDeleted,
          builder: (context, AsyncSnapshot<ManageBusinessResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
           return const Center(
             child: Padding(
               padding: EdgeInsets.only(top: 130),
               child: CircularProgressIndicator(
                 color: Colors.red,
               ),
             ),
           );
          } else if (snapshot.hasData) {
           return SizedBox(
             height: 600,
             child: ListView.builder(
               itemCount: snapshot.data!.content.length,
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                        margin: const EdgeInsets.all(10),
                        height: 120,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4),
                         ],
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                        Padding(
                        padding: const EdgeInsets.only(left:10,top:0),
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             const Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                       Text('Business Name',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),),
                                         SizedBox(height:2),
                                         Text('Phone No.',
                                           style: TextStyle(
                                             fontSize:12,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black54,
                                           ),),
                                             SizedBox(height:2),
                                           Text('Country',
                                           style: TextStyle(
                                             fontSize:12,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black54,
                                           ),),
                                             SizedBox(height:2),
                                           Text('Email Id',
                                           style: TextStyle(
                                             fontSize:12,
                                             fontFamily: 'poppins-regular',
                                             fontWeight: FontWeight.w600,
                                             color: Colors.black54,
                                           ),)                
                               ],
                             ),
                             const SizedBox(width: 10,),
                                const Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),) ,
                                      
                                        Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),),
                                      
                                              Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),) ,
                                      
                                         Text(':-',
                                       style: TextStyle(
                                         fontSize:12,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black54,
                                       ),) 
                               ],
                             ),
                             const SizedBox(width:8),
                                   Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                           Text(snapshot.data!.content[index].businessName,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                              Text(snapshot.data!.content[index].number,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                               Text(snapshot.data!.content[index].country,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                            
                                           Text(snapshot.data!.content[index].email,
                                           overflow: TextOverflow.ellipsis,
                                             style: const TextStyle(
                                               fontSize:12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.w400,
                                               color: Colors.black,
                                             ),),
                                          ],
                                        )      ,
                                SizedBox(
                                 height: 60,
                                 width:50,
                                child: Center(
                                child: Image.network(
                                "https://www.invoicemint.in/web/download-image/${snapshot.data!.content[index].businessLogo}",
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
                                ),
                                ),
                             ),
                           ],
                         ),
                        ),
                     Padding(
                      padding: const EdgeInsets.only(top: 0,right: 20),
                      child: InkWell(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuisnessDetailScreen() ));
                         },
              child:const Align(
               alignment: Alignment.bottomRight,
               child:  Text('View',style: TextStyle(fontFamily: 'poppins-medium,',fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 18, 200, 182)),))),
                        )                          
                         ],
                       ),
                     );
               },
             ),
           );
          }
        }
        return const Center(
          child: CircularProgressIndicator(
           color: Colors.teal,
          ),
        );
        },
         ),
          ],
        ),
      ),
    );
  }
}



