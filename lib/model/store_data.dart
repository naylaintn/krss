class StoreData{

  String id='';
  String userId='';
  String outletName='';
  String outletType='';
  String institutionName='';
  String cellPhoneNumber='';
  String phoneNumber='';
  String email='';
  String address='';
  String area='';
  String city='';
  String province='';
  String country='';
  String postCode='';
  String npwp='';
  String bankAccount='';
  String bank='';
  String outletLink='';
  String logoWhite='';
  String logoColor='';
  String logoSquare='';


  StoreData({

    this.id='',
    this.userId='',
    this.outletName='',
    this.outletType='',
    this.institutionName='',
    this.cellPhoneNumber='',
    this.phoneNumber='',
    this.email='',
    this.address='',
    this.area='',
    this.city='',
    this.province='',
    this.country='',
    this.postCode='',
    this.npwp='',
    this.bankAccount='',
    this.bank='',
    this.outletLink='',
    this.logoWhite='',
    this.logoColor='',
    this.logoSquare='',


  });

  factory StoreData.fromJson(Map<String, dynamic> parsedJson){

    return StoreData(

      id:               parsedJson['id'] as String,
      userId:           parsedJson['userId'] as String,
      outletName:       parsedJson['outletName'] as String,
      outletType:       parsedJson['outletType'] as String,
      institutionName:  parsedJson['institutionName'] as String,
      cellPhoneNumber:  parsedJson['cellPhoneNumber'] as String,
      phoneNumber:      parsedJson['phoneNumber'] as String,
      email:            parsedJson['email'] as String,
      address:          parsedJson['address'] as String,
      area:             parsedJson['area'] as String,
      city:             parsedJson['city'] as String,
      province:         parsedJson['province'] as String,
      country:          parsedJson['country'] as String,
      postCode:         parsedJson['postCode'] as String,
      npwp:             parsedJson['npwp'] as String,
      bankAccount:      parsedJson['bankAccount'] as String,
      bank:             parsedJson['bank'] as String,
      outletLink:       parsedJson['outletLink'] as String,
      logoWhite:        parsedJson['logoWhite'] as String,
      logoColor:        parsedJson['logoColor'] as String,
      logoSquare:       parsedJson['logoSquare'] as String,

    );

  }

  Map<String, dynamic> toJson() =>{

    'id':               id,
    'userId':           userId,
    'outletName':       outletName,
    'outletType':       outletType,
    'institutionName':  institutionName,
    'cellPhoneNumber':  cellPhoneNumber,
    'phoneNumber':      phoneNumber,
    'email':            email,
    'address':          address,
    'area':             area,
    'city':             city,
    'province':         province,
    'country':          country,
    'postCode':         postCode,
    'npwp':             npwp,
    'bankAccount':      bankAccount,
    'bank':             bank,
    'outletLink':       outletLink,
    'logoWhite':        logoWhite,
    'logoColor':        logoColor,
    'logoSquare':       logoSquare,

  };



}