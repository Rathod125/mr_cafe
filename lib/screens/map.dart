import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mr_cafe/screens/payment.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late double latitude;
  late double longitude;
  late String adress;
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchcontroller = TextEditingController();

  Marker _marker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Mr. Cafe'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(21.2342801, 72.8070042),
  );

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.2342801, 72.8070042),
    zoom: 14.4746,
  );

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Mr. Cafe'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(21.2342801, 72.8070042),
  );

  void _setmarker(LatLng point) {
    setState(() {
      _marker = Marker(
        markerId: MarkerId('_kuser'),
        infoWindow: InfoWindow(title: adress),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: point,
      );
    });
  }

  // static final CameraPosition _kUser = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(21.2226511, 72.7950057),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  // static final Marker _kUserLocationMarker = Marker(
  //   markerId: MarkerId('_kUserLocation'),
  //   infoWindow: InfoWindow(title: 'YourLocation'),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //   position: LatLng(21.2226511, 72.7950057),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _searchcontroller,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Enter Your Location'),
                  onChanged: (value) {
                    print(value);
                  },
                )),
                IconButton(
                    onPressed: () async {
                      List<Location> locations =
                          await locationFromAddress(_searchcontroller.text);
                      latitude = locations.last.latitude;
                      longitude = locations.last.longitude;
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(latitude, longitude);
                      adress = _searchcontroller.text +
                          ',' +
                          placemarks.reversed.last.subLocality.toString() +
                          ',' +
                          placemarks.reversed.last.locality.toString() +
                          ',' +
                          placemarks.reversed.last.postalCode.toString();
                      print(adress);
                      print(latitude);
                      print(longitude);
                      // LocationService()
                      //     .getDirections('surat', _searchcontroller.text);
                      _goToThePlace();
                      _searchcontroller.clear();
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: {_kGooglePlexMarker, _marker},
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onTap: (point) async {
                        print(point);
                        List<Placemark> placemark =
                            await placemarkFromCoordinates(
                                point.latitude, point.longitude);
                        adress = placemark.reversed.last.street.toString() +
                            ',' +
                            placemark.reversed.last.subLocality.toString() +
                            ',' +
                            placemark.reversed.last.locality.toString() +
                            ',' +
                            placemark.reversed.last.postalCode.toString();
                        print(placemark.reversed.last);
                        setState(() {
                          _setmarker(point);
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.19,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEADBCC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFF212325))),
                      ),
                      onPressed: (() {
                        Dialog dialog = Dialog(
                          backgroundColor: Color(0xFFEADBCC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    "Enter Address",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF212325),
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        hintText:
                                            'Enter HouseNo. and StreetName',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF212325),
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF212325),
                                              width: 1.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Payment.takeaway = true;
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return Payment();
                                            })));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF212325)),
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(
                                                color: Color(0xFFEADBCC)),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF212325)),
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Color(0xFFEADBCC)),
                                          )),
                                    ]),
                              ],
                            ),
                          ),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => dialog);
                      }),
                      child: Text(
                        'Save Location',
                        style: TextStyle(
                          fontFamily: 'Libre Baskerville',
                          fontSize: 20,
                          color: Color(0xFF212325),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToThePlace() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(latitude, longitude), zoom: 12),
    ));
    _setmarker(LatLng(latitude, longitude));
  }
}
