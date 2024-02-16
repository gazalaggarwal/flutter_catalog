import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  // ignore: unnecessary_null_comparison
  const CatalogImage({super.key, required this.image}) : assert(image != null);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p12
        .color(context.canvasColor)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20);
  }
}
