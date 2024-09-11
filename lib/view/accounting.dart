import 'package:flutter/material.dart';
import 'package:Invoicemint/view/bankAccountDetails.dart';
class AccountingScreen extends StatefulWidget {
  const AccountingScreen({super.key});

 @override
State<AccountingScreen> createState() => _AccountingScreenState();
}

class _AccountingScreenState extends State<AccountingScreen> {
final List<String> buisnessTypes = [
    'IBS',
    'hcl pvt. ltd',
    'Blossosm',
    'Deutshce Bank'
  ];
String? selectedBuisnessType;
String? selectedAccountType;

final List<String> accountTypes = ['Account Type 1', 'Account Type 2', 'Account Type 3'];

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController confirmAccountController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController holderNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController swiftCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CustomScrollView(
      slivers: [
     SliverAppBar(
      automaticallyImplyLeading:false ,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned:false,
      stretch: true,
      expandedHeight:70,
      leadingWidth: 170,
       actions: [
             Padding(
              padding: const EdgeInsets.only(right:15,bottom:5,top: 15 ),
              child: Container(
                height: 30,
                width: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11)),
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
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const BankAccountScreen() ));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 16),
                      SizedBox(width: 3),
                      Text(
                        'Add Bank',
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
       leading:const Padding(
        padding: EdgeInsets.only(left:15,bottom:5,top:20 ),
         child: Text('Accounting', style: TextStyle(fontSize:18,fontFamily: 'poppins-regular',fontWeight: FontWeight.w500),),
       ),
       flexibleSpace: const FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: Image(
          image: AssetImage('assets/images/recImage.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),   
              SliverToBoxAdapter(
              child:Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/invoicemint bg.png'))), 
              )
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 180,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Image.asset(
                                      "assets/images/bankLogo.png",
                                      alignment: Alignment.topLeft,
                                      scale: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                               const  Padding(
                                   padding: EdgeInsets.only(top:20),
                                   child:  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Buisness Name         :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        IBS Pvt Ltd',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                          Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Bank Name                :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        Deutsche Bank',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Account No.               :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        8707825790478',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Account Holder         :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        Shilpi Tiwari',
                                              style: TextStyle(
                                                fontSize: 13,
                                               fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                          Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Account Type            :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        Saving',
                                              style: TextStyle(
                                                fontSize: 13,
                                               fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                       Text.rich(
                                      TextSpan(children: [
                                            TextSpan(
                                              text: 'IFSC Code                   :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        PUNB0034100',
                                              style: TextStyle(
                                                fontSize: 13,
                                               fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                          Text.rich(
                                      TextSpan(children: [
                                            TextSpan(
                                              text: 'Phone No.                    :',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins-regular',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '        67699676889',
                                              style: TextStyle(
                                                fontSize: 13,
                                               fontFamily: 'raleaway-medium',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ],
                                      ),
                                 ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                ),
            const SliverToBoxAdapter(
          child: SizedBox(height: 110),
        ),
              ],
            ),
            
    );
  }






























// 






  
}