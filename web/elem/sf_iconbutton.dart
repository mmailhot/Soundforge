import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;



@CustomTag('sf-iconbutton')
class SfIconButton extends PolymerElement {
  @published String icon;
  @published String size;

  SfIconButton.created() : super.created() { }

  void onClicked(Event e, var detail, Node sender) {
    e.preventDefault();
  }
}