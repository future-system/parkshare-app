import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/presentation/components/app_bar/app_bar.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomAppBarDemo(
        body: FutureBuilder<Position>(
          future: _determinePosition(),
          builder: (context, snapshot) => (snapshot.data == null)
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(snapshot.data?.latitude ?? 0, snapshot.data?.longitude ?? 0),
                    initialZoom: 15,
                    minZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                      userAgentPackageName: 'com.example.app',
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                      child: CustomFormField(
                        hint: 'Buscar',
                        suffix: GestureDetector(
                          child: const Icon(Icons.search),
                        ),

                      ),
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(snapshot.data?.latitude ?? 0, snapshot.data?.longitude ?? 0),
                          width: 80,
                          height: 80,
                          child: Icon(Icons.location_on, color: DesignSystem.colors.primary,),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
