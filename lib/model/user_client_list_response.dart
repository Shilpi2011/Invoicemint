class UserClientListResponse {
  UserClientListResponse({
    required this.id,
    required this.clientBusinessName,
    required this.businessLogo,v 
  });
  late final int id;
  late final String clientBusinessName;
  late final String businessLogo;
  
  UserClientListResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    clientBusinessName = json['clientBusinessName'];
    businessLogo = json['businessLogo']; 
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['clientBusinessName'] = clientBusinessName;
    _data['businessLogo'] = businessLogo;
    return _data;
  }
}