class DeletedBuisnessListResponse {
  DeletedBuisnessListResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });
  late final List<Content> content;
  late final Pageable pageable;
  late final bool last;
  late final int totalElements;
  late final int totalPages;
  late final int size;
  late final int number;
  late final Sort sort;
  late final bool first;
  late final int numberOfElements;
  late final bool empty;
  
  DeletedBuisnessListResponse.fromJson(Map<String, dynamic> json){
    content = List.from(json['content']).map((e)=>Content.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    size = json['size'];
    number = json['number'];
    sort = Sort.fromJson(json['sort']);
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e)=>e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['last'] = last;
    _data['totalElements'] = totalElements;
    _data['totalPages'] = totalPages;
    _data['size'] = size;
    _data['number'] = number;
    _data['sort'] = sort.toJson();
    _data['first'] = first;
    _data['numberOfElements'] = numberOfElements;
    _data['empty'] = empty;
    return _data;
  }
}

class Content {
  Content({
    required this.id,
    required this.businessLogo,
    required this.businessName,
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
    required this.number,
    required this.cin,
    required this.gstin,
    required this.companyPan,
    required this.vatNumber,
     this.signature,
     this.user,
    required this.deleted,
  });
  late final int id;
  late final String businessLogo;
  late final String businessName;
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
  late final String number;
  late final String cin;
  late final String gstin;
  late final String companyPan;
  late final String vatNumber;
  late final String? signature;
  late final Null user;
  late final bool deleted;
  
  Content.fromJson(Map<String, dynamic> json){
    id = json['id'];
    businessLogo = json['businessLogo'];
    businessName = json['businessName'];
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
    number = json['number'];
    cin = json['cin'];
    gstin = json['gstin'];
    companyPan = json['companyPan'];
    vatNumber = json['vatNumber'];
    signature = null;
    user = null;
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['businessLogo'] = businessLogo;
    _data['businessName'] = businessName;
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
    _data['number'] = number;
    _data['cin'] = cin;
    _data['gstin'] = gstin;
    _data['companyPan'] = companyPan;
    _data['vatNumber'] = vatNumber;
    _data['signature'] = signature;
    _data['user'] = user;
    _data['deleted'] = deleted;
    return _data;
  }
}

class Pageable {
  Pageable({
    required this.sort,
    required this.pageNumber,
    required this.pageSize,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });
  late final Sort sort;
  late final int pageNumber;
  late final int pageSize;
  late final int offset;
  late final bool paged;
  late final bool unpaged;
  
  Pageable.fromJson(Map<String, dynamic> json){
    sort = Sort.fromJson(json['sort']);
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sort'] = sort.toJson();
    _data['pageNumber'] = pageNumber;
    _data['pageSize'] = pageSize;
    _data['offset'] = offset;
    _data['paged'] = paged;
    _data['unpaged'] = unpaged;
    return _data;
  }
}

class Sort {
  Sort({
    required this.sorted,
    required this.empty,
    required this.unsorted,
  });
  late final bool sorted;
  late final bool empty;
  late final bool unsorted;
  
  Sort.fromJson(Map<String, dynamic> json){
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sorted'] = sorted;
    _data['empty'] = empty;
    _data['unsorted'] = unsorted;
    return _data;
  }
}