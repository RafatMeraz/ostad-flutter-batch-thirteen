import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GoogleMap(
        mapType: MapType.normal,
        trafficEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.806496124472325, 90.36651851164498),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
        },
        onTap: (LatLng latLng) {
          print(latLng);
        },
        onLongPress: (LatLng latLng) {
          print('Long Pressed on $latLng');
        },
        markers: <Marker>{
          Marker(
            markerId: MarkerId('home'),
            position: LatLng(23.806496124472325, 90.36651851164498),
            onTap: () {
              print('Tapped on my home');
            },
            visible: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
            infoWindow: InfoWindow(title: 'Home', onTap: () {}),
          ),
          Marker(
            markerId: MarkerId('office'),
            position: LatLng(23.803306323552093, 90.37058841437101),
            onTap: () {
              print('Tapped on my home');
            },
            visible: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
            infoWindow: InfoWindow(title: 'Office', onTap: () {}),
          ),
          Marker(
            markerId: MarkerId('second-office'),
            position: LatLng(23.796155636794648, 90.36435931921005),
            onTap: () {
              print('Tapped on my office');
            },
            visible: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
            infoWindow: InfoWindow(title: 'Second Office', onTap: () {}),
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId('home-to-office'),
            points: [
              LatLng(23.806496124472325, 90.36651851164498),
              LatLng(23.803306323552093, 90.37058841437101),
              LatLng(23.796155636794648, 90.36435931921005),
            ],
            visible: true,
            color: Colors.red,
            width: 20,
            endCap: Cap.roundCap,
            startCap: Cap.buttCap,
            jointType: JointType.round,
            onTap: () {},
          ),
          Polyline(
            polylineId: PolylineId('second-office-to-home'),
            points: [
              LatLng(23.796155636794648, 90.36435931921005),
              LatLng(23.806496124472325, 90.36651851164498),
            ],
            visible: true,
            color: Colors.green,
            width: 10,
            endCap: Cap.roundCap,
            startCap: Cap.buttCap,
            jointType: JointType.round,
            onTap: () {},
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('Red-zone'),
            center: LatLng(23.796155636794648, 90.36435931921005),
            radius: 200,
            strokeWidth: 4,
            strokeColor: Colors.pink,
            fillColor: Colors.pink.withAlpha(50),
            onTap: () {
              print('on tapped office zone');
            },
            consumeTapEvents: true,
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId('random-polygon'),
            points: [
              LatLng(23.791558865692267, 90.36354895681143),
              LatLng(23.78598877488178, 90.36961141973734),
              LatLng(23.767733673066708, 90.37261515855789),
              LatLng(23.76986772970594, 90.35361506044865),
              LatLng(23.78663611538475, 90.34376565366983),
              LatLng(23.803216443917602, 90.33622328191996),
            ],
            fillColor: Colors.deepOrange.withAlpha(50),
            strokeColor: Colors.deepOrangeAccent,
            strokeWidth: 4,
            onTap: () {
              print('on tapped random polygon');
            },
            consumeTapEvents: true,
          ),
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // LatLng(23.806496124472325, 90.36651851164498)
              // _googleMapController.moveCamera(
              //   CameraUpdate.newCameraPosition(
              //     CameraPosition(
              //       target: LatLng(23.806496124472325, 90.36651851164498),
              //       zoom: 16
              //     ),
              //   ),
              // );
              _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(23.806496124472325, 90.36651851164498),
                    zoom: 16
                  ),
                ),
              );
            },
            child: Icon(Icons.my_location),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
