import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utilities/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final int days = 30;
    // final String name = "Codepur";
    return Scaffold(

        // appBar: AppBar(
        //   title: Text("Catalog App"),
        // ),

        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor:
                context.theme.floatingActionButtonTheme.backgroundColor,
            child: Icon(
              CupertinoIcons.cart,
              color: MyTheme.creamColor,
            ),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.items.length,
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py12().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        )
        //  Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
        //         ? GridView.builder(
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 16,
        //             ),
        //             itemBuilder: ((context, index) {
        //               final item = CatalogModel.items![index];
        //               return Card(
        //                 clipBehavior: Clip.antiAlias,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(10)),
        //                 child: GridTile(
        //                   header: Container(
        //                     child: Text(
        //                       item.name,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.deepPurple,
        //                     ),
        //                   ),
        //                   child: Image.network(item.image),
        //                   footer: Container(
        //                     child: Text(
        //                       item.price.toString(),
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.black,
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             }),
        //             itemCount: CatalogModel.items!.length,
        //           )
        //         // ListView.builder(
        //         //     itemCount: CatalogModel.items!.length,
        //         //     itemBuilder: (context, index) => ItemWidget(
        //         //           item: CatalogModel.items![index],
        //         //         )
        //         //         )
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           )),
        // drawer: MyDrawer(),
        );
  }
}
