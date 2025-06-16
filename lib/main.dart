import 'package:flutter/material.dart';
// The two crucial imports for our test
import 'package:geofencing_api/geofencing_api.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  // If the imports above worked, these lines should have NO ERRORS.
  // This is the entire point of the test.
  final Geofence testGeofence = Geofence(
    id: 'test',
    latitude: 0,
    longitude: 0,
    radius: 100,
  );

  print('Test geofence created with ID: ${testGeofence.id}');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // We will try to request a permission to test the other package.
          child: ElevatedButton(
            onPressed: () async {
              print('Requesting permission...');
              var status = await Permission.location.request();
              print('Permission status: $status');
            },
            child: const Text('Test Permission'),
          ),
        ),
      ),
    );
  }
}