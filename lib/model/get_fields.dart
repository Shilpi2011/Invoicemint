class ClientFieldsResponse {
  ClientFieldsResponse({
    required this.id,
    required this.fields,
    required this.fieldsType,
    required this.fieldsKey,
    required this.hide,
    required this.deleted,
  });
  late final int id;
  late final String fields;
  late final String fieldsType;
  late final String fieldsKey;
  late final bool hide;
  late final bool deleted;
  
  ClientFieldsResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fields = json['fields'];
    fieldsType = json['fieldsType'];
    fieldsKey = json['fieldsKey'];
    hide = json['hide'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fields'] = fields;
    _data['fieldsType'] = fieldsType;
    _data['fieldsKey'] = fieldsKey;
    _data['hide'] = hide;
    _data['deleted'] = deleted;
    return _data;
  }
}