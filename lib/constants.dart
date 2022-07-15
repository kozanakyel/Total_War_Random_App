import 'dart:math';

import 'package:flutter/material.dart';

class FactionData {
  static const Color hunC = Colors.amber;
  static const Color alanC = Colors.indigo;
  static const Color easternC = Colors.green;
  static const Color frankC = Colors.deepPurple;
  static const Color venedC = Colors.red;
  static const Color romaC = Colors.lime;
  static const Color sasaniC = Colors.purpleAccent;

  static Color randomColor() {
    List<Color> listC = [hunC, alanC, easternC, frankC, venedC, romaC, sasaniC];
    Random rnd = Random();
    int random = rnd.nextInt(6) + 1;
    return listC[random];
  }

  static Map<String, String> factionNamesImages() {
    Map<String, String> factions = <String, String>{};
    factions['Aksum'] = 'Aksum_flag.png';
    factions['Alamans'] = 'Alamans_flag.png';
    factions['Alans'] = 'Alans_flag.png';
    factions['Caledonians'] = 'Caledonians_flags.png';
    factions['Danes'] = 'Danes_flag.png';
    factions['Eastern Roman Empire'] = 'Eastern_roman_empire_flag.png';
    factions['Ebdanians'] = 'Ebdanians_Flag.png';
    factions['Franks'] = 'Franks_flag.png';
    factions['Garamantians'] = 'Garamantians_flag.png';
    factions['Geats'] = 'Geats_flag.png';
    factions['himyar'] = 'himyar_flag.png';
    factions['Hun'] = 'Hun_flag.png';
    factions['Jutes'] = 'Jutes_flag_clean.png';
    factions['Lakhmids'] = 'Lakhmids_flag.png';
    factions['Langobards'] = 'Langobards_flag.png';
    factions['Ostrogoths'] = 'Ostrogoths_flag.png';
    factions['Picts'] = 'Picts_Flag.png';
    factions['Sassanid Empire'] = 'Sassanid_empire_flag.png';
    factions['Saxons'] = 'Saxons_flag.png';
    factions['Suebi'] = 'Suebi_flag.png';
    factions['Tanukhids'] = 'Tanukhids_flag.png';
    factions['Anteans'] = 'TWA_anteans_flag.png';
    factions['Sclavenians'] = 'TWA_sclavenians_flag.png';
    factions['Vened'] = 'TWA_venedians_flag.png';
    factions['Vandals'] = 'Vandal_flag.png';
    factions['Visigoth'] = 'Visigoth_flag.png';
    factions['Western Rome'] = 'Western_rome_flag.png';
    factions['Ak Huns'] = 'White_Huns_flag.png';
    return factions;
  }
}
