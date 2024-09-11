class BankResponse {
  BankResponse({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.accountType,
    required this.accountHolderName,
    required this.phone,
    required this.swiftCode,
    required this.ifsc,
    required this.businessName,
  });
  late final int id;
  late final String bankName;
  late final int accountNumber;
  late final String accountType;
  late final String accountHolderName;
  late final String phone;
  late final String swiftCode;
  late final String ifsc;
  late final String businessName;
  
  BankResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    bankName = json['bankName'];
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    accountHolderName = json['accountHolderName'];
    phone = json['phone'];
    swiftCode = json['swiftCode'];
    ifsc = json['ifsc'];
    businessName = json['businessName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['bankName'] = bankName;
    _data['accountNumber'] = accountNumber;
    _data['accountType'] = accountType;
    _data['accountHolderName'] = accountHolderName;
    _data['phone'] = phone;
    _data['swiftCode'] = swiftCode;
    _data['ifsc'] = ifsc;
    _data['businessName'] = businessName;
    return _data;
  }
}