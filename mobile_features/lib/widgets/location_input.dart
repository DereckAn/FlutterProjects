import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_features/models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectPlace});
  final void Function(PlaceLocation location) onSelectPlace;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? pickedLocation;
  bool isGettingLocation = false;

  String get locationImage {
    if (pickedLocation == null) {
      return '';
    }

    final lat = pickedLocation!.latitude;
    final lng = pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$lng&key=AIzaSyDve8khUCBU0VKqx5NgTJiBDji9CAwyOW8';
  }

  void getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if(lat == null || lng == null){
      print('algo esta siendo null');
      return;
    }

    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDve8khUCBU0VKqx5NgTJiBDji9CAwyOW8&enable_address_descriptor=true');
    final response = await http.get(url);
    final resdata = json.decode(response.body);
    final address = resdata['results'][0]['formatted_address'];


    setState(() {
      pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      isGettingLocation = false;
    });

    widget.onSelectPlace(pickedLocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = const Text('no location chosen yet');

    if(pickedLocation == null ){
      previewContent = Text('Marico!!! algo pasa');
    }

    
    if(pickedLocation != null){
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }

    if(isGettingLocation){
      previewContent = const CircularProgressIndicator();
    }



    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: previewContent,
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on map'),
            ),
          ],
        ),
      ],
    );
  }
}
