class Address {

  late int id;
  final String userId;
  final String partner;
  final String classification;
  final String name;
  final String status;
  final String cellPhoneNumber;
  final String phoneNumber;
  final String email;
  final String country;
  final String addressL1;
  final String addressL2;
  final String addressL3;
  final String addressL4;
  final String addressL5;
  final String addressL6;
  final String addressL7;
  final String streetAddress;
  final String building;
  final String postCode;
  late double longitude;
  late double latitude;

  Address({

    id,
    this.userId="",
    this.partner="",
    this.classification="",
    this.name="",
    this.status="",
    this.cellPhoneNumber="",
    this.phoneNumber="",
    this.email="",
    this.country="",
    this.addressL1="",
    this.addressL2="",
    this.addressL3="",
    this.addressL4="",
    this.addressL5="",
    this.addressL6="",
    this.addressL7="",
    this.streetAddress="",
    this.building="",
    this.postCode="",
    longitude,
    latitude,

  });

  factory Address.fromJson(Map<String, dynamic> parsedJson){

    return Address(

      id:              parsedJson['id']                 as int,
      userId:          parsedJson['userId']             as String,
      partner:         parsedJson['partner']            as String,
      classification:  parsedJson['classification']     as String,
      name:            parsedJson['name']               as String,
      status:          parsedJson['status']             as String,
      cellPhoneNumber: parsedJson['cellPhoneNumber']   as String,
      phoneNumber:     parsedJson['phoneNumber']   as String,
      email:           parsedJson['email']   as String,
      country:         parsedJson['country']   as String,
      addressL1:       parsedJson['addressL1']   as String,
      addressL2:       parsedJson['addressL2']   as String,
      addressL3:       parsedJson['addressL3']   as String,
      addressL4:       parsedJson['addressL4']   as String,
      addressL5:       parsedJson['addressL5']   as String,
      addressL6:       parsedJson['addressL6']   as String,
      addressL7:       parsedJson['addressL7']   as String,
      streetAddress:   parsedJson['streetAddress']   as String,
      building:        parsedJson['building']   as String,
      postCode:        parsedJson['postCode']   as String,
      longitude:       parsedJson['longitude']   as double,
      latitude:        parsedJson['latitude']   as double,

    );
  }

  Map<String, dynamic> toJson() => {

    'id':              id,
    'userId':          userId,
    'partner':         partner,
    'classification':  classification,
    'name':            name,
    'status':          status,
    'cellPhoneNumber': cellPhoneNumber,
    'phoneNumber':     phoneNumber,
    'email':           email,
    'country':         country,
    'addressL1':       addressL1,
    'addressL2':       addressL2,
    'addressL3':       addressL3,
    'addressL4':       addressL4,
    'addressL5':       addressL5,
    'addressL6':       addressL6,
    'addressL7':       addressL7,
    'streetAddress':   streetAddress,
    'building':        building,
    'postCode':        postCode,
    'longitude':       longitude,
    'latitude':        latitude,

  };

}