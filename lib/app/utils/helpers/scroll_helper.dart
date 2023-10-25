import 'package:flutter/material.dart';

class ScrollHelper {
  static bool isScrollEnd(ScrollController scrollCtrl) {
    bool isEnd = false;
    isEnd = scrollCtrl.offset >= scrollCtrl.position.maxScrollExtent &&
        !scrollCtrl.position.outOfRange;

    return isEnd;
  }
}
