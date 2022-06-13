class KeyValuePage {

  String id='';
  String key='';
  String content='';

  KeyValuePage({
    this.id='',
    this.key='',
    required this.content,
  });

  factory KeyValuePage.fromJson(Map<String, dynamic> parsedJson){
    return KeyValuePage(
      id: parsedJson['id'] as String,
      key: parsedJson['key'] as String,
      content: parsedJson['value'] as String,
    );
  }

}

class KeyValue {

  String id='';
  String key='';
  String value='';

  KeyValue({
    this.id='',
    this.key='',
    this.value='',
  });

  factory KeyValue.fromJson(Map<String, dynamic> parsedJson){
    return KeyValue(
      id: parsedJson['id'] as String,
      key: parsedJson['key'] as String,
      value: parsedJson['value'] as String,
    );
  }

}