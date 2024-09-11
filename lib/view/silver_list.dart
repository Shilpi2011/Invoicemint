import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/model/all_invoiceresponse.dart';
import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/view/email.dart';
import 'package:Invoicemint/view/emailReminder.dart';
import 'package:Invoicemint/view/paid.dart';
import 'package:Invoicemint/view/whatsAppMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliverListBldr extends StatefulWidget {
const SliverListBldr({super.key}); 


  @override
  State<SliverListBldr> createState() => _SliverListBldrState();
}
class _SliverListBldrState extends State<SliverListBldr> {

 Future<AllInvoicesResponse> getUserList() async {
  AllInvoicesResponse allInvoicesResponse;
  var response = await http.get(
    Uri.parse('https://www.invoicemint.in/create-invoice/all'),
    headers: {
      "Authorization":'Bearer $accesstoken',
    },
  );

 var jsonRes = json.decode(response.body);
  try {
    if (response.statusCode == 200) {
    } else {
      print(response.body);
      print('Failed to load invoices: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load invoices: ${response.statusCode}');
    }
  } catch (e) {
    print('Error decoding JSON: $e');
    throw Exception('Failed to load invoices: $e');
  }
      return AllInvoicesResponse.fromJson(jsonRes);
}

late Future<AllInvoicesResponse> myFuture  = getUserList();
String accesstoken = '';

  @override
  void initState() {
    super.initState();
    accessMethod();
  }

  void accessMethod() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      accesstoken = preferences.getString('accesstoken') ?? "Not found";
    });
    myFuture = getUserList();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myFuture,
      builder: (context, AsyncSnapshot<AllInvoicesResponse> snapshot) {
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
          return SliverList(
          delegate:SliverChildBuilderDelegate((BuildContext context, int index){
          return  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0, top: 15),
                            child: Container(
                              height: 150,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                       Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                       const   Text(
                                            'Invoice Date',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                          snapshot.data!.content[index].date,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-medium',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          const Text(
                                            'Invoice No.',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                             snapshot.data!.content[index].invoiceNo,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-medium',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          const Text(
                                            'Amount    ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                           Text(
                                       snapshot.data!.content[index].invoiceAmount.toString() ,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-medium',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                       Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        const  Text(
                                            'Due Date   ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                      snapshot.data!.content[index].dueDate,
                                            style:const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-medium',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        const  SizedBox(height: 2),
                                         const Text(
                                            'Billed To    ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                           snapshot.data!.content[index].billedTo,
                                            style:const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-medium',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        const  SizedBox(height: 2),
                                        const  Text(
                                            'Status       ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                       const   Text(
                                            'Unpaid    ',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/qr code.jpg',
                                        scale: 6,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -.25,
                          left: 0.0,
                          right: 5.0,
                          child: SizedBox(
                            height: 48,
                            child: ExpandableMenu(
                              iconColor: Colors.white,
                              itemContainerColor: Colors.transparent,
                              backgroundColor: const Color.fromARGB(255, 65, 165, 180),
                              width: 40.0,
                              items: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0, left: 8),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      InkWell(
                                        
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) => const EmailReminder()),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/email.png',
                                              height: 23,
                                              width: 30,
                                            ),
                                            const SizedBox(height: 2),
                                            const Text(
                                              '   Email \nReminder',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 7,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => const MarkAsPaidForm()),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/check.png',
                                        color: Colors.white,
                                        height: 23,
                                        width: 30,
                                      ),
                                      const SizedBox(height: 2.1),
                                      const Text(
                                        'Paid',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'View',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => const InvoiceEmail()),
                                      ),
                                    );
                                  },
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                const Column(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => const WhatsappMessage()),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/whatsapp.png',
                                        height: 22,
                                        width: 30,
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'WhatsApp',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

            },
            childCount:snapshot.data!.content.length
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
    );
  }
}
