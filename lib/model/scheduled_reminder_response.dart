class ScheduledReminderResponse {
  ScheduledReminderResponse({
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
  
  ScheduledReminderResponse.fromJson(Map<String, dynamic> json) {
    content = (json['content'] as List<dynamic>?)
        ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];
    pageable = Pageable.fromJson(json['pageable'] ?? {});
    last = json['last'] ?? false;
    totalElements = json['totalElements'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    size = json['size'] ?? 0;
    number = json['number'] ?? 0;
    sort = Sort.fromJson(json['sort'] ?? {});
    first = json['first'] ?? false;
    numberOfElements = json['numberOfElements'] ?? 0;
    empty = json['empty'] ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content.map((e) => e.toJson()).toList(),
      'pageable': pageable.toJson(),
      'last': last,
      'totalElements': totalElements,
      'totalPages': totalPages,
      'size': size,
      'number': number,
      'sort': sort.toJson(),
      'first': first,
      'numberOfElements': numberOfElements,
      'empty': empty,
    };
  }
}

class Content {
  Content({
    required this.id,
    required this.invoice,
    this.sendTo,
    this.subject,
    this.message,
    this.timeZone,
    required this.invoiceNumber,
    required this.dateTime,
    required this.sent,
    required this.email,
    required this.reminder,
    required this.deleted,
    required this.stop,
  });

  late final int id;
  late final int invoice;
  late final String? sendTo;
  late final String? subject;
  late final String? message;
  late final String? timeZone;
  late final String invoiceNumber;
  late final String dateTime;
  late final bool sent;
  late final bool email;
  late final bool reminder;
  late final bool deleted;
  late final bool stop;
  
  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    invoice = json['invoice'] ?? 0;
    sendTo = json['sendTo'] as String?;
    subject = json['subject'] as String?;
    message = json['message'] as String?;
    timeZone = json['timeZone'] as String?;
    invoiceNumber = json['invoiceNumber'] ?? '';
    dateTime = json['dateTime'] ?? '';
    sent = json['sent'] ?? false;
    email = json['email'] ?? false;
    reminder = json['reminder'] ?? false;
    deleted = json['deleted'] ?? false;
    stop = json['stop'] ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoice': invoice,
      'sendTo': sendTo,
      'subject': subject,
      'message': message,
      'timeZone': timeZone,
      'invoiceNumber': invoiceNumber,
      'dateTime': dateTime,
      'sent': sent,
      'email': email,
      'reminder': reminder,
      'deleted': deleted,
      'stop': stop,
    };
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
  
  Pageable.fromJson(Map<String, dynamic> json) {
    sort = Sort.fromJson(json['sort'] ?? {});
    pageNumber = json['pageNumber'] ?? 0;
    pageSize = json['pageSize'] ?? 0;
    offset = json['offset'] ?? 0;
    paged = json['paged'] ?? false;
    unpaged = json['unpaged'] ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'sort': sort.toJson(),
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'offset': offset,
      'paged': paged,
      'unpaged': unpaged,
    };
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
  
  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'] ?? false;
    empty = json['empty'] ?? false;
    unsorted = json['unsorted'] ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'sorted': sorted,
      'empty': empty,
      'unsorted': unsorted,
    };
  }
}
