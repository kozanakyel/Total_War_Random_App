import 'package:flutter/material.dart';

import '../../constants.dart';
import '../faction_create/faction.dart';

class ListFactions extends StatefulWidget {
  const ListFactions({
    Key? key,
  }) : super(key: key);

  @override
  State<ListFactions> createState() => _ListFactionsState();
}

class _ListFactionsState extends State<ListFactions> {
  late final List<Faction> factions;
  int startIndex = 1;

  @override
  void initState() {
    super.initState();
    factions = <Faction>[];
    factions.addAll(FactionData.factionNamesImages()
        .entries
        .map((entry) => Faction(
            entry.key, entry.value, startIndex++, FactionData.randomColor()))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 200,
      diameterRatio: 3,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          if (index < 0 || index > 27) {
            return null;
          }
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: FactionData.randomColor(), width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            color: factions[index].color,
            child: ListTile(
              title: Column(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '${factions[index].name}\n\tid: ${factions[index].getFactionId}',
                    style: const TextStyle(color:Colors.black)),
                  )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/${factions[index].pathImage}',
                        width: 75,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
