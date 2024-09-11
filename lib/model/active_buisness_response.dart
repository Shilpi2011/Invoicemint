class ManageBusinessResponse {
  ManageBusinessResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  final List<Content> content;
  final Pageable pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final Sort sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  factory ManageBusinessResponse.fromJson(Map<String, dynamic> json) {
    return ManageBusinessResponse(
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool? ?? false,
      totalPages: json['totalPages'] as int? ?? 0,
      totalElements: json['totalElements'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
      number: json['number'] as int? ?? 0,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      first: json['first'] as bool? ?? false,
      numberOfElements: json['numberOfElements'] as int? ?? 0,
      empty: json['empty'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e) => e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['last'] = last;
    _data['totalPages'] = totalPages;
    _data['totalElements'] = totalElements;
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
    this.businessLogo,
    required this.businessName,
    this.profileUrl,
    this.businessSince,
    this.businessCategory,
    this.about,
    required this.country,
    this.state,
    this.city,
    this.pinCode,
    this.streetAddress,
    this.website,
    this.linkedIn,
    required this.email,
    required this.number,
    this.cin,
    this.gstin,
    this.companyPan,
    this.vatNumber,
    this.signature,
    this.user,
    this.bank,
    required this.deleted,
  });

  final int id;
  final String? businessLogo;
  final String businessName;
  final String? profileUrl;
  final String? businessSince;
  final String? businessCategory;
  final String? about;
  final String country;
  final String? state;
  final String? city;
  final String? pinCode;
  final String? streetAddress;
  final String? website;
  final String? linkedIn;
  final String email;
  final String number;
  final String? cin;
  final String? gstin;
  final String? companyPan;
  final String? vatNumber;
  final String? signature;
  final String? user;
  final String? bank;
  final bool deleted;
  
  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'] as int,
      businessLogo: json['businessLogo'] as String?,
      businessName: json['businessName'] as String,
      profileUrl: json['profileUrl'] as String?,
      businessSince: json['businessSince'] as String?,
      businessCategory: json['businessCategory'] as String?,
      about: json['about'] as String?,
      country: json['country'] as String,
      state: json['state'] as String?,
      city: json['city'] as String?,
      pinCode: json['pinCode'] as String?,
      streetAddress: json['streetAddress'] as String?,
      website: json['website'] as String?,
      linkedIn: json['linkedIn'] as String?,
      email: json['email'] as String,
      number: json['number'] as String,
      cin: json['cin'] as String?,
      gstin: json['gstin'] as String?,
      companyPan: json['companyPan'] as String?,
      vatNumber: json['vatNumber'] as String?,
      signature: json['signature'] as String?,
      user: json['user'] as String?,
      bank: json['bank'] as String?,
      deleted: json['deleted'] as bool? ?? false,
    );
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
    _data['bank'] = bank;
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

  final Sort sort;
  final int pageNumber;
  final int pageSize;
  final int offset;
  final bool paged;
  final bool unpaged;
  
  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      pageNumber: json['pageNumber'] as int? ?? 0,
      pageSize: json['pageSize'] as int? ?? 0,
      offset: json['offset'] as int? ?? 0,
      paged: json['paged'] as bool? ?? false,
      unpaged: json['unpaged'] as bool? ?? false,
    );
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

  final bool sorted;
  final bool empty;
  final bool unsorted;
  
  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sorted: json['sorted'] as bool? ?? false,
      empty: json['empty'] as bool? ?? false,
      unsorted: json['unsorted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sorted'] = sorted;
    _data['empty'] = empty;
    _data['unsorted'] = unsorted;
    return _data;
  }
}
