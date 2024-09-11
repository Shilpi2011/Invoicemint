import 'package:flutter/material.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final adjustedTextSize = value / textScaleFactor;
    return adjustedTextSize;
  }
}
