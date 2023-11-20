import 'package:flutter/cupertino.dart';

class Shirt{
  final int id;
  final String imageUrl;
  final String title;
  final int amount;
  String? size;
  int? count;
  Shirt({required this.id,required this.title,required this.imageUrl,required this.amount,this.count,this.size});

  @override
  String toString() {
    // TODO: implement toString
    return "id==$id\ntitle==$title\namount==${amount*count!}\nsize==$size";
  }
}
List<Shirt> shirtList=[
  Shirt(title: "Hoody T-Shit", id: 1, imageUrl: "assets/shirt1.png", amount: 150),
  Shirt(title: "Full T-Shit", id: 2, imageUrl: "assets/shirt3.png", amount: 170),
  Shirt(title: "Cloud T-Shit", id: 3, imageUrl: "assets/shirt4.png", amount: 120),
  Shirt(title: "Green Bull", id: 4, imageUrl: "assets/shirt5.png", amount: 180),
];