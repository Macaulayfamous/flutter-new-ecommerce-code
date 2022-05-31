import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/order_attr.dart';
import 'package:flutter/widgets.dart';

class Orders with ChangeNotifier {
  List<OrderAttr> _orders = [];
  List<OrderAttr> get getOrders {
    return _orders;
  }

  Future<void> fetchOrders() async {
    await firebaseStore
        .collection('orders')
        .where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((QuerySnapshot productSnapshot) {
      _orders.clear();
      productSnapshot.docs.forEach((element) {
        _orders.insert(
            0,
            OrderAttr(
                orderId: element.get('orderId'),
                userId: element.get('userId'),
                title: element.get('title'),
                price: element.get('price').toString(),
                imageUrl: element.get('imageUrl'),
                quantity: element.get('quantity').toString(),
                orderDate: element.get('orderDate')));
      });
    });
    notifyListeners();
  }
}
