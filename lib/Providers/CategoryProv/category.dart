import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pos_sys/Models/Items/items.dart';

class CategoryProv with ChangeNotifier {
  late List<Items> currentItems;
  int quantityTemp = 0;
  double totalPriceTemp = 0;
  //Just for demo , we will make it single list depends on id .
  void setCurrentItem(catID) {
    currentItems =
        categoryItems.where((element) => element.catID == catID).toList();
    log(currentItems[0].catID.toString());
  }

  void updateQuantity(int index, Operation operation) {
    if (operation == Operation.add) {
      if (currentItems[index].quantity > quantityTemp) {
        totalPriceTemp += currentItems[index].price;
        quantityTemp++;
      }
    } else {
      if (quantityTemp > 1) {
        totalPriceTemp -= currentItems[index].price;
        quantityTemp--;
      }
    }
    notifyListeners();
  }

  void resetTotalAndIndex(index) {
    totalPriceTemp = currentItems[index].price;
    quantityTemp = 1;
    notifyListeners();
  }

  List<Items> categoryItems = [
    //PS
    Items(
        itemName: 'PS 2',
        arName: '',
        photo: 'https://m.media-amazon.com/images/I/61pETE6v4vL.jpg',
        price: 50,
        hasVat: false,
        catID: 1,
        id: 1,
        quantity: 2),
    Items(
        itemName: 'PS 5',
        arName: '',
        photo:
            'https://www.nme.com/wp-content/uploads/2020/06/ps5-credit-sie@2000x1270.jpg',
        price: 80,
        hasVat: false,
        catID: 1,
        id: 2,
        quantity: 1),
    //Drinks
    Items(
      itemName: 'Lemon smoothy',
      arName: '',
      photo:
          'https://www.5minutesformom.com/wp-content/uploads/2019/05/Lemon-Iced-Tea-Smoothie-4445-500x500.jpg',
      price: 80,
      hasVat: false,
      catID: 2,
      id: 1,
      quantity: 4,
    ),
    Items(
      itemName: 'Orange smoothy',
      arName: '',
      photo:
          'http://www.simplehealthykitchen.com/wp-content/uploads/2014/12/stress-buster-smoothie-simplehealthykitchen.com_.jpg',
      price: 80,
      hasVat: false,
      catID: 2,
      id: 2,
      quantity: 1,
    ),
    //Sandwitches
    Items(
      itemName: 'Chicken baneh',
      arName: '',
      photo:
          'https://images.deliveryhero.io/image/talabat/Menuitems/sandwesh_baneh_637504799163546073.jpg',
      price: 120,
      hasVat: false,
      catID: 3,
      id: 1,
      quantity: 2,
    ),
    Items(
      itemName: 'Chicken Fajita',
      arName: '',
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAVwVj1c0Xl5pwa7xKvnA0NbMsPvRvXK3PHRbH42M051LM0s1y11T1vr65Bc0ioweP_5o&usqp=CAU',
      price: 120,
      hasVat: false,
      catID: 3,
      id: 2,
      quantity: 12,
    )
  ];
}

enum Operation { add, subtract }
