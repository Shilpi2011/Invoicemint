import 'dart:convert';
import 'package:Invoicemint/model/active_client_response.dart';
import 'package:Invoicemint/model/deleted_client_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:Invoicemint/view/clientDetails.dart';
import 'package:Invoicemint/view/add_clientProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ManageClientScreen extends StatefulWidget {
  const ManageClientScreen({super.key});

  @override
  State<ManageClientScreen> createState() => _ManageClientScreenState();
}

class _ManageClientScreenState extends State<ManageClientScreen> {
  bool toggleValue = false;

Future<List<Client>> getActiveClientList() async {
 Client client ;
  var response = await http.get(
    Uri.parse('https://www.invoicemint.in/clients/active?page=0&size=15&userId=$userId'),
    headers: {
      "Authorization":'Bearer $accessToken'
    },
  );

  final List<dynamic> jsonResponse = jsonDecode(response.body);
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
      return jsonResponse.map((json) => Client.fromJson(json)).toList();
}

Future<List<DeletedClientRespons>> getDeletedClientList() async {
 DeletedClientRespons deletedClientRespons;
  var response = await http.get(
    Uri.parse('https://www.invoicemint.in/clients/all-deleted?page=0&size=15&userId=$userId'),
    headers: {
      "Authorization":'Bearer $accessToken'
    },
  );

  final List<dynamic> jsonResponse = jsonDecode(response.body);
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
 return jsonResponse.map((json) => DeletedClientRespons.fromJson(json)).toList();
}


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
  }

  String accesstoken = '';
  int userId = 0;



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
            'Manage Client',
            style: TextStyle(fontSize: 20),
          ),
          bottom:  TabBar(
           indicatorWeight: 6,
            indicatorColor: Colors.teal[50],
            tabs: const[
              Tab(text: 'Active   Client'),
              Tab(text: 'Deleted  Client'),
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
  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddClientProfile() ));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 16),
                      Text(
                        'Add Client',
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          fontSize: 12,
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
            CustomScrollView(
              slivers: [
              SliverToBoxAdapter(
              child:Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/invoicemint bg.png'))), 
              )
                ),
           SliverToBoxAdapter(
          child:FutureBuilder(
          future: getActiveClientList(),
          builder: (context, AsyncSnapshot<List<Client>> snapshot) {
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
               final clients = snapshot.data!;
            return SizedBox(
              height: 900,
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (BuildContext context, int index) {
                      final activeClient = clients[index];
                  return  Container(
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Padding(
                                         padding: const EdgeInsets.only(top:11.0),
                                         child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text.rich(
                                              TextSpan(children: [
                                              const  TextSpan(
                                                  text: 'Client Name         :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:'     ${activeClient.clientBusinessName}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                              Text.rich(
                                              TextSpan(children: [
                                            const TextSpan(
                                                  text: 'Client Of                :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                           TextSpan(
                                                  text:'     ${activeClient.clientOf}',
                                                  style:const  TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                           Text.rich(
                                              TextSpan(children: [
                                              const  TextSpan(
                                                  text: 'Phone No.              :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                             TextSpan(
                                                  text: '     ${activeClient.number}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                            Text.rich(
                                              TextSpan(children: [
                                               const TextSpan(
                                                  text: 'Email Id                  :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "     ${activeClient.email}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                   fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),

                                          ],
                                        ),
                                       ),
                                    Expanded(
                                               child: Container(
                                      height: 80,
                                    width: 80,
                                 decoration: BoxDecoration(
                                 borderRadius: const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.white),
                                ),
                              child: Image.network(
                             "https://www.invoicemint.in/web/download-image/${activeClient.businessLogo}",
                              scale: 6,
                              errorBuilder: (context, error, stackTrace) {
                               return Container(
                                height: 80,
                                width: 80,
                                decoration:const  BoxDecoration(
                                ),
                                child:const  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(Icons.close,color: Colors.red,),
                                Text('No Data',style:TextStyle(fontSize:12,fontFamily: 'poppins-regular',fontWeight:FontWeight.bold))
                                  ],
                                ),
                               );
                               },
                               ),
                                ),
                                             ),
                                    ],
                                  ),
                                ),
                              ),
                       Padding(
                       padding:const EdgeInsets.only(top:0,right: 20,bottom:10),
                       child: InkWell(
                       onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientDetailScreen() ));
                            },
               child:const Align(
                alignment: Alignment.bottomRight,
                child:  Text('View',style: TextStyle(fontFamily: 'poppins-medium,',fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 18, 200, 182)),))),
                         )            
                            ],
                          ),
                        ),
                      );}));
          
          }
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        );
      },
    ) ),   
            const SliverToBoxAdapter(
          child: SizedBox(height: 110),
        ),
              ],
            ),
              CustomScrollView(
              slivers: [
              SliverToBoxAdapter(
              child:Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/invoicemint bg.png'))), 
              )
                ),
           SliverToBoxAdapter(
          child:FutureBuilder(
          future: getDeletedClientList(),
          builder: (context, AsyncSnapshot<List<DeletedClientRespons>> snapshot) {
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
               final clients = snapshot.data!;
            return SizedBox(
              height: 900,
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (BuildContext context, int index) {
                      final activeClient = clients[index];
                  return  Container(
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Padding(
                                         padding: const EdgeInsets.only(top:11.0),
                                         child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text.rich(
                                              TextSpan(children: [
                                              const  TextSpan(
                                                  text: 'Client Name         :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:'     ${activeClient.clientBusinessName}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                              Text.rich(
                                              TextSpan(children: [
                                            const TextSpan(
                                                  text: 'Client Of                :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                           TextSpan(
                                                  text:'     ${activeClient.clientOf}',
                                                  style:const  TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                           Text.rich(
                                              TextSpan(children: [
                                              const  TextSpan(
                                                  text: 'Phone No.              :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                             TextSpan(
                                                  text: '     ${activeClient.number}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                            Text.rich(
                                              TextSpan(children: [
                                               const TextSpan(
                                                  text: 'Email Id                  :-',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "     ${activeClient.email}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                   fontFamily: 'poppins-regular',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ]),
                                            ),

                                          ],
                                        ),
                                       ),
                                    Expanded(
                                               child: Container(
                                      height: 80,
                                    width: 80,
                                 decoration: BoxDecoration(
                                 borderRadius: const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.white),
                                ),
                              child: Image.network(
                             "https://www.invoicemint.in/web/download-image/${activeClient.businessLogo}",
                              scale: 6,
                              errorBuilder: (context, error, stackTrace) {
                               return Container(
                                height: 80,
                                width: 80,
                                decoration:const  BoxDecoration(
                                ),
                                child:const  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(Icons.close,color: Colors.red,),
                                Text('No Data',style:TextStyle(fontSize:12,fontFamily: 'poppins-regular',fontWeight:FontWeight.bold))
                                  ],
                                ),
                               );
                               },
                               ),
                                ),
                                             ),
                                    ],
                                  ),
                                ),
                              ),
                       Padding(
                       padding:const EdgeInsets.only(top:0,right: 20,bottom:10),
                       child: InkWell(
                       onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClientDetailScreen() ));
                            },
               child:const Align(
                alignment: Alignment.bottomRight,
                child:  Text('View',style: TextStyle(fontFamily: 'poppins-medium,',fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 18, 200, 182)),))),
                         )            
                            ],
                          ),
                        ),
                      );}));
          
          }
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        );
      },
    ) ),   
            const SliverToBoxAdapter(
          child: SizedBox(height: 110),
        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



            