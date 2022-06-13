import 'branch.dart';

class Company{

  int id=0;
  String userId='';
  String partnerId='';
  String companyName='';
  String companyType='';
  String cellPhoneNumber='';
  String phoneNumber='';
  String email='';
  String address='';
  String city='';
  String province='';
  String country='';
  String postCode='';
  String npwp='';
  String bidangUsaha='';
  String founded='';
  String bankAccount='';
  String bank='';
  int employee=0;
  String turnover='';
  String asset='';
  String monthlyTransaction='';
  String npwpPicture='';
  String aktaPicture='';
  String siupPicture='';
  String tdpPicture='';
  String domisiliPicture='';
  String skKumhamPicture='';
  String managementPicture='';
  List<Branch> branches = [];

  Company({
    this.id=0,
    this.partnerId='',
    this.userId='',
    this.companyName='',
    this.companyType='',
    this.cellPhoneNumber='',
    this.phoneNumber='',
    this.email='',
    this.address='',
    this.city='',
    this.province='',
    this.country='',
    this.postCode='',
    this.npwp='',
    this.bidangUsaha='',
    this.founded='',
    this.bankAccount='',
    this.bank='',
    this.employee=0,
    this.turnover='',
    this.asset='',
    this.monthlyTransaction='',
    this.npwpPicture='',
    this.aktaPicture='',
    this.siupPicture='',
    this.tdpPicture='',
    this.domisiliPicture='',
    this.skKumhamPicture='',
    this.managementPicture='',
    required this.branches,
  });

  factory Company.fromJson(Map<String, dynamic> parsedJson){

    List list = parsedJson['branches'] as List;

    return Company(
      id:                 parsedJson['id'] as int,
      partnerId:          parsedJson['partnerId'] as String,
      userId:             parsedJson['userId'] as String,
      companyName:        parsedJson['companyName'] as String,
      companyType:        parsedJson['companyType'] as String,
      cellPhoneNumber:    parsedJson['cellPhoneNumber'] as String,
      phoneNumber:        parsedJson['phoneNumber'] as String,
      email:              parsedJson['email'] as String,
      address:            parsedJson['address'] as String,
      city:               parsedJson['city'] as String,
      province:           parsedJson['province'] as String,
      country:            parsedJson['country'] as String,
      postCode:           parsedJson['postCode'] as String,
      npwp:               parsedJson['npwp'] as String,
      bidangUsaha:        parsedJson['bidangUsaha'] as String,
      founded:            parsedJson['founded'] as String,
      bankAccount:        parsedJson['bankAccount'] as String,
      bank:               parsedJson['bank'] as String,
      employee:           parsedJson['employee'] as int,
      turnover:           parsedJson['turnover'] as String,
      asset:              parsedJson['asset'] as String,
      monthlyTransaction: parsedJson['monthlyTransaction'] as String,
      npwpPicture:        parsedJson['npwpPicture'] as String,
      aktaPicture:        parsedJson['aktaPicture'] as String,
      siupPicture:        parsedJson['siupPicture'] as String,
      tdpPicture:         parsedJson['tdpPicture'] as String,
      domisiliPicture:    parsedJson['domisiliPicture'] as String,
      skKumhamPicture:    parsedJson['skKumhamPicture'] as String,
      managementPicture:  parsedJson['managementPicture'] as String,
      branches: list.map((e)=>Branch.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson()=>{
    'id' : id,
    'partnerId': partnerId,
    'userId' : userId,
    'companyName' : companyName,
    'companyType' : companyType,
    'cellPhoneNumber ' : cellPhoneNumber,
    'phoneNumber' : phoneNumber,
    'email' : email,
    'address' : address,
    'city' : city,
    'province' : province,
    'country' : country,
    'postCode' : postCode,
    'npwp' : npwp,
    'bidangUsaha' : bidangUsaha,
    'founded' : founded,
    'bankAccount' : bankAccount,
    'bank' : bank,
    'employee' : employee,
    'turnover' : turnover,
    'asset' : asset,
    'monthlyTransaction' : monthlyTransaction,
    'npwpPicture' : npwpPicture,
    'aktaPicture' : aktaPicture,
    'siupPicture' : siupPicture,
    'tdpPicture' : tdpPicture,
    'domisiliPicture' : domisiliPicture,
    'skKumhamPicture' : skKumhamPicture,
    'managementPicture' : managementPicture,
  };

}

class PageCompany{

  List<Company> content;
  int totalPages;
  int totalElements;
  bool last;
  bool first;
  int numberOfElements;
  int size;
  int number;

  PageCompany({
    required this.content,
    this.totalPages=0,
    this.totalElements=0,
    this.last=false,
    this.first=false,
    this.numberOfElements=0,
    this.size=0,
    this.number=0,
  });

  factory PageCompany.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['content'] as List;
    List<Company> productList = list.map((item)=>Company.fromJson(item)).toList();

    return PageCompany(
      content:             productList,
      totalPages:          parsedJson['totalPages'] as int,
      totalElements:       parsedJson['totalElements'] as int,
      last:                parsedJson['last'] as bool,
      first:               parsedJson['first'] as bool,
      numberOfElements:    parsedJson['numberOfElements'] as int,
      size:                parsedJson['size'] as int,
      number:              parsedJson['number'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'content':            content,
    'totalPages':         totalPages,
    'totalElements':      totalElements,
    'last':               last,
    'first':              first,
    'numberOfElements':   numberOfElements,
    'size':               size,
    'number':             number,
  };

}