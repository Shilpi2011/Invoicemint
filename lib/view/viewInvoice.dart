import 'dart:io';
import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/edit_user_invoice.dart';
import 'package:Invoicemint/view/email.dart';
import 'package:Invoicemint/view/emailReminder.dart';
import 'package:Invoicemint/view/whatsAppMessage.dart';
import 'package:Invoicemint/view/whatsappReminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ViewInvoiceScreen extends StatefulWidget {
  const ViewInvoiceScreen({super.key});

  @override
  State<ViewInvoiceScreen> createState() => _ViewInvoiceScreenState();
}

class _ViewInvoiceScreenState extends State<ViewInvoiceScreen> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.invoicemint.in/web/mobile-view/$invoiceId'));

  String fileName = 'invoicemintIn';
  String pdfInvoiceUrl = 'https://www.invoicemint.in/pdf/download-pdf?invoiceId=$invoiceId';
  bool isDownloading = false;
  bool isDownloaded = false;
 String extensionType = '.pdf';



Future<String?> downloadFile(String pdfName, String pdfUrl, String extension, File? localFilePathValue) async {
Directory? externalDir = Directory('/storage/emulated/0/Download');
  if (externalDir == null || !externalDir.existsSync()) {
    print('Error: Downloads directory not found.');
    return null;
  }
  String localFilePath = '${externalDir.path}/$fileName$extensionType';
  localFilePathValue = File(localFilePath);
//start

 Directory? externalDire = Directory('/storage/emulated/0/Download');

      if (externalDire.existsSync()) {
        String timestamp = DateFormat('dd-MM-yyyy').format(DateTime.now());
        String fileName = 'Invoice-$timestamp.pdf';
        await FlutterDownloader.enqueue(
          url: pdfUrl,
          savedDir: externalDire.path,
          fileName: fileName,
          showNotification: true,
          openFileFromNotification: true
          );
      }
  return null;
}


  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }


