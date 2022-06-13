class HostResponse{

  dynamic content;
  int count;
  int total;
  String dataType;
  final String responseCode;
  final String responseMessage;

  HostResponse({
    this.content,
    this.count=0,
    this.total=0,
    this.dataType='',
    this.responseCode='',
    this.responseMessage='',
  });

  factory HostResponse.fromJson(Map<String, dynamic> parsedJson){

    //List list = parsedJson['content'] as List;

    return HostResponse(
      content: parsedJson['content'] as dynamic,
      count: parsedJson['count'] as int,
      total: parsedJson['total'] as int,
      dataType: parsedJson['dataType'] as String,
      responseCode: parsedJson['responseCode'] as String,
      responseMessage: parsedJson['responseMessage'] as String,
    );

  }

  Map<String, dynamic> toJson() =>{
    'content': content,
    'count': count,
    'total': total,
    'dataType': dataType,
    'responseCode': responseCode,
    'responseMessage': responseMessage,
  };

}