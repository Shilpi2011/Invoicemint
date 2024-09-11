import 'dart:async';
import 'package:Invoicemint/model/user_business_list_response.dart';
import 'package:Invoicemint/model/user_client_list_response.dart';
import 'package:Invoicemint/utils/utilities.dart';
import 'package:Invoicemint/view_model/businessList_api_services.dart';
import 'package:Invoicemint/view_model/clientList_api_services.dart';
import 'package:Invoicemint/view_model/filterartion_api_services.dart';
import 'package:flutter/services.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Invoicemint/utils/app_icons_icons.dart';
import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/accounting.dart';
import 'package:Invoicemint/view/create_Invoice.dart';
import 'package:Invoicemint/view/home_screen.dart';
import 'package:Invoicemint/view/manageBuisness.dart';
import 'package:Invoicemint/view/manageClient.dart';
import 'package:provider/provider.dart';


class CustomBottomNavigation extends StatefulWidget {
const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

 String? _selectedPeriod;
  List<Map<String, String>> _periods = [];
    bool textVisible = true;
    late Future<void> _fetchDataFuture = Provider.of<BusinessListProvider>(context, listen: false).getBusinessListApi();

  @override
  void initState() {
    super.initState();
    _generatePeriods();
    _selectedPeriod = _periods.isNotEmpty ? _periods[0]['label'] : null;
   Provider.of<BusinessListProvider>(context, listen: false).getBusinessListApi();
  }

void _generatePeriods() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy MMM, d');
    final DateFormat formatterMonth = DateFormat('yyyy MMM ,d');

    setState(() {
      final int daysToSunday = now.weekday % 7;
      final DateTime startOfWeek = now.subtract(Duration(days: daysToSunday));
      final DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
      final DateTime startOfLastWeek = startOfWeek.subtract(Duration(days: 7));
      final DateTime endOfLastWeek = endOfWeek.subtract(Duration(days: 7));

      _periods = [
        {
          'label': 'Current activity\n',
          'date': '${formatter.format(now)} - ${formatter.format(now)}'
        },
        {
          'label': 'This week\n',
          'date': '${formatter.format(startOfWeek)} - ${formatter.format(endOfWeek)}'
        },
        {
          'label': 'Last week\n',
          'date': '${formatter.format(startOfLastWeek)} - ${formatter.format(endOfLastWeek)}'
        },
        {
          'label': 'This month\n',
          'date': '${formatterMonth.format(DateTime(now.year, now.month, 1))} - ${formatter.format(now)}'
        },
        {
          'label': 'Statement\n',
          'date': '- ${formatter.format(DateTime(now.year, now.month, 1).subtract(const Duration(days: 1)))}'
        },
        {
          'label': 'Custom date range\n',
          'date': '${formatter.format(now.subtract(const Duration(days: 30)))} - ${formatter.format(now)}'
        },
      ];
    });
  }



  String? _getDateForSelectedPeriod() {
    return _periods.firstWhere((period) => period['label'] == _selectedPeriod)['date'];
  }



  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool selectedItem1 = true;
  bool selectedItem2 = false;
  bool selectedItem3 = false;
  bool selectedItem4 = false;
  bool selectedItem5 = false;


  List pages = [
    const HomeScreen(),
    const ManageBusinessScreen(),
    const ManageClientScreen(),
    const AccountingScreen(),
    const CreateInvoice(),
  ];

  final List<String> invoiceTypes = [
    'All Invoice',
    'Paid Invoice',
    'Unpaid Invoice',
    'Overdue Invoice',
    'Deleted Invoice',
  ];
 final List<String> businessClientTypes = [
    'Active Business Profile',
    'Deleted Business Profile'
  ];


   final List<String> noCilent = [
    'no cilent data',
  ];


String? businessClient;
String? selectedInvoiceType;
String? noCilentData;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
     onWillPop: () {
     Utilities.dialog(context, "Do you want to exit from", "Invoicemint App?", () {
            SystemNavigator.pop();
          });
          return Future.value(true);
        },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4)
                  ],
                  color: const Color(0xFF42566A),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              AppIcons.group_433,
                              color: selectedItem1
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedIndex = 0;
                                selectedItem1 = true;
                                selectedItem2 = false;
                                selectedItem3 = false;
                                selectedItem4 = false;
                                selectedItem5 = false;
                              });
                            },
                          ),
                          Text('Invoice\n',
                              style: TextStyle(
                                  fontFamily: 'poppins-regular',
                             color: selectedItem1
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                                  fontSize: 11))
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              AppIcons.group_437,
                              color: selectedItem2
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedIndex = 1;
                                selectedItem2 = true;
                                selectedItem1 = false;
                                selectedItem3 = false;
                                selectedItem4 = false;
                                selectedItem5 = false;
                              });
                            },
                          ),
                          Text(
                            '     Manage\n     Buisness',
                            style: TextStyle(
                                fontFamily: 'poppins-regular',
                           color:  selectedItem2
                                  ? Color.fromARGB(255, 20, 27, 27)
                                  : Colors.white.withOpacity(0.4),
                                fontSize: 11),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 46),
                        child: Text(
                          '  Create Invoice\n',
                          style: TextStyle(
                              fontFamily: 'poppins-regular',
                          color: selectedItem5
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              AppIcons.group_439,
                              color: selectedItem3
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedIndex = 2;
                                selectedItem3 = true;
                                selectedItem2 = false;
                                selectedItem1 = false;
                                selectedItem4 = false;
                                selectedItem5 = false;
                              });
                            },
                          ),
                          Text(
                            'Manage\n  Client',
                            style: TextStyle(
                                fontFamily: 'poppins-regular',
                           color:  selectedItem3
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                                fontSize: 11),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              AppIcons.group_454,
                              color: selectedItem4
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedIndex = 3;
                                selectedItem4 = true;
                                selectedItem2 = false;
                                selectedItem1 = false;
                                selectedItem3 = false;
                                selectedItem5 = false;
                              });
                            },
                          ),
                          Text(
                            'Accounting\n',
                            style: TextStyle(
                                fontFamily: 'poppins-regular',
                            color: selectedItem4
                                  ? const Color(0xFF39DEE8)
                                  : Colors.white.withOpacity(0.4),
                                fontSize: 11),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 4;
                      selectedItem5 = true;
                      selectedItem1 = false;
                      selectedItem2 = false;
                      selectedItem3 = false;
                      selectedItem4 = false;
                    });
                  },
                  child: Container(
                      height: 64,
                      width: 64,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF42566A),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(Radius.circular(24)),
                        border: Border.all(width: 5, color: Colors.white),
                      ),
                      child: Center(
                        child: Icon(
                          AppIcons.group_456,
                          size: 25,
                          color: selectedItem5
                              ? const Color(0xFF39DEE8)
                              : Colors.white.withOpacity(0.4),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        body: pages.elementAt(selectedIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: _getFAB(),
      ),
    );
  }

Widget _getFAB() {
  final businessListProvider = Provider.of<BusinessListProvider>(context);
    final clientListProvider = Provider.of<ClientListProvider>(context);
    switch (selectedIndex) {
      case 0:
        return  DraggableFab(
          child: Container(
            decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
            colors: [Color(0xff39DEE8), Color.fromARGB(255, 251, 253, 235)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
              ),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder:(BuildContext context, StateSetter setBottomState){
                        return Container(
                        height: 500,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Filter',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'poppins-regular',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                Expanded(
                child: SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.only(bottom:30.0),
                child: Column(
                children: [
                Visibility(
                visible: textVisible,
                child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                'Search By Date',
                style: TextStyle(
                fontSize: 14,
                fontFamily: 'poppins-regular',
                fontWeight: FontWeight.bold,
                color: Colors.black),
                       ),
                       ),
                       ),
                         ),
                const SizedBox(height: 5,),
                DropdownButtonFormField<String>(
                 value: _selectedPeriod,
                padding: const EdgeInsets.only(left: 20, right: 20),
                icon:const Icon(Icons.calendar_month), 
                decoration: const InputDecoration(
                  hintStyle: TextStyle(height: 2), 
                suffixIconColor: Color(0xFF000000),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                color: Color.fromRGBO(34, 31, 31, 0.216),
                 ),
                ),
               focusColor: Color.fromRGBO(255, 255, 255, 1),
               focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(
               color: Color.fromRGBO(34, 31, 31, 0.216),
                ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
               ),
                ),
             style: const TextStyle(color: Colors.black),
             isExpanded: true,
              onChanged: (String? newValue) {
              setState(() {
               _selectedPeriod = newValue;
               textVisible = true;
               });
               },
              onTap: () {
              setState(() {
              textVisible = false; 
                   });
                      },
                selectedItemBuilder: (BuildContext context) {
                 return _periods.map<Widget>((Map<String, String> period) {
                   return Text(
                     period['date']!,
                     style: const TextStyle(color: Colors.black),
                   );
                 }).toList();
               },
              items: _periods.map<DropdownMenuItem<String>>((Map<String, String> period) {
                return DropdownMenuItem<String>(
                  value: period['label'],
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: period['label'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' ${period['date']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black, 
                          ),
                    
                        ),
                      ],
                       ),
                     ),
                        );
                        }).toList(),
                         ),                      
                  const SizedBox(height: 10),
                  const Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                  'Search By Type',
                   style: TextStyle(
                   fontSize: 14,
                   fontFamily: 'poppins-regular',
                   fontWeight: FontWeight.bold,
                   color: Colors.black),
                     ),
                   ),
                    ),
             const SizedBox(
              height: 10,
                  ),
                        DropdownButtonFormField<String>(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const InputDecoration(
                        suffixIconColor: Color(0xFF000000),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                        color: Color.fromRGBO(34, 31, 31, 0.216),),
                        ),
                     focusColor: Color.fromRGBO(255, 255, 255, 1),
                     focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                     color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                       borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                     ),
                      style: const TextStyle(color: Colors.black),
                     isExpanded: true,
                      items: invoiceTypes.map((String type) {
                     return DropdownMenuItem<String>(
                    value: type,
                    child: Center(
                     child: Text(
                      type,
                       style: const TextStyle(
                       fontFamily: 'poppins-regular',
                       color: Color(0xFF000000),
                       fontSize: 14,
                       ),
                     ),
                   ),
                  );
                }).toList(),
                hint: const Center(
                child: Text(
                 "All Invoice",
                  style: TextStyle(
                   fontFamily: 'poppins-regular',
                   color: Color(0xFF000000),
                   fontSize: 14,
                   ),
                  ),
                   ),
                 onChanged: (value) {
                 setState(() {
                 selectedInvoiceType = value;
                      });
            selectedInvoiceTypeIndex= invoiceTypes.indexOf(value!);
                     },
                value: selectedInvoiceType
                     ,),
           const SizedBox(height: 10),
           const Align(
         alignment: Alignment.centerLeft,
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 40),
           child: Text(
             'Search By Business',
             style: TextStyle(
                 fontSize: 14,
                 fontFamily: 'poppins-regular',
                 fontWeight: FontWeight.bold,
                 color: Colors.black),
                   ),
                  ),
                    ),
               const SizedBox(height: 10),
                  DropdownButtonFormField<UserBusinessListResponse>(
                   padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const InputDecoration(
                      suffixIconColor: Color(0xFF000000),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    isExpanded: true,
                    items: businessListProvider.businessList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Center(
                          child: Text(
                            item.businessName,
                            style: const TextStyle(
                              fontFamily: 'poppins-regular',
                              color: Color(0xFF000000),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Center(
                      child: Text(
                        "Select Business",
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          color: Color(0xFF000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onChanged: (value) async{
                    setBottomState(() {
                      businessId = value!.id;
                    selectedBusinessName = value.businessName;
                      });
          await Provider.of<ClientListProvider>(context, listen: false).getClientListApi();
                    },
                  ),             
          const SizedBox(height: 10),
          const Align(
         alignment: Alignment.centerLeft,
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 40),
           child: Text(
             'Search By Client',
             style: TextStyle(
                 fontSize: 14,
                 fontFamily: 'poppins-regular',
                 fontWeight: FontWeight.bold,
                 color: Colors.black),
                   ),
                ),
                ),
              const SizedBox(height: 10),
                businessId!= 0?
              Consumer<ClientListProvider>(
              builder: (context, clientListProvider, child) {
              return DropdownButtonFormField<UserClientListResponse>(
                   padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const InputDecoration(
                      suffixIconColor: Color(0xFF000000),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    isExpanded: true,
                    items: clientListProvider.clientList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Center(
                          child: Text(
                            item.clientBusinessName,
                            style: const TextStyle(
                              fontFamily: 'poppins-regular',
                              color: Color(0xFF000000),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Center(
                      child: Text(
                        "Select Client",
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          color: Color(0xFF000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setBottomState(() {
                    selectedClientName = value!.clientBusinessName;
                      });
                    },
                  );
               },
                  ):                
                 DropdownButtonFormField(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const InputDecoration(
                suffixIconColor: Color(0xFF000000),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                color: Color.fromRGBO(34, 31, 31, 0.216),
                 ),
                ),
               focusColor: Color.fromRGBO(255, 255, 255, 1),
               focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(
               color: Color.fromRGBO(34, 31, 31, 0.216),
                ),
             borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                 ),
                style: const TextStyle(color: Colors.black),
                isExpanded: true,
                  items:noCilent.map((String type) {
                  return DropdownMenuItem(
                  value: type,
                  child: Center(
                 child: Text(type,
              style: const TextStyle(
              fontFamily: 'poppins-regular',
               color: Color(0xFF000000),
             fontSize: 14,
                  ),
                  ),
                    ));
                }).toList(),
              hint:const Center(
                child: Text(
                  "Select Client",
                 style: TextStyle(
                  fontFamily: 'poppins-regular',
                  color: Color(0xFF000000),
                  fontSize: 14,
              ),
             ),
            ),
            onChanged: (value) {
            print(value);
            setState(() {
            selectedValue= value!;
            });
            },
              ),     
             const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
              ),
              onPressed: () {},
              child: Ink(
                decoration: BoxDecoration(
                    color: const Color(0xFFDBDBDB),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 50,
                  width: 175,
                  constraints:
                      const BoxConstraints(minWidth: 88.0),
                  child: const Center(
                    child: Text('Reset',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                         fontSize: 16,
                 fontFamily: 'poppins-regular',
                 fontWeight: FontWeight.bold,
                  color: Color(0xFF42566A))),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
              ),
               onPressed: () async {
           await Provider.of<DataProvider>(context, listen: false).fetchData(selectedInvoiceTypeIndex);
              Navigator.of(context).pop();
                    },
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff39DEE8),
                        Color(0xff42566A)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 50,
                  width: 175,
                  constraints:
                      const BoxConstraints(minWidth: 88.0),
                  child: const Center(
                    child: Text('Apply Filter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                       fontSize: 16,
                        fontFamily: 'poppins-regular',
                          color: Colors.white)),
                  ),
                ),
                
              ),
            ),
          ],
        )
          
          
           ],
         ),
       ),
                              ),
                            ),
                          ],
                        ),
                      );
      
                      },
                    );
                  
                  },
                );
              },
              child: const Icon(CustomIcons.group_446,
              size: 20,                
              color: Colors.white),
            ),
          ),
        );
      case 2:
        return  DraggableFab(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff39DEE8), Color.fromARGB(255, 251, 253, 235)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                   builder: (context,  setBottomState) {
                  return  Container(
                      height:400,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: ListView(
                        children: [
                          Container(
                            height: 80,
                            width:double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: const Center(
                              child: Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Search By Buisness',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                       DropdownButtonFormField<UserBusinessListResponse>(
                   padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const InputDecoration(
                      suffixIconColor: Color(0xFF000000),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    isExpanded: true,
                    items: businessListProvider.businessList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Center(
                          child: Text(
                            item.businessName,
                            style: const TextStyle(
                              fontFamily: 'poppins-regular',
                              color: Color(0xFF000000),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Center(
                      child: Text(
                        "Select Business",
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          color: Color(0xFF000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onChanged: (value) async{
                      setBottomState(() {
                      businessId = value!.id;
                    selectedBusinessName = value.businessName;
                      });
                    },
                  ),             
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Search By Buisness Type',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                       DropdownButtonFormField<String>(
                       padding: const EdgeInsets.only(left: 20, right: 20),
                       decoration: const InputDecoration(
                       suffixIconColor: Color(0xFF000000),
                       enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(15)),
                       borderSide: BorderSide(
                       color: Color.fromRGBO(34, 31, 31, 0.216),
                      ),
                      ),
                    focusColor: Color.fromRGBO(255, 255, 255, 1),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: Color.fromRGBO(34, 31, 31, 0.216),
                    ),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                   ),
                                  style: const TextStyle(color: Colors.black),
                                  isExpanded: true,
                                 items: businessClientTypes.map((String type) {
                               return DropdownMenuItem<String>(
                               value: type,
                             child: Center(
                              child: Text(
                               type,
                                style: const TextStyle(
                                fontFamily: 'poppins-regular',
                                color: Color(0xFF000000),
                                fontSize: 14,
                                ),
                              ),
                            ),
                           );
                         }).toList(),
                         hint: const Center(
                         child: Text(
                          "Search Business Type",
                           style: TextStyle(
                            fontFamily: 'poppins-regular',
                            color: Color(0xFF000000),
                            fontSize: 14,
                            ),
                           ),
                            ),
                          onChanged: (value) {
                          setState(() {
                         businessClient = value;
                        });
                   selectedBusinessIndex= businessClientTypes.indexOf(value!);
                         print(value);
                         },
                           value:businessClient ,
                                  ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                ),
                                onPressed: () {
                               setBottomState(() async{
                               },);
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDBDBDB),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 50,
                                    width: 175,
                                    constraints:
                                        const BoxConstraints(minWidth: 88.0),
                                    child: const Center(
                                      child: Text('Reset',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF42566A))),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                ),
                                onPressed: () {
                             
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff39DEE8),
                                          Color(0xff42566A)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 50,
                                    width: 175,
                                    constraints:
                                        const BoxConstraints(minWidth: 88.0),
                                    child: const Center(
                                      child: Text('Apply Filter',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'poppins-regular',
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                   }
                  );
                },
              );
            },
            child: const Icon(CustomIcons.group_446,
                color: Colors.white, size: 20),
          ),
        ),
      ); 
      case 3:
        return DraggableFab(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff39DEE8), Color.fromARGB(255, 251, 253, 235)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (BuildContext context) {
                return StatefulBuilder(
                   builder: (context,  setBottomState) {
                  return  Container(
                      height:300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: ListView(
                        children: [
                          Container(
                            height: 80,
                            width:double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: const Center(
                              child: Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Search By Buisness',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                       DropdownButtonFormField<UserBusinessListResponse>(
                   padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const InputDecoration(
                      suffixIconColor: Color(0xFF000000),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(34, 31, 31, 0.216),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    isExpanded: true,
                    items: businessListProvider.businessList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Center(
                          child: Text(
                            item.businessName,
                            style: const TextStyle(
                              fontFamily: 'poppins-regular',
                              color: Color(0xFF000000),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Center(
                      child: Text(
                        "Select Business",
                        style: TextStyle(
                          fontFamily: 'poppins-regular',
                          color: Color(0xFF000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    onChanged: (value) async{
                      setBottomState(() {
                      businessId = value!.id;
                    selectedBusinessName = value.businessName;
                      });
                    },
                  ),        
                 const SizedBox(height: 60,)    , 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                ),
                                onPressed: () {},
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDBDBDB),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 50,
                                    width: 175,
                                    constraints:
                                        const BoxConstraints(minWidth: 88.0),
                                    child: const Center(
                                      child: Text('Reset',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF42566A))),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                ),
                                onPressed: () {},
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff39DEE8),
                                          Color(0xff42566A)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 50,
                                    width: 175,
                                    constraints:
                                        const BoxConstraints(minWidth: 88.0),
                                    child: const Center(
                                      child: Text('Apply Filter',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'poppins-regular',
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                   }
                  );
                },
              );
            },
            child: const Icon(CustomIcons.group_446,
                color: Colors.white, size: 20),
          ),
        ),
      );
      default:
        return Container(
        ); 
    }
}}