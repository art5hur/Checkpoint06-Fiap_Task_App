import 'package:flutter/material.dart';

class TemaProvider with ChangeNotifier {
  bool temaEscuro = false;


  void mudancaTema()  {
    temaEscuro = !temaEscuro;
    notifyListeners();  
  }

  ThemeData get temaAtual {
    return temaEscuro ? ThemeData.dark() : ThemeData.light();
  }
}
