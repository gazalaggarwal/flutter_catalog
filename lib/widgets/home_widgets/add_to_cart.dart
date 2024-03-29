import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(item: catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            context.theme.floatingActionButtonTheme.backgroundColor),
      ),
      child: isInCart
          ? Icon(Icons.done).iconColor(Colors.white)
          : Icon(
              CupertinoIcons.cart_badge_plus,
              color: MyTheme.creamColor,
            ),
    );
  }
}
