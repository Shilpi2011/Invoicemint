class WhatsAppMessageResponse {
  WhatsAppMessageResponse({
    required this.invoiceId,
    required this.number,
     this.countryCallingCode,
    required this.message,
    required this.reminder,
  });
  late final int invoiceId;
  late final String number;
  late final Null countryCallingCode;
  late final String message;
  late final bool reminder;
  
  WhatsAppMessageResponse.fromJson(Map<String, dynamic> json){
    invoiceId = json['invoiceId'];
    number = json['number'];
    countryCallingCode = null;
    message = json['message'];
    reminder = json['reminder'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['invoiceId'] = invoiceId;
    _data['number'] = number;
    _data['countryCallingCode'] = countryCallingCode;
    _data['message'] = message;
    _data['reminder'] = reminder;
    return _data;
  }
}