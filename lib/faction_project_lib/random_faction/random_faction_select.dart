import 'package:flutter/material.dart';
import 'dart:math';

import '../../constants.dart';
import '../faction_create/faction.dart';

class RandomFactionButton extends StatefulWidget {
  const RandomFactionButton({Key? key}) : super(key: key);

  @override
  State<RandomFactionButton> createState() => _RandomFactionButtonState();
}

class _RandomFactionButtonState extends State<RandomFactionButton> {
  int getNumber = 0;
  late List<int> list;
  Random rnd = Random();

  int startIndex = 0;

  late final List<Faction> factions;

  bool isLoading = false;

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

  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Image.asset(
      "assets/images/attila2.jpg",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ),
        Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {

              getNumber = RandomList().getWinList(factions)[0].getFactionId!;
              print(factions.map((e) => '${e.score} and ${e.name}'));
              print('getnumber: $getNumber, ${factions[getNumber].name}, ${factions[getNumber].getFactionId}');
              changeLoading();
              print(isLoading);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WinFactionCard(number: getNumber, getList: factions,)));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white30,
              fixedSize: const Size(200, 200),
              shape: const CircleBorder(),

            ),
            child: const Text('Go Faction!', style: TextStyle(color:Colors.yellow,fontWeight: FontWeight.bold, fontSize: 24)),
          ),
        ),
      ),
    ]
    );
  }
}

class WinFactionCard extends StatefulWidget {
  const WinFactionCard({Key? key, required this.number, required this.getList}) : super(key: key);

  final int number;
  final List<Faction> getList;

  @override
  State<WinFactionCard> createState() => _WinFactionCardState();
}

class _WinFactionCardState extends State<WinFactionCard> {

  late final int winNumber;
  late final List<Faction> getList;

  @override
  void initState() {
    super.initState();
    winNumber = widget.number;
    getList = widget.getList;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attila Total War'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: FactionData.randomColor(), width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          color: getList[0].color,
          child: Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            child: Column(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                            '${getList[0].name}',
                        style: const TextStyle(fontSize: 28, color: Colors.black, )),
                        Text(
                            'score: ${getList[0].score}',
                            style: const TextStyle(fontSize: 18, color: Colors.black, )),
                      ],
                    ),
                  )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/${getList[0].pathImage}',
                        width: 125,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 10,
                              width: MediaQuery.of(context).size.width*0.9,
                              child: const ColoredBox(
                                color: Colors.black38,
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('score: ${getList[1].name}, ${getList[1].score}',
                              style: const TextStyle(color: Colors.black,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('score: ${getList[2].name}, ${getList[1].score}',
                                style: const TextStyle(color: Colors.black, )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('score: ${getList[3].name}, ${getList[1].score}',
                                style: const TextStyle(color: Colors.black, )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('score: ${getList[4].name}, ${getList[1].score}',
                                style: const TextStyle(color: Colors.black, )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.account_balance_outlined),
        onPressed: (){
          Navigator.pop(context);
        },),
    );
  }
}


class RandomList{

  List<Faction> getWinList(List<Faction> factions){
    Random random = Random();
    int testNumber = 0;
    for(int i = 0; i < factions.length; i++){
      factions[i].score = testNumber;
    }
    while(testNumber < 1000){
      factions[random.nextInt(factions.length)].score += 1;
      testNumber++;
    }
    factions.sort((b, a) => a.score.compareTo(b.score));

    return factions;
  }

}

