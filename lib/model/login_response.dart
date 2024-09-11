class LoginResponse {
  LoginResponse({
    required this.jwt,
    required this.userId,
  });
  late final String jwt;
  late final int userId;
  
  LoginResponse.fromJson(Map<String, dynamic> json){
    jwt = json['jwt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jwt'] = jwt;
    _data['userId'] = userId;
    return _data;
  }
}