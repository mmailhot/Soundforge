import 'package:polymer/polymer.dart';
import 'dart:html' show Event, Node;



@CustomTag('sf-iconbutton')
class SfIconButton extends PolymerElement {
  @published String icon;
  @published String size;

  SfIconButton.created() : super.created() { }
}