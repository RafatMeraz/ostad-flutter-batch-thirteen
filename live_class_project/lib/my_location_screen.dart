import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:live_class_project/location_service.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key});

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  Position? _currentLocation;
  StreamSubscription? _locationSubscriber;
  final LocationService _locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Location')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('My Current Location $_currentLocation', textAlign: .center),
            FilledButton(
              onPressed: _getCurrentLocation,
              child: Text('Get My Location'),
            ),
            FilledButton(
              onPressed: _listenCurrentLocation,
              child: Text('Listen My Location'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    _currentLocation = await _locationService.getCurrentLocation();
    setState(() {});
  }

  Future<void> _listenCurrentLocation() async {
    _locationService.handleLocationPermission(
      onSuccess: () {
        // Then get the location
        _locationSubscriber =
            Geolocator.getPositionStream(
              locationSettings: LocationSettings(
                accuracy: LocationAccuracy.best,
                distanceFilter: 2,
                timeLimit: Duration(seconds: 10),
              ),
            ).listen((position) {
              print(position);
              _currentLocation = position;
              setState(() {});
            });
      },
    );
  }

  @override
  void dispose() {
    _locationSubscriber?.cancel();
    super.dispose();
  }
}
