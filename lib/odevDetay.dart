import 'package:flutter/material.dart';



class OdevDetay extends StatelessWidget {
  final String ders;
  final String tarih;

  OdevDetay(this.ders,this.tarih);

  @override
  Widget build(BuildContext context) {
    return Text("$ders");
  }
}
