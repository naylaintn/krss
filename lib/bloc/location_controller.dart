import 'dart:io';

import 'package:get/get.dart';
import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:krss/model/address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../util/constants.dart' as constants;

class LocationController extends GetxController {

  final _ph = constants.ph;
  // final _phDomain = constants.domain;

  late Position position;
  late Position pickPosition;
  late GoogleMapController mapController;

  var loading = RxBool(false).obs;
  var updateAddressData = RxBool(true).obs;
  var changeAddress = RxBool(true).obs;
  var address = Address().obs;
  var pickPlaceMark = Placemark().obs;
  var placeMark = Placemark().obs;


  List<Address> addressList = [];

  void setMapController(GoogleMapController _mapController) {
    mapController = _mapController;
  }

  void getAddressFromGeocode(LatLng latlng) async {
    String json = jsonEncode(latlng);
    print("request updateAddress json : $json");

    Map<String, String> headers = {HttpHeaders.acceptHeader:"application/stream+json",
      HttpHeaders.contentTypeHeader:"application/stream+json"};

    var uri = Uri.parse(_ph + "/hosts/cart/address/update");

    http.Response response = await http.post(uri, headers: headers, body:json);

    print("Response request updateAddress : ${response.statusCode} and body : ${response.body}");

    if(response.statusCode == 200){
      address.value = Address.fromJson(jsonDecode(response.body));
    } else {
      print("Error getting the google API");
    }

  }

  void updatePosition(CameraPosition _position, bool fromAddress) async {
    if (updateAddressData.value.isTrue) {
      loading.value.isTrue;
      update();
      try {
        if (fromAddress) {
          position = Position(
            latitude: _position.target.latitude,
            longitude: _position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        } else {
          pickPosition = Position(
            latitude: _position.target.latitude,
            longitude: _position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        }

        if (changeAddress.value.isTrue) {

          final _address = getAddressFromGeocode(
            LatLng(
              _position.target.longitude,
              _position.target.latitude,
            ),
          );

          if(fromAddress==true){
            placeMark.value.name;
            _address;

          } else {
            pickPlaceMark.value.name;
            _address;
          }

        }
      } catch (e) {
        print(e);
      }
    }
  }

}