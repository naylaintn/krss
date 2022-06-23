import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:krss/util/style.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as locator;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/location_controller.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  getLocationPermission() async {
    var location = locator.Location();
    try {
      location.requestPermission(); //to lunch location permission popup
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
    }
  }

  late LatLng userLocation;
  Map<String, Marker> _markers = {};


  void _getCurrentLocation() async {

    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then((position){

      setState(() {
        var myMarker = Marker(
          markerId: MarkerId("user_loc"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: "Pelacak Posisi",
            snippet: "Lokasi Saya",
          ),
        );
        _markers["user_loc"] = myMarker;
        userLocation = LatLng(position.latitude, position.longitude);

        print("location lat : ${position.latitude} lng : ${position.longitude}");
        print("marker lat ${_markers["user_loc"]?.position.latitude} lng ${_markers["user_loc"]?.position.longitude}");

      });

    });

  }

  @override
  void initState() {
    super.initState();
    getLocationPermission();
    _getCurrentLocation();
    _cameraPosition=CameraPosition(target: LatLng(
        45.521563,-122.677433
    ), zoom: 17);
  }

  TextEditingController _addressController = TextEditingController();
  late CameraPosition _cameraPosition;

  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {

    // double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text('Pilih Alamat', style: TextStyle(color: Colors.white)),
        backgroundColor: kPrimaryColor,
      ),
      body: GetBuilder<LocationController>(
        builder: (locationController){
          _addressController.text = '${locationController.placeMark.value.name},'
              '${locationController.placeMark.value.locality},'
              '${locationController.placeMark.value.postalCode},'
              '${locationController.placeMark.value.country}';
          print("address in my view is"+_addressController.text);

          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Stack(
                    children: <Widget>[
                      GoogleMap(
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController mapController) {
                          _mapController = mapController;
                          locationController.setMapController(mapController);
                        },
                        initialCameraPosition: _cameraPosition,
                        markers: _markers.values.toSet(),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: true,
                        padding: EdgeInsets.only(top: _height*0.8),
                        myLocationEnabled: true,
                        onCameraIdle: (){
                          locationController.updatePosition(_cameraPosition, true);
                        },
                        onCameraMove: ((position)=> _cameraPosition=position),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                            height: 60,
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    children: [
                                      Icon(Icons.location_on, size: 25, color: kColor1),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: TextField(
                                          controller: _addressController,
                                          decoration: InputDecoration(
                                            hintText: "Pilih Alamat",
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                            errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}