class UserBusinessListResponse {
  UserBusinessListResponse({
    required this.id,
    required this.businessName,
    required this.imageUrl,
    required this.signatureUrl,
    required this.streetAddress,
    required this.cin,
    required this.gstin,
    required this.pan,
    required this.vatNumber,
  });
  
  late final int id;
  late final String businessName;
  late final String imageUrl;
  late final String signatureUrl;
  late final String streetAddress;
  late final String cin;
  late final String gstin;
  late final String pan;
  late final String vatNumber;
  
  UserBusinessListResponse.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    businessName = json['businessName'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    signatureUrl = json['signatureUrl'] ?? '';
    streetAddress = json['streetAddress'] ?? '';
    cin = json['cin'] ?? '';
    gstin = json['gstin'] ?? '';
    pan = json['pan'] ?? '';
    vatNumber = json['vatNumber'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['businessName'] = businessName;
    _data['imageUrl'] = imageUrl;
    _data['signatureUrl'] = signatureUrl;
    _data['streetAddress'] = streetAddress;
    _data['cin'] = cin;
    _data['gstin'] = gstin;
    _data['pan'] = pan;
    _data['vatNumber'] = vatNumber;
    return _data;
  }
}
