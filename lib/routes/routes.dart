import 'package:flutter/material.dart';
import 'package:Invoicemint/routes/route_name.dart';
import 'package:Invoicemint/view/bankAccountDetails.dart';
import 'package:Invoicemint/view/change_password_screen.dart';
import 'package:Invoicemint/view/create_Invoice.dart';
import 'package:Invoicemint/view/create_account_screen.dart';
import 'package:Invoicemint/view/home_screen.dart';
import 'package:Invoicemint/view/login_screen.dart';
import 'package:Invoicemint/view/recordPayment.dart';
import 'package:Invoicemint/view/reset_password_screen.dart';
import 'package:Invoicemint/view/sidebar.dart';
import 'package:Invoicemint/view/splash_screen.dart';
import 'package:Invoicemint/view/verify_otp_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return PageTransition(
            child: const SplashScreen(), type: PageTransitionType.fade);
      case RoutesName.login:
        return PageTransition(
            child: const LoginScreen(), type: PageTransitionType.fade);
      case RoutesName.homeScreen:
        return PageTransition(
            child: const HomeScreen(), type: PageTransitionType.fade);
      case RoutesName.resetPassword:
        return PageTransition(
            child: const ResetPassword(), type: PageTransitionType.fade);
      case RoutesName.CreateInvoice:
        return PageTransition(
            child: const CreateInvoice(), type: PageTransitionType.fade);
      case RoutesName.siderbar:
        return PageTransition(
            child: const SidebarScreen(), type: PageTransitionType.fade);
      case RoutesName.changePassword:
        return PageTransition(
            child: const ChangePasswordScreen(), type: PageTransitionType.fade);
      case RoutesName.CreateAccount:
        return PageTransition(
            child: const CreateAccount(), type: PageTransitionType.fade);
      case RoutesName.VerifyOtp:
        return PageTransition(
            child: const VerifyOtp(), type: PageTransitionType.fade);
      // case RoutesName.bottomBar:
      //   return PageTransition(
      //       child: const MainScreen(), type: PageTransitionType.fade);
      case RoutesName.recordPayment:
        return PageTransition(
            child: const RecordPaymentScreen(), type: PageTransitionType.fade);
      case RoutesName.bankAccountDetails:
        return PageTransition(
            child: const BankAccountScreen(), type: PageTransitionType.fade);
    
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes defined"),
            ),
          );
        });
    }
  }
}
