import 'content_data.dart';

class PublishedPage {
  String pageName ='';
  List content = [];

  PublishedPage({
    this.pageName='',
    required this.content,
  });

  factory PublishedPage.fromJson(Map<String, dynamic> parsedJson){
    return PublishedPage(
      pageName: parsedJson['pageName'] as String,
      content: parsedJson['content'] as List,
    );
  }

}