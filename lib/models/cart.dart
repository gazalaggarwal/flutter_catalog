import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  //  catalog field
  late CatalogModel _catalog;

  // collectio of IDs store IDs of each item
  final List<int> _itemIds = [];

//  get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//  get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

// get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// add item

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

// remove item

  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}


class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}