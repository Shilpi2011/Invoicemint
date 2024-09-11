import 'package:Invoicemint/view_model/EmailReminder_api.dart';
import 'package:Invoicemint/view_model/Email_api_services.dart';
import 'package:Invoicemint/view_model/SendEmail_api_services.dart';
import 'package:Invoicemint/view_model/SendWhatsAppMessage_api_services.dart';
import 'package:Invoicemint/view_model/businessList_api_services.dart';
import 'package:Invoicemint/view_model/clientList_api_services.dart';
import 'package:Invoicemint/view_model/downloadInvoice_api.dart';
import 'package:Invoicemint/view_model/filterartion_api_services.dart';
import 'package:Invoicemint/view_model/get_editInvoice.dart';
import 'package:Invoicemint/view_model/get_fields_client.dart';
import 'package:Invoicemint/view_model/hide_fields_api_service.dart';
import 'package:Invoicemint/view_model/invoiceNumber_api_services.dart';
import 'package:Invoicemint/view_model/progress_indicator_invoice.dart';
import 'package:Invoicemint/view_model/restartSchedule.dart';
import 'package:Invoicemint/view_model/scheduledReminder_api_services.dart';
import 'package:Invoicemint/view_model/whatsAppReminder.api_services.dart';
import 'package:Invoicemint/view_model/whatsappMessage_api_services.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';
import 'package:Invoicemint/routes/routes.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await FlutterDownloader.initialize(
    debug: true, 
    ignoreSsl: true,
  );
  runApp(const MyApp(),
   );
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: const MyApp(),
    ),   
       ChangeNotifierProvider(
      create: (context) => BusinessListProvider(),
      child: const MyApp(),
    ), 
        ChangeNotifierProvider(
      create: (context) => ClientListProvider(),
      child: const MyApp(),
    ),   
        ChangeNotifierProvider(
      create: (context) => ProgressInvoiceIndicator(),
      child: const MyApp(),
    ),
       ChangeNotifierProvider(
      create: (context) => GetWhatsAppMessage(),
      child: const MyApp(),
    ),
         ChangeNotifierProvider(
      create: (context) => SentWhatsAppMessageProvider(),
      child: const MyApp(),
    ),
        ChangeNotifierProvider(
      create: (context) => GetEmailMessage(),
      child: const MyApp(),
    ),
       ChangeNotifierProvider(
      create: (context) => GetWhatsAppReminderMessage(),
      child: const MyApp(),
    ),
        ChangeNotifierProvider(
      create: (context) => GetEmailReminderMessage(),
      child: const MyApp(),
    ),
      ChangeNotifierProvider(
      create: (context) => SentEmailProvider(),
      child: const MyApp(),
    ),
    ChangeNotifierProvider(
      create: (content) => ScheduledReminderProvider(),
      child: const MyApp(),    ),
    ChangeNotifierProvider(
    create: (content) => RestartScheduleProvider(),
    child: const MyApp()
      ),  
      ChangeNotifierProvider(
        create: (content) => PdfProvider(),
        child:const  MyApp(),
      ),
      ChangeNotifierProvider(
      create: (content)=> InvoiceNumberProvider(),
      child: const MyApp() ),
      
      ChangeNotifierProvider(
      create: (content)=> ClientFieldsProvider(),
      child: const MyApp(),),

      ChangeNotifierProvider(
      create: (content) => FieldProvider(),
      child: const MyApp(),
      ),
      ChangeNotifierProvider(
      create:(content)=> GetEditInvoice())
      ],
      child: MaterialApp(
       initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute, 
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
      ),
    );
  }
}
