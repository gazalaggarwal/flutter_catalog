import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  // ignore: unnecessary_null_comparison
  const HomeDetailPage({super.key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl2.red800.make(),
              AddToCart(
                catalog: catalog,
              ).wh(130, 45)
            ],
          ).p24(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl3
                            .color(context.theme.colorScheme.secondary)
                            .bold
                            .make(),
                        catalog.desc.text.lg
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        "Ipsum sed ipsum et ut ipsum no, gubergren sed lorem sadipscing justo ipsum elitr. Magna et ipsum tempor dolore eos, lorem aliquyam consetetur."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py64()),
              ))
            ],
          ),
        ));
  }
}
