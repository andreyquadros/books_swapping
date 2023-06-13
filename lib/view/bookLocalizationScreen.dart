import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;


class BookLocalizationScreen extends StatefulWidget {
  const BookLocalizationScreen({Key? key}) : super(key: key);

  @override
  State<BookLocalizationScreen> createState() => _BookLocalizationScreenState();
}

class _BookLocalizationScreenState extends State<BookLocalizationScreen> {
  GoogleMapController? _mapController;
  //BitmapDescriptor? bookIcon;

  // Future<void> _loadCustomIcon() async {
  //   final ByteData? byteData = await rootBundle.load('assets/images/book_template.png');
  //   if (byteData != null) {
  //     final Uint8List bytes = byteData.buffer.asUint8List();
  //     final img.Image? image = img.decodeImage(bytes);
  //     if (image != null) {
  //       final img.Image resizedImage = img.copyResize(image, width: 48, height: 48);
  //       final Uint8List resizedBytes = img.encodePng(resizedImage);
  //       bookIcon = BitmapDescriptor.fromBytes(resizedBytes);
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //_loadCustomIcon();
  }

  @override
  Widget build(BuildContext context) {
    //_loadCustomIcon();
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização Aproximada do Livro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                onMapCreated: (controller) {
                  _mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(-9.908715120057176,
                      -63.03458896814527), // Substitua latitude e longitude pelas coordenadas reais do livro
                  zoom: 20,
                ),
                markers: Set<Marker>.from([
                  Marker(
                    markerId: MarkerId('Livro'),
                    position: LatLng(-9.908715120057176,
                        -63.03458896814527),
                   //icon: bookIcon!,
                   // Substitua latitude e longitude pelas coordenadas reais do livro
                    infoWindow: InfoWindow(
                      title: 'Localização do Livro',
                      snippet: 'Descrição Aproximada da localização do livro',
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
