import 'package:flutter/widgets.dart';

abstract class IMusicLibraryItem {
  int getItemsCount();
  int getDuration();
  Widget build(BuildContext context);
}
