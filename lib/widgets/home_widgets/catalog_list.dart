import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                            catalog: catalog,
                          ),
                        ),
                      ),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                            catalog: catalog,
                          ),
                        ),
                      ),
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  // ignore: unnecessary_null_comparison
  const CatalogItem({super.key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg
              .color(context.theme.colorScheme.secondary)
              .bold
              .make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              AddToCart(catalog: catalog)
            ],
          ).pOnly(right: 9.0)
        ],
      ).p(context.isMobile ? 0 : 16))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py16();
  }
}