Future<void> requestStoragePermission() async {
var status = await Permission.manageExternalStorage.request();
if (status.isGranted) {
print('Storage Permission is successfully access');
} else if (status.isPermanentlyDenied) {
  openAppSettings();
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 250, 249),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xff39DEE8), Color(0xff42566A)],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 85),
            const Text(
              'View Invoice',
              style: TextStyle(fontFamily: 'poppins-medium', fontSize: 18),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(12),
                        ), 
                        elevation: 5,
                      ),
                      onPressed: () async {
                   await requestStoragePermission();
                 await Permission.notification.request().then((value) async{
                 if(value.isGranted) {
          await downloadFile(fileName,pdfInvoiceUrl,extensionType, null).then((value) => {
          print("Downloaded Invoice pdf successfully")
                          });
                }
                 });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff39DEE8), Color.fromARGB(255, 162, 208, 253)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          height: 40,
                          width: 75,
                          constraints: const BoxConstraints(minWidth: 88.0),
                          child: const Center(
                            child: Text(
                              'Download',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'poppins-regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                const SizedBox(width:12)  , 
                                       ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                        side:const BorderSide(
                                        color: Colors.teal
                                        ),
                                      borderRadius: BorderRadius.circular(12),
                                      ),
                                         elevation: 5,
                                        ),
                                        onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const EditUserInvoice()));
                                         } ,
                            
                                        child: Ink(
                                        decoration: BoxDecoration(
                                        gradient: const  LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                colors: [Color(0xff39DEE8),Color.fromARGB(255, 162, 208, 253)],
                                          ),
                                         borderRadius: BorderRadius.circular(12)),
                                          child: Container(
                                           height: 40,
                                           width: 75,
                                           constraints: const BoxConstraints(minWidth: 88.0),
                                           child: const Center(
                                             child: Text('Edit',
                                                 textAlign: TextAlign.center,
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: 'poppins-regular',
                                                     fontWeight: FontWeight.bold,
                                                     color: Colors.white)),
                                           ),
                                                                    ),
                                                                  ),
                                                                ), 
                                    const SizedBox(width:12)  , 
                                     ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                        side:const BorderSide(
                                        color: Colors.teal
                                        ),
                                      borderRadius: BorderRadius.circular(12)),
                                         elevation: 5,
                                        ),
                                        onPressed: () {
                                    invoiceId;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const WhatsappMessage()));
                                         } ,
                            
                                        child: Ink(
                                        decoration: BoxDecoration(
                                        gradient: const  LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                colors: [Color(0xff39DEE8),Color.fromARGB(255, 162, 208, 253)],
                                          ),
                                         borderRadius: BorderRadius.circular(12)),
                                          child: Container(
                                           height: 40,
                                           width: 75,
                                           constraints: const BoxConstraints(minWidth: 88.0),
                                           child:  Center(
                                             child: Row(
                                               children: [
                                                 Image.asset(
                                                'assets/images/whatsapp.png',
                                                height: 12,
                                                width: 20,
                                                 ),
                                                const  Text('WhatsApp ',
                                                     textAlign: TextAlign.center,
                                                     style: TextStyle(
                                               fontSize: 12,
                                               fontFamily: 'poppins-regular',
                                               fontWeight: FontWeight.bold,
                                               color: Colors.white)),
                                                  ],
                                                  ),
                                                 ),
                                               ),
                                               ),
                                               ), 
                                         const SizedBox(width:12)  ,                         
                                       ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                        side:const BorderSide(
                                        color: Colors.teal
                                        ),
                                      borderRadius: BorderRadius.circular(12)),
                                         elevation: 5,
                                        ),
                                        onPressed: () {
                                   invoiceId;
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const WhatsAppReminder()));
                                         } ,
                            
                                        child: Ink(
                                        decoration: BoxDecoration(
                                        gradient: const  LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                colors: [Color(0xff39DEE8),Color.fromARGB(255, 162, 208, 253)],
                                          ),
                                         borderRadius: BorderRadius.circular(12)),
                                          child: Container(
                                           height: 40,
                                           width: 75,
                                           constraints: const BoxConstraints(minWidth: 88.0),
                                           child: Row(
                                             children: [
                                                 Image.asset(
                                                'assets/images/whatsapp.png',
                                                height: 12,
                                                width: 20,
                                                 ),
                                              const Text('WhatsApp\nReminder',
                                                   textAlign: TextAlign.center,
                                                   style: TextStyle(
                                                       fontSize: 10,
                                                       fontFamily: 'poppins-regular',
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.white)),
                                             ],
                                           ),
                                                                    ),
                                                                  ),
                                                                ),  
                                            const SizedBox(width:12)  , 
                                         ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                        side:const BorderSide(
                                        color: Colors.teal
                                        ),
                                      borderRadius: BorderRadius.circular(12)),
                                         elevation: 5,
                                        ),
                                        onPressed: () {
                                 invoiceId;
                                 Navigator.push(context, MaterialPageRoute(builder: (content)=> const InvoiceEmail()));    
                                         } ,
                            
                                        child: Ink(
                                        decoration: BoxDecoration(
                                        gradient: const  LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                colors: [Color(0xff39DEE8),Color.fromARGB(255, 162, 208, 253)],
                                          ),
                                         borderRadius: BorderRadius.circular(12)),
                                          child: Container(
                                           height: 40,
                                           width: 75,
                                           constraints: const BoxConstraints(minWidth: 88.0),
                                           child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                          Icon(Icons.email,color:Colors.black45,size: 20,) ,
                                               Text('Email',
                                                   textAlign: TextAlign.center,
                                                   style: TextStyle(
                                                       fontSize: 13,
                                                       fontFamily: 'poppins-regular',
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.white)),
                                             ],
                                           ),
                                                                    ),
                                                                  ),
                                                                ), 
                                      const SizedBox(width:12)  ,    
                                      ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                       shape: RoundedRectangleBorder(
                                        side:const BorderSide(
                                        color: Colors.teal
                                        ),
                                      borderRadius: BorderRadius.circular(12)),
                                         elevation: 5,
                                        ),
                                        onPressed: () {
                                     invoiceId;
                                     Navigator.push(context, MaterialPageRoute(builder: (content)=> const EmailReminder()));
                                         } ,
                            
                                        child: Ink(
                                        decoration: BoxDecoration(
                                        gradient: const  LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                colors: [Color(0xff39DEE8),Color.fromARGB(255, 162, 208, 253)],
                                          ),
                                         borderRadius: BorderRadius.circular(12)),
                                          child: Container(
                                           height: 40,
                                           width: 75,
                                           constraints: const BoxConstraints(minWidth: 88.0),
                                           child:const Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                              Icon(Icons.notifications_active,color: Colors.black45,size:20),
                                               Text('Mail\n   Reminder',
                                                   textAlign: TextAlign.center,
                                                   style: TextStyle(
                                                       fontSize: 10,
                                                       fontFamily: 'poppins-regular',
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.white)),
                                             ],
                                           ),
                                                                    ),
                                                                  ),
                                                                ),    
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: WebViewWidget(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
