class RegisterResponse {
  RegisterResponse({
    required this.name,
    required this.phone,
    required this.email,
    required this.country,
    required this.password,
  });
  late final String name;
  late final String phone;
  late final String email;
  late final String country;
  late final String password;
  
  RegisterResponse.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    country = json['country'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['country'] = country;
    _data['password'] = password;
    return _data;
  }
}