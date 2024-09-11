import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/edit_user_invoice.dart';
import 'package:Invoicemint/view/email.dart';
import 'package:Invoicemint/view/emailReminder.dart';
import 'package:Invoicemint/view/paid.dart';
import 'package:Invoicemint/view/viewInvoice.dart';
import 'package:Invoicemint/view/whatsAppMessage.dart';
import 'package:Invoicemint/view/whatsappReminder.dart';
import 'package:Invoicemint/view_model/filterartion_api_services.dart';
import 'package:Invoicemint/view_model/progress_indicator_invoice.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/view/sidebar.dart';
import 'package:Invoicemint/view/silver_Items.dart';
import 'package:Invoicemint/view/silver_appbar.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
const HomeScreen({ Key? key, }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  super.initState();
 Provider.of<ProgressInvoiceIndicator>(context, listen: false).fetchData();
  }
  @override
Widget build(BuildContext context) {
final dataProvider = Provider.of<DataProvider>(context);
final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const SidebarScreen(),
        body: CustomScrollView(
        slivers: [
        const SliverAppBarBldr(),
          const SliverToBoxAdapter(
           child: Padding(
             padding: EdgeInsets.only(left:15,top:15),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text(
                 'Welcome !',
                  style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppins-regular',
                  fontWeight: FontWeight.w500,
                 color:Colors.grey),
                   ),  
                 Text(
                 'Clarissa Maharani',
                  style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w500,
                 color:Colors.black),
                   ),  
               ],
             ),
             ),
             ),
             
       SliverToBoxAdapter(
       child: SizedBox(
       height: 105.0,
       child: Consumer<ProgressInvoiceIndicator>(
       builder: (context, progressIndicator, child) {
        if (progressIndicator.data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final dashboardProgressList = progressIndicator.dashboardProgressList.take(4).toList(); 
        return ListView.builder(
         itemCount: dashboardProgressList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = dashboardProgressList[index];
            final label = item['label'];
            final value =  int.tryParse(item['value'].toString())?.toDouble() ?? 0.0;
            final maxProgress = 100.0;
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, bottom: 15,right:10),
              child: Container(
                height: 100,
                width: widthSize / 2,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.2,
                    ),
                  ],
                  color: Color.fromARGB(255, 237, 254, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'poppins-regular',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 25,
                              fontFamily: 'poppins-medium',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: DashedCircularProgressBar.aspectRatio(
                          aspectRatio: 1,
                          progress: value,
                          maxProgress: maxProgress,
                          corners: StrokeCap.butt,
                          foregroundColor: const Color(0xFF39DEE8),
                          backgroundColor: const Color.fromARGB(255, 104, 110, 116),
                          foregroundStrokeWidth: 20,
                          backgroundStrokeWidth: 25,
                          animation: true,
                          child: const Center(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ),
),
         const  SilverBelowAppbar(),
        if(dataProvider.data==null)
       const  SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.teal,
             ),
          ),
        )
          else if (dataProvider.data!.content.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Image.asset(
                  'assets/images/Group 580.png',
                  scale: 1,
                ),
              ),
            )
        else SliverList(
           delegate:SliverChildBuilderDelegate((BuildContext context, int index){
           return  ListTile(
           title: Padding(
           padding: const EdgeInsets.only(bottom: 10.0, top:10),
             child: 
            Container(
            decoration: BoxDecoration(
             color:Colors.white,
             boxShadow: [
             BoxShadow(
             color: Colors.grey.shade400,
             blurRadius: 4
              )
             ],
            borderRadius: BorderRadius.circular(12.0), 
              ),
             child:  ExpansionTile(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
             ),  
             iconColor: Colors.white,
             collapsedIconColor: Colors.white,
             title:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Row(
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Image.asset(
                         'assets/images/qr code.jpg',
                         scale:10,
                       ),
                     const  SizedBox(height:5),
                   const  Icon(Icons.arrow_drop_down,color: Colors.teal,)
                     ],
                   ),
                    const  SizedBox(width: 10,),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   const Text(
                        'Invoice Date',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
               dataProvider.data!.content[index].date,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Invoice No.',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                  dataProvider.data!.content[index].invoiceNo,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Amount    ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                       Text(
               dataProvider.data!.content[index].invoiceAmount.toString(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                const  SizedBox(width: 15),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text(
                          '   Due Date',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'poppins-regular',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                                 "   ${dataProvider.data!.content[index].dueDate}",
                          style:const TextStyle(
                            fontSize: 12,
                            fontFamily: 'poppins-medium',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      const SizedBox(height: 2),
                       const Text(
                          '   Billed To',
                          style: TextStyle(
                            fontSize: 12,
                             overflow: TextOverflow.clip,
                            fontFamily: 'poppins-regular',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Text(
                               "${dataProvider.data!.content[index].billedTo}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'poppins-medium',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      const SizedBox(height: 2),
                      const Text(
                          '    Status',
                          style: TextStyle(
                            fontSize: 12,
                         overflow: TextOverflow.ellipsis,
                            fontFamily: 'poppins-regular',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        dataProvider.data!.content[index].amountRecived> 0?
                           const Text(
                          '    Paid ',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'poppins-medium',
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ):
                       const Text(
                          '    Unpaid    ',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'poppins-regular',
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),

                
                ],
              ),
            ],
             ),
             children: [
                Row(
                children: [
               const  SizedBox(width:85),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                        'Received Amount',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                     dataProvider.data!.content[index].amountRecived.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Transaction Charges',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                  dataProvider.data!.content[index].transactionCharge.toString(),
                        style: const TextStyle(
                          fontSize: 12,
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
                   const Text(
                   'Payment Date',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                             dataProvider.data!.content[index].paymentDate.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-regular',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                   const   Text(
                         '',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poppins-medium',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                  ),
                      ],
                    ),
                   Align(
                   alignment: Alignment.bottomCenter,
                   child: Container(
                   height:40,
           decoration: const BoxDecoration(
           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
           gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: <Color>[Color.fromARGB(255, 65, 212, 221),Color.fromARGB(255, 77, 76, 76)]
             ), 
             ),
                child: SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left:7,right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                           InkWell(
                          onTap: () {
                         invoiceId =dataProvider.data!.content[index].id;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const EmailReminder()),
                              ),
                            );
                          },
                          child: SizedBox(
                           width :64,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/email.png',
                                  height: 23,
                                  width: 30,
                                ),
                                const SizedBox(height:5),
                                const Text(
                                  'Email Reminder',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                       const VerticalDivider(
                         thickness: 2,
                         color: Colors.white,),
                          InkWell(
                     onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const InvoiceEmail()),
                      ),
                    );
                          },
                    child: const SizedBox(
                     height: 40,
                     width:60,
                    child:  Column(
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
                    ),   
                   const VerticalDivider(
                   thickness: 2,
                   color: Colors.white,),
                     InkWell(
                      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const MarkAsPaidForm()),
                      ),
                    );
                    },
                  child: const SizedBox(
                   width :64,
                     child: Column(
                      children: [
                     Icon(Icons.check_circle_outline,
                       color: Colors.white,
                       size:23),
                       //  Image.asset(
                       //    'assets/images/check.png',
                       //    color: Colors.white,
                       //    height:23,
                       //    width: 30,
                       //  ),
                         SizedBox(height:6),
                        Text(
                         'Marked as Paid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:9,
                          ),
                        ),
                      ],
                         ),
                        ),
                    ),
                         const VerticalDivider(
                         thickness: 2,
                         color: Colors.white,),
                      SizedBox(
                      width :64,
                       child: InkWell(
                        onTap: (){
            invoiceId =dataProvider.data!.content[index].id;
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewInvoiceScreen()));
                        },
                         child: const  Column(
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
                       ),
                     ),
                         const VerticalDivider(
                         thickness: 2,
                         color: Colors.white,),
                       SizedBox(
                      width :64,
                      child: InkWell(
                        onTap: (){
                  invoiceId=dataProvider.data!.content[index].id;
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> const EditUserInvoice()));
                        },
                        child: const Column(
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
                      ),
                    ),
                         const VerticalDivider(
                         thickness: 2,
                         color: Colors.white,),
                        InkWell(
                      onTap: () {
                  invoiceId =dataProvider.data!.content[index].id;
                    Navigator.push(  context,
                      MaterialPageRoute(
                        builder: ((context) => const WhatsappMessage()),
                      ),
                    );
                     },
                   child: SizedBox(
                           width :64,
                     child: Column(
                      children: [
                        Image.asset(
                          'assets/images/whatsapp.png',
                          height: 22,
                          width: 30,
                        ),
                        const SizedBox(height:6.3),
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
                    ),
                    const VerticalDivider(
                     color:Colors.white,
                     thickness:2
                    ),
                      const SizedBox(
                       width:64,
                        child: Column(
                        children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
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
                      ),
                   const VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                    ),
                   InkWell(
                      onTap: () {
                  invoiceId =dataProvider.data!.content[index].id;
                    Navigator.push(  context,
                      MaterialPageRoute(
                        builder: ((context) => const WhatsAppReminder()),
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
                        const SizedBox(height:6.3),
                        const Text(
                          'WhatsApp Reminder',
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
              ),
            ),
             ],
                             )
             ),
           ));
    
             },
             childCount:dataProvider.data!.content.length
             ),
             ),
     const SliverToBoxAdapter(
     child: SizedBox(height: 110),
        ),
                ],
                ),
    );
  }
}






                         





                         