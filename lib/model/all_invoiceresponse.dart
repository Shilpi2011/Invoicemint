class   AllInvoicesResponse {
   AllInvoicesResponse({
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
  
   AllInvoicesResponse.fromJson(Map<String, dynamic> json){
    content = List.from(json['content']).map((e)=>Content.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
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
    id = json['id'];
    userId = json['userId'];
    businessId = json['businessId'];
    clientId = json['clientId'];
    dueDate = json['dueDate'];
    subTotal = json['subTotal'];
    invoiceAmount = json['invoiceAmount'];
    date = json['date'];
    invoiceNo = json['invoiceNo'];
    billedBy = json['billedBy'];
    billedTo = json['billedTo'];
    paymentDate = null;
    status = json['status'];
    currency = json['currency'];
    clientCurrency = json['clientCurrency'];
    amountToSettle = json['amountToSettle'];
    deleted = json['deleted'];
    amountRecived = json['amountRecived'];
    transactionCharge = json['transactionCharge'];
    paymentMethod = null;
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