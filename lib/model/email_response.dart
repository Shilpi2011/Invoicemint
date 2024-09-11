class GetEmailResponse {
  GetEmailResponse({
    required this.clientEmail,
    required this.emailSubject,
    required this.message,
     this.cc,
    required this.id,
    required this.reminderId,
  });
  late final String clientEmail;
  late final String emailSubject;
  late final String message;
  late final Null cc;
  late final int id;
  late final int reminderId;
  
  GetEmailResponse.fromJson(Map<String, dynamic> json){
    clientEmail = json['clientEmail'];
    emailSubject = json['emailSubject'];
    message = json['message'];
    cc = null;
    id = json['id'];
    reminderId = json['reminderId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['clientEmail'] = clientEmail;
    _data['emailSubject'] = emailSubject;
    _data['message'] = message;
    _data['cc'] = cc;
    _data['id'] = id;
    _data['reminderId'] = reminderId;
    return _data;
  }
}