import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookLocalizationScreen extends StatefulWidget {
  const BookLocalizationScreen({Key? key}) : super(key: key);

  @override
  State<BookLocalizationScreen> createState() => _BookLocalizationScreenState();
}

class _BookLocalizationScreenState extends State<BookLocalizationScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização Aproximada do Livro'),
      ),
      body: Column(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              _mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-9.908715120057176,
                  -63.03458896814527), // Substitua latitude e longitude pelas coordenadas reais do livro
              zoom: 12,
            ),
            markers: Set<Marker>.from([
              Marker(
                markerId: MarkerId('Livro'),
                position: LatLng(-9.908715120057176,
                    -63.03458896814527), // Substitua latitude e longitude pelas coordenadas reais do livro
                infoWindow: InfoWindow(
                  title: 'Localização do Livro',
                  snippet: 'Descrição da localização do livro',
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
