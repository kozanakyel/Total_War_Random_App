import 'dart:ui';
import 'package:flutter/material.dart';

class Faction {
  String? name;
  String? pathImage;
  int? _factionId;
  Color color;
  int score;

  Faction(
      this.name, this.pathImage, this._factionId, this.color, {this.score = 0});


  @override
  String toString() {
    return 'id: $_factionId\nname: $name';
  }

  int? get getFactionId => _factionId;

  set setFactionId(int value) {
    _factionId = value;
  }
}