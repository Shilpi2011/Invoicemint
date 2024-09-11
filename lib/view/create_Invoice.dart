import 'package:flutter/material.dart';
import 'package:Invoicemint/view/first_Invoice.dart';
import 'package:Invoicemint/view/sidebar.dart';
class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}
class _CreateInvoiceState extends State<CreateInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   drawer:const SidebarScreen(),
    body: Column(
      children: [
     Container(
     decoration: const BoxDecoration(
     image: DecorationImage(
     fit: BoxFit.cover,
     image: AssetImage('assets/images/invoicemint bg.png'))), 
     child: Column(
     children: [
     Container(
      height: 130,
      width: double.infinity,
     decoration: const BoxDecoration(
     image: DecorationImage(
     fit: BoxFit.cover,
     image: AssetImage('assets/images/Rectangle 50.png'))), 
     child: Padding(
       padding: const EdgeInsets.only(top:30),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Image.asset('assets/images/Sidebar logo.png',scale:4.2,
               width: 130,),
                    Padding(
               padding: const EdgeInsets.only(right:20),
               child: Builder(builder: (context) {
               return GestureDetector(
               onTap: (){
              Scaffold.of(context).openDrawer();
                        },
                   child:Container(
                    height:28,
                    width: 28,
                   decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                   ),
                child:const Icon(Icons.menu ,color: Colors.black,size:20,weight:800 ,),
                   ),
                       );
                       }),
             ), 
             ],
           ),
          const SizedBox(height: 10),
         const Padding(
           padding: EdgeInsets.symmetric(horizontal: 25),
           child: Text(
           'Welcome!                                      ',
            style: TextStyle(
            fontSize: 14,
            fontFamily: 'poppins-regular',
            fontWeight: FontWeight.w500,
           color:Color.fromARGB(255, 202, 198, 198)),
             ),
         ), 
          const Padding(        
         padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
             'Clarissa Maharani',
            style: TextStyle(
            fontSize: 17,
            fontFamily: 'poppins-regular',
            fontWeight: FontWeight.bold,
                   color:Color.fromARGB(255, 238, 238, 238)),
             ),
          ),            
         ],
       ),
      ),
       ),
       const SizedBox(height:40),
        Image.asset('assets/images/Group 543.png',scale: 3.5,),
         const SizedBox(height:20),
      const Text('       Create Beautifully Designed Invoice with \nFree Invoice Generator. Invoice Format, Unlimited\n         Invoices, Download, Print, Email Invoice.',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xf7070704F),fontSize: 14,fontFamily: 'poppins-light'),),
              const SizedBox(height: 50,),        
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                               ),
                               onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const FirstInvoices()));
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
                                     child:Text('Create First Invoice',
                                         textAlign: TextAlign.center,
                                         style:TextStyle(
                                         fontSize:14,
                                         fontFamily: 'poppins-regular',
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white)),
                                   ),
                                 ),
                               ),
                             ),
                     ],
                      ),
            )
             ],
           ),
           );
       }
}