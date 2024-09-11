class DeletedClientRespons {
  DeletedClientRespons({
    required this.id,
    required this.businessLogo,
    required this.clientBusinessName,
    required this.profileUrl,
    required this.businessSince,
     this.businessCategory,
    required this.about,
    required this.country,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.streetAddress,
     this.website,
     this.linkedIn,
    required this.email,
    required this.cin,
    required this.gstin,
    required this.companyPan,
    required this.vatNumber,
    required this.clientOf,
    required this.number,
    required this.delete,
  });
  late final int id;
  late final String businessLogo;
  late final String clientBusinessName;
  late final String profileUrl;
  late final String businessSince;
  late final Null businessCategory;
  late final String about;
  late final String country;
  late final String state;
  late final String city;
  late final String pinCode;
  late final String streetAddress;
  late final Null website;
  late final Null linkedIn;
  late final String email;
  late final String cin;
  late final String gstin;
  late final String companyPan;
  late final String vatNumber;
  late final String clientOf;
  late final String number;
  late final bool delete;
  
  DeletedClientRespons.fromJson(Map<String, dynamic> json){
    id = json['id'];
    businessLogo = json['businessLogo'];
    clientBusinessName = json['clientBusinessName'];
    profileUrl = json['profileUrl'];
    businessSince = json['businessSince'];
    businessCategory = null;
    about = json['about'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pinCode'];
    streetAddress = json['streetAddress'];
    website = null;
    linkedIn = null;
    email = json['email'];
    cin = json['cin'];
    gstin = json['gstin'];
    companyPan = json['companyPan'];
    vatNumber = json['vatNumber'];
    clientOf = json['clientOf'];
    number = json['number'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['businessLogo'] = businessLogo;
    _data['clientBusinessName'] = clientBusinessName;
    _data['profileUrl'] = profileUrl;
    _data['businessSince'] = businessSince;
    _data['businessCategory'] = businessCategory;
    _data['about'] = about;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['pinCode'] = pinCode;
    _data['streetAddress'] = streetAddress;
    _data['website'] = website;
    _data['linkedIn'] = linkedIn;
    _data['email'] = email;
    _data['cin'] = cin;
    _data['gstin'] = gstin;
    _data['companyPan'] = companyPan;
    _data['vatNumber'] = vatNumber;
    _data['clientOf'] = clientOf;
    _data['number'] = number;
    _data['delete'] = delete;
    return _data;
  }
}