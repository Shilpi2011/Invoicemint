class EditInvoiceResponse {
  EditInvoiceResponse({
    required this.id,
    required this.selectedBank,
    required this.items,
    required this.rediscount,
    required this.tAndC,
    required this.calType,
    required this.invoiceDate,
    required this.dueDate,
    required this.totalAmount,
    required this.currency,
    required this.title,
    required this.tax,
    required this.signatureForEdit,
    this.createAndEmail,
    this.createAndWhatsapp,
    this.createAndBoth,
    this.recurringDate,
    required this.businessProfile,
    required this.clientProfile,
    required this.invoiceNumber1,
    required this.totalGST1,
    required this.totalINR1,
  });

  late final int id;
  late final int selectedBank;
  late final List<Items> items;
  late final int rediscount;
  late final String tAndC;
  late final String calType;
  late final String invoiceDate;
  late final String dueDate;
  late final int totalAmount;
  late final String currency;
  late final String title;
  late final String tax;
  late final String signatureForEdit;
  late final String? createAndEmail;
  late final String? createAndWhatsapp;
  late final String? createAndBoth;
  late final String? recurringDate;
  late final BusinessProfile businessProfile;
  late final ClientProfile clientProfile;
  late final String invoiceNumber1;
  late final double totalGST1;
  late final double totalINR1;
  
  EditInvoiceResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    selectedBank = json['selectedBank'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    rediscount = json['rediscount'];
    tAndC = json['tAndC'];
    calType = json['calType'];
    invoiceDate = json['invoiceDate'];
    dueDate = json['dueDate'];
    totalAmount = json['totalAmount'];
    currency = json['currency'];
    title = json['title'];
    tax = json['tax'];
    signatureForEdit = json['signatureForEdit'];
    createAndEmail = json['createAndEmail'];
    createAndWhatsapp = json['createAndWhatsapp'];
    createAndBoth = json['createAndBoth'];
    recurringDate = json['recurringDate'];
    businessProfile = BusinessProfile.fromJson(json['businessProfile']);
    clientProfile = ClientProfile.fromJson(json['clientProfile']);
    invoiceNumber1 = json['invoiceNumber1'];
    totalGST1 = json['totalGST1'];
    totalINR1 = json['totalINR1'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['selectedBank'] = selectedBank;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['rediscount'] = rediscount;
    _data['tAndC'] = tAndC;
    _data['calType'] = calType;
    _data['invoiceDate'] = invoiceDate;
    _data['dueDate'] = dueDate;
    _data['totalAmount'] = totalAmount;
    _data['currency'] = currency;
    _data['title'] = title;
    _data['tax'] = tax;
    _data['signatureForEdit'] = signatureForEdit;
    _data['createAndEmail'] = createAndEmail;
    _data['createAndWhatsapp'] = createAndWhatsapp;
    _data['createAndBoth'] = createAndBoth;
    _data['recurringDate'] = recurringDate;
    _data['businessProfile'] = businessProfile.toJson();
    _data['clientProfile'] = clientProfile.toJson();
    _data['invoiceNumber1'] = invoiceNumber1;
    _data['totalGST1'] = totalGST1;
    _data['totalINR1'] = totalINR1;
    return _data;
  }
}

class Items {
  Items({
    required this.id,
    required this.item,
    required this.description,
    required this.gst,
    required this.rate,
    required this.quantity,
    required this.amount,
    required this.gstAmount,
    required this.total,
    this.invoice,
    required this.deleted,
  });

  late final int id;
  late final String item;
  late final String description;
  late final int gst;
  late final int rate;
  late final int quantity;
  late final int amount;
  late final double gstAmount;
  late final double total;
  late final String? invoice;
  late final bool deleted;
  
  Items.fromJson(Map<String, dynamic> json){
    id = json['id'];
    item = json['item'];
    description = json['description'];
    gst = json['gst'];
    rate = json['rate'];
    quantity = json['quantity'];
    amount = json['amount'];
    gstAmount = json['gstAmount'];
    total = json['total'];
    invoice = json['invoice'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['item'] = item;
    _data['description'] = description;
    _data['gst'] = gst;
    _data['rate'] = rate;
    _data['quantity'] = quantity;
    _data['amount'] = amount;
    _data['gstAmount'] = gstAmount;
    _data['total'] = total;
    _data['invoice'] = invoice;
    _data['deleted'] = deleted;
    return _data;
  }
}

class BusinessProfile {
  BusinessProfile({
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
    required this.signature,
    this.user,
    this.bank,
    required this.deleted,
  });

  late final int id;
  late final String businessLogo;
  late final String businessName;
  late final String profileUrl;
  late final String businessSince;
  late final String? businessCategory;
  late final String about;
  late final String country;
  late final String state;
  late final String city;
  late final String pinCode;
  late final String streetAddress;
  late final String? website;
  late final String? linkedIn;
  late final String email;
  late final String number;
  late final String cin;
  late final String gstin;
  late final String companyPan;
  late final String vatNumber;
  late final String signature;
  late final String? user;
  late final String? bank;
  late final bool deleted;

  BusinessProfile.fromJson(Map<String, dynamic> json){
    id = json['id'];
    businessLogo = json['businessLogo'];
    businessName = json['businessName'];
    profileUrl = json['profileUrl'];
    businessSince = json['businessSince'];
    businessCategory = json['businessCategory'];
    about = json['about'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pinCode'];
    streetAddress = json['streetAddress'];
    website = json['website'];
    linkedIn = json['linkedIn'];
    email = json['email'];
    number = json['number'];
    cin = json['cin'];
    gstin = json['gstin'];
    companyPan = json['companyPan'];
    vatNumber = json['vatNumber'];
    signature = json['signature'];
    user = json['user'];
    bank = json['bank'];
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
    _data['bank'] = bank;
    _data['deleted'] = deleted;
    return _data;
  }
}

class ClientProfile {
  ClientProfile({
    required this.id,
    required this.clientName,
    required this.clientEmail,
    required this.clientNumber,
    this.clientLogo,
    required this.clientGST,
    this.clientPAN,
    this.clientAadhar,
    required this.clientAddress,
    required this.clientCity,
    required this.clientState,
    required this.clientCountry,
    required this.clientPinCode,
    required this.deleted,
  });

  late final int id;
  late final String clientName;
  late final String clientEmail;
  late final String clientNumber;
  late final String? clientLogo;
  late final String clientGST;
  late final String? clientPAN;
  late final String? clientAadhar;
  late final String clientAddress;
  late final String clientCity;
  late final String clientState;
  late final String clientCountry;
  late final String clientPinCode;
  late final bool deleted;

  ClientProfile.fromJson(Map<String, dynamic> json){
    id = json['id'];
    clientName = json['clientName'];
    clientEmail = json['clientEmail'];
    clientNumber = json['clientNumber'];
    clientLogo = json['clientLogo'];
    clientGST = json['clientGST'];
    clientPAN = json['clientPAN'];
    clientAadhar = json['clientAadhar'];
    clientAddress = json['clientAddress'];
    clientCity = json['clientCity'];
    clientState = json['clientState'];
    clientCountry = json['clientCountry'];
    clientPinCode = json['clientPinCode'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['clientName'] = clientName;
    _data['clientEmail'] = clientEmail;
    _data['clientNumber'] = clientNumber;
    _data['clientLogo'] = clientLogo;
    _data['clientGST'] = clientGST;
    _data['clientPAN'] = clientPAN;
    _data['clientAadhar'] = clientAadhar;
    _data['clientAddress'] = clientAddress;
    _data['clientCity'] = clientCity;
    _data['clientState'] = clientState;
    _data['clientCountry'] = clientCountry;
    _data['clientPinCode'] = clientPinCode;
    _data['deleted'] = deleted;
    return _data;
  }
}
