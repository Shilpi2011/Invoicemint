class Client {
  final int id;
  final String businessLogo;
  final String clientBusinessName;
  final String profileUrl;
  final String? businessSince;
  final String? businessCategory;
  final String about;
  final String country;
  final String state;
  final String city;
  final String pinCode;
  final String streetAddress;
  final String? website;
  final String? linkedIn;
  final String email;
  final String? cin;
  final String? gstin;
  final String? companyPan;
  final String? vatNumber;
  final String clientOf;
  final String number;
  final bool delete;

  Client({
    required this.id,
    required this.businessLogo,
    required this.clientBusinessName,
    required this.profileUrl,
    this.businessSince,
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
    this.cin,
    this.gstin,
    this.companyPan,
    this.vatNumber,
    required this.clientOf,
    required this.number,
    required this.delete,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      businessLogo: json['businessLogo'] ?? '',
      clientBusinessName: json['clientBusinessName'] ?? '',
      profileUrl: json['profileUrl'] ?? '',
      businessSince: json['businessSince'],
      businessCategory: json['businessCategory'],
      about: json['about'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      pinCode: json['pinCode'] ?? '',
      streetAddress: json['streetAddress'] ?? '',
      website: json['website'],
      linkedIn: json['linkedIn'],
      email: json['email'] ?? '',
      cin: json['cin'],
      gstin: json['gstin'],
      companyPan: json['companyPan'],
      vatNumber: json['vatNumber'],
      clientOf: json['clientOf'] ?? '',
      number: json['number'] ?? '',
      delete: json['delete'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessLogo': businessLogo,
      'clientBusinessName': clientBusinessName,
      'profileUrl': profileUrl,
      'businessSince': businessSince,
      'businessCategory': businessCategory,
      'about': about,
      'country': country,
      'state': state,
      'city': city,
      'pinCode': pinCode,
      'streetAddress': streetAddress,
      'website': website,
      'linkedIn': linkedIn,
      'email': email,
      'cin': cin,
      'gstin': gstin,
      'companyPan': companyPan,
      'vatNumber': vatNumber,
      'clientOf': clientOf,
      'number': number,
      'delete': delete,
    };
  }
}
