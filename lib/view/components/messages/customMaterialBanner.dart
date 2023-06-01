import 'package:flutter/material.dart';

void customMaterialBanner(context, String title, Color corDeFundo) {
  final materialBanner = MaterialBanner(
      contentTextStyle: TextStyle(color: Colors.white),
      backgroundColor: corDeFundo,
      content: Text('${title}'),
      actions: [
        GestureDetector(
            onTap: () {
              Future.delayed(Duration(seconds: 3), () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              });
            },
            child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                )))
      ]);
  ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
}
