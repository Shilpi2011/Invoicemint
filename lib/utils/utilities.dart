import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Invoicemint/res/text_size.dart';


class Utilities {
  static toastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static cToast(
      String message, BuildContext context, Color color, IconData icon) {
    CherryToast(
            disableToastAnimation: true,
            title: const Text(
              "Invoicemint",
              style: TextStyle(
                  color: Colors.teal,
                  fontFamily: 'poppins-medium',
                  fontWeight: FontWeight.w600),
            ),
            icon: icon,
            themeColor: Colors.red,
            displayIcon: true,
            description: Text(
              message,
              style: TextStyle(color: color, fontFamily: 'poppins-regular'),
            ),
            toastPosition: Position.bottom,
            toastDuration: const Duration(milliseconds: 700),
            autoDismiss: true)
        .show(context);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          messageSize: 15,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(25),
          message: message,
          duration: const Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color.fromARGB(110, 0, 0, 0),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error, color: Colors.white),
        )..show(context));
  }

  static void lodingWidget(BuildContext context, bool visible) {
    if (Platform.isIOS || Platform.isMacOS) {
      if (visible == true) {
        showDialog(
            barrierColor: Colors.black38,
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const Center(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                    color: Colors.teal,
                  ),
                ));
      } else {
        Navigator.pop(context);
      }
    } else {
      if (visible == true) {
        showDialog(
            barrierColor: Colors.black38,
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                ));
      } else {
        Navigator.pop(context);
      }
    }
  }

  static void dialog(BuildContext context, String tittle, String content,
      VoidCallback action) {
    if (Platform.isIOS || Platform.isMacOS) {
      showDialog(
          barrierColor: Colors.black38,
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Center(
                  child: CupertinoAlertDialog(
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'poppins-regular',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: action,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'poppins-regular',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13),
                      ),
                    ),
                  ),
                ],
                content: Text(
                  content,
                  style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'poppins-regular',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 13),
                  ),
                ),
                title: Text(
                  tittle,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins-medium',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 18),
                  ),
                ),
              )));
    } else {
      showDialog(
          barrierColor: Colors.black38,
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Center(
                  child: AlertDialog(
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'poppins-medium',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 16),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: action,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'poppins-medium',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 16),
                      ),
                    ),
                  ),
                ],
                content: Text(
                  content,
                  style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'poppins-regular',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 15),
                  ),
                ),
                title: Text(
                  tittle,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins-medium',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 13),
                  ),
                ),
              )));
    }
  }

  static void dialogOK(
      BuildContext context, String title, String content, VoidCallback action) {
    if (Platform.isIOS || Platform.isMacOS) {
      showDialog(
          barrierColor: Colors.black38,
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Center(
                  child: CupertinoAlertDialog(
                actions: <Widget>[
                  TextButton(
                    onPressed: action,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'poppins-medium',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13),
                      ),
                    ),
                  ),
                ],
                content: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    // Wrap content with SingleChildScrollView
                    child: Text(
                      content,
                      style: TextStyle(
                        color: Colors.teal,
                        fontFamily: 'poppins-medium',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins-medium',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 15),
                  ),
                ),
              )));
    } else {
      showDialog(
          barrierColor: Colors.black38,
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Center(
                  child: AlertDialog(
                actions: <Widget>[
                  TextButton(
                    onPressed: action,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'poppins-medium',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13),
                      ),
                    ),
                  ),
                ],
                content: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    // Wrap content with SingleChildScrollView
                    child: Text(
                      content,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.teal,
                        fontFamily: 'poppins-medium',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 13),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins-medium',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 15),
                  ),
                ),
              )));
    }
  }

}
