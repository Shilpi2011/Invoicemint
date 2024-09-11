class DashBoardInvoiceResponse {
   DashBoardInvoiceResponse({
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
  
  late final List<Content> content;
  late final Pageable pageable;
  late final bool last;
  late final int totalPages;
  late final int totalElements;
  late final int size;
  late final int number;
  late final Sort sort;
  late final bool first;
  late final int numberOfElements;
  late final bool empty;
  
   DashBoardInvoiceResponse.fromJson(Map<String, dynamic> json){
    content = (json['content'] != null ? List.from(json['content']).map((e) => Content.fromJson(e)).toList() : []);
    pageable = (json['pageable'] != null ? Pageable.fromJson(json['pageable']) : Pageable(sort: Sort(sorted: false, empty: true, unsorted: false), pageNumber: 0, pageSize: 0, offset: 0, paged: false, unpaged: true));
    last = json['last'] ?? false;
    totalPages = json['totalPages'] ?? 0;
    totalElements = json['totalElements'] ?? 0;
    size = json['size'] ?? 0;
    number = json['number'] ?? 0;
    sort = (json['sort'] != null ? Sort.fromJson(json['sort']) : Sort(sorted: false, empty: true, unsorted: false));
    first = json['first'] ?? false;
    numberOfElements = json['numberOfElements'] ?? 0;
    empty = json['empty'] ?? false;
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
    required this.userId,
    required this.businessId,
    required this.clientId,
    required this.dueDate,
    required this.subTotal,
    required this.invoiceAmount,
    required this.date,
    required this.invoiceNo,
    required this.billedBy,
    required this.billedTo,
    this.paymentDate,
    required this.status,
    required this.currency,
    required this.clientCurrency,
    required this.amountToSettle,
    required this.deleted,
    required this.amountRecived,
    required this.transactionCharge,
    this.paymentMethod,
  });
  
  late final int id;
  late final int userId;
  late final int businessId;
  late final int clientId;
  late final String dueDate;
  late final double subTotal;
  late final double invoiceAmount;
  late final String date;
  late final String invoiceNo;
  late final String billedBy;
  late final String billedTo;
  late final String? paymentDate;
  late final bool status;
  late final String currency;
  late final String clientCurrency;
  late final double amountToSettle;
  late final bool deleted;
  late final double amountRecived;
  late final double transactionCharge;
  late final String? paymentMethod;
  
  Content.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    userId = json['userId'] ?? 0;
    businessId = json['businessId'] ?? 0;
    clientId = json['clientId'] ?? 0;
    dueDate = json['dueDate'] ?? '';
    subTotal = json['subTotal'] != null ? json['subTotal'].toDouble() : 0.0;
    invoiceAmount = json['invoiceAmount'] != null ? json['invoiceAmount'].toDouble() : 0.0;
    date = json['date'] ?? '';
    invoiceNo = json['invoiceNo'] ?? '';
    billedBy = json['billedBy'] ?? '';
    billedTo = json['billedTo'] ?? '';
    paymentDate = json['paymentDate'];
    status = json['status'] ?? false;
    currency = json['currency'] ?? '';
    clientCurrency = json['clientCurrency'] ?? '';
    amountToSettle = json['amountToSettle'] != null ? json['amountToSettle'].toDouble() : 0.0;
    deleted = json['deleted'] ?? false;
    amountRecived = json['amountRecived'] != null ? json['amountRecived'].toDouble() : 0.0;
    transactionCharge = json['transactionCharge'] != null ? json['transactionCharge'].toDouble() : 0.0;
    paymentMethod = json['paymentMethod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['businessId'] = businessId;
    _data['clientId'] = clientId;
    _data['dueDate'] = dueDate;
    _data['subTotal'] = subTotal;
    _data['invoiceAmount'] = invoiceAmount;
    _data['date'] = date;
    _data['invoiceNo'] = invoiceNo;
    _data['billedBy'] = billedBy;
    _data['billedTo'] = billedTo;
    _data['paymentDate'] = paymentDate;
    _data['status'] = status;
    _data['currency'] = currency;
    _data['clientCurrency'] = clientCurrency;
    _data['amountToSettle'] = amountToSettle;
    _data['deleted'] = deleted;
    _data['amountRecived'] = amountRecived;
    _data['transactionCharge'] = transactionCharge;
    _data['paymentMethod'] = paymentMethod;
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
    sort = (json['sort'] != null ? Sort.fromJson(json['sort']) : Sort(sorted: false, empty: true, unsorted: false));
    pageNumber = json['pageNumber'] ?? 0;
    pageSize = json['pageSize'] ?? 0;
    offset = json['offset'] ?? 0;
    paged = json['paged'] ?? false;
    unpaged = json['unpaged'] ?? true;
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
    sorted = json['sorted'] ?? false;
    empty = json['empty'] ?? true;
    unsorted = json['unsorted'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sorted'] = sorted;
    _data['empty'] = empty;
    _data['unsorted'] = unsorted;
    return _data;
  }
}
