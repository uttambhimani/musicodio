import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier{

  bool isPlay=false;

  void playPuse(){
    isPlay=!isPlay;
    notifyListeners();
  }

}