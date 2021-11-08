/*import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
   PermissionName permissionName = PermissionName.Internet;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _marker = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

static final CameraPosition _position = CameraPosition(
  bearing: 192.833,
  target: LatLng(45.531563,-122.67433),
  tilt: 59.440,
  zoom: 11.0
);

Future<void> _goToPosition()async{
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(_position));
}
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState() {
      List<PermissionName> permissionNames = [];
       permissionNames.add(PermissionName.Location);
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    }
  }

  _onAddMarkerButtonPressed() {
    setState() {
      _marker.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'This is a title',
          snippet: 'This is a snippet',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    }
  }

  final CameraPosition _initialPsition =
      CameraPosition(target: LatLng(22.5448131, 88.3403691));

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
        onPressed: function,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.blue,
        child: Icon(
          icon,
          size: 36.0,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoogleMap"),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _marker,
              onCameraMove: _onCameraMove,
              gestureRecognizers: Set()
                ..add(Factory<EagerGestureRecognizer>(
                    () => EagerGestureRecognizer())),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      button(_onMapTypeButtonPressed, Icons.map),
                      SizedBox(height: 16.0),
                      button(_onAddMarkerButtonPressed, Icons.add_location),
                       SizedBox(height: 16.0),
                        button(_goToPosition, Icons.location_searching)
                    ],
                  ),
                ))
          ],
        ));
  }
}*/
/*

import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GooMap extends StatefulWidget {
  //GooMap({Key key}) : super(key: key);

  final LocationData location;
  GooMap({this.location});

  @override
  _GooMapState createState() => _GooMapState();
}

class _GooMapState extends State<GooMap> {
  // Location
  LocationData _locationData;

  // Maps
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();
  GoogleMapController _googleMapController;
  BitmapDescriptor _markerIcon;
  List<LatLng> polygonLatLngs = List<LatLng>();
  double radius;

  //ids
  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  // Type controllers
  bool _isPolygon = true; //Default
  bool _isMarker = false;
  bool _isCircle = false;

  @override
  void initState() {
    super.initState();
    // If I want to change the marker icon:
    // _setMarkerIcon();
    _locationData = widget.location;
  }

  // This function is to change the marker icon
  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/farm.png');
  }

  // Draw Polygon to the map
  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
  }

  // Set circles as points to the map
  void _setCircles(LatLng point) {
    final String circleIdVal = 'circle_id_$_circleIdCounter';
    _circleIdCounter++;
    print(
        'Circle | Latitude: ${point.latitude}  Longitude: ${point.longitude}  Radius: $radius');
    _circles.add(Circle(
        circleId: CircleId(circleIdVal),
        center: point,
        radius: radius,
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeWidth: 3,
        strokeColor: Colors.redAccent));
  }

  // Set Markers to the map
  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      print(
          'Marker | Latitude: ${point.latitude}  Longitude: ${point.longitude}');
      _markers.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: point,
        ),
      );
    });
  }

  // Start the map with this marker setted up
  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('0'),
          position: LatLng(-20.131886, -47.484488),
          infoWindow:
              InfoWindow(title: 'Roça', snippet: 'Um bom lugar para estar'),
          //icon: _markerIcon,
        ),
      );
    });
  }

  Widget _fabPolygon() {
    return FloatingActionButton.extended(
      onPressed: () {
        //Remove the last point setted at the polygon
        setState(() {
          polygonLatLngs.removeLast();
        });
      },
      icon: Icon(Icons.undo),
      label: Text('Undo point'),
      backgroundColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Studying Maps - Zeh'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        floatingActionButton:
            polygonLatLngs.length > 0 && _isPolygon ? _fabPolygon() : null,
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_locationData.latitude, _locationData.longitude),
                zoom: 16,
              ),
              mapType: MapType.hybrid,
              markers: _markers,
              circles: _circles,
              polygons: _polygons,
              myLocationEnabled: true,
              onTap: (point) {
                if (_isPolygon) {
                  setState(() {
                    polygonLatLngs.add(point);
                    _setPolygon();
                  });
                } else if (_isMarker) {
                  setState(() {
                    _markers.clear();
                    _setMarkers(point);
                  });
                } else if (_isCircle) {
                  setState(() {
                    _circles.clear();
                    _setCircles(point);
                  });
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.black54,
                      onPressed: () {
                        _isPolygon = true;
                        _isMarker = false;
                        _isCircle = false;
                      },
                      child: Text(
                        'Polygon',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  RaisedButton(
                      color: Colors.black54,
                      onPressed: () {
                        _isPolygon = false;
                        _isMarker = true;
                        _isCircle = false;
                      },
                      child: Text('Marker',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                  RaisedButton(
                      color: Colors.black54,
                      onPressed: () {
                        _isPolygon = false;
                        _isMarker = false;
                        _isCircle = true;
                        radius = 50;
                       /* return showDialog(
                            context: context,
                            child: AlertDialog(
                              backgroundColor: Colors.grey[900],
                              title: Text(
                                'Choose the radius (m)',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              content: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Material(
                                    color: Colors.black,
                                    child: TextField(
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.zoom_out_map),
                                        hintText: 'Ex: 100',
                                        suffixText: 'meters',
                                      ),
                                      keyboardType:
                                          TextInputType.numberWithOptions(),
                                      onChanged: (input) {
                                        setState(() {
                                          radius = double.parse(input);
                                        });
                                      },
                                    ),
                                  )),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,),
                                    )),
                              ],
                            ));*/
                      },
                      child: Text('Circle',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))
                ],
              ),
            )
          ],
        ));
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Check Location Permissions, and get my location
  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Studyng Maps - Zeh'),
        centerTitle: true,
        backgroundColor: Colors.grey[900], 
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _locationData != null ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => GooMap(location: _locationData,))) : null,
          backgroundColor: Colors.orange,
          label: Row(
            children: <Widget>[
              Text(
                'Open Maps',
                style: TextStyle(color: Colors.black87),
              ),
              Icon(
                Icons.map,
                color: Colors.black87,
              ),
            ],
          )),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Study of google maps - Zeh',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'App to study some features of google maps: Testing markers, polygons, polylines and circles',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
*/