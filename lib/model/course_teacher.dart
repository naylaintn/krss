
import 'package:krss/model/credential.dart';

class CourseTeacher {

  int id=0;
  int courseId=0;
  int productId=0;
  int teacherId=0;
  int curriculumId=0;
  int levelId=0;
  int degreeId=0;
  int classificationId=0;
  int branchId=0;
  String userId="";
  String partnerId="";
  String teacherName="";
  String code="";
  String name="";
  String level="";
  Credential credential = Credential();

  CourseTeacher({
    this.id=0,
    this.courseId=0,
    this.productId=0,
    this.teacherId=0,
    this.curriculumId=0,
    this.levelId=0,
    this.degreeId=0,
    this.classificationId=0,
    this.branchId=0,
    this.userId="",
    this.partnerId="",
    this.teacherName="",
    this.code="",
    this.name="",
    this.level="",
    //required this.credential,
  });

  factory CourseTeacher.fromJson(Map<String, dynamic> parsedJson){
        var cred = parsedJson['credential'] as dynamic;
    return CourseTeacher(
        id: parsedJson['id'] as int,
        courseId: parsedJson['courseId'] as int,
        productId: parsedJson['productId'] as int,
        teacherId: parsedJson['teacherId'] as int,
        curriculumId: parsedJson['curriculumId'] as int,
        levelId: parsedJson['levelId'] as int,
        degreeId: parsedJson['degreeId'] as int,
        classificationId: parsedJson['classificationId'] as int,
        branchId: parsedJson['branchId'] as int,
        userId: parsedJson['userId'] as String,
        partnerId: parsedJson['partnerId'] as String,
        teacherName: parsedJson['teacherName'] as String,
        code: parsedJson['code'] as String,
        name: parsedJson['name'] as String,
        level: parsedJson['level'] as String,
        //credential: Credential.fromJson(cred),
    );
  }

  Map<String, dynamic> toJson()=> {
      'id': id,
      'courseId': courseId,
      'productId': productId,
      'teacherId': teacherId,
      'curriculumId': curriculumId,
      'levelId': levelId,
      'degreeId': degreeId,
      'classificationId': classificationId,
      'branchId': branchId,
      'userId': userId,
      'partnerId': partnerId,
      'teacherName': teacherName,
      'code': code,
      'name': name,
      'level': level,
      'credential': credential,
  };




}