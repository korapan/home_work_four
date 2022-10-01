import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _round = 0;
  List<int> _redScore = [];
  List<int> _blueScore = [];
  int _totalRedScore = 0;
  int _totalBlueScore = 0;
  bool _redWin = false;
  bool _blueWin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OLYMPIC BOXING SCORING")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              "asset/image/logo.png",
              width: 256,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 20,
                  color: Colors.black,
                  child: const Center(
                      child: Text("Women's Light (57-60kg) Semi-final",
                          style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          _buildPerson(
              iconColor: const Color.fromARGB(255, 160, 0, 0),
              imageAsset: "asset/image/ireland.png",
              nation: "IRELAND",
              name: "HARRINGTON Kellie Anne",
              isWinner: _redWin),
          _buildPerson(
              iconColor: const Color.fromARGB(255, 0, 0, 160),
              imageAsset: "asset/image/thailand.png",
              nation: "THAILAND",
              name: "SEESONDEE Sudaporn",
              isWinner: _blueWin),
          const SizedBox(
            height: 8,
          ),
          _buildRedBlueLine(),
          Expanded(
              child: Column(
                children: [
                  for (int i = 0; i < _round; ++i)
                    _buildScoreBoard(
                        round: i + 1,
                        redScore: _redScore[i],
                        blueScore: _blueScore[i]),
                  if (_round == 3) _buildTotalScoreBoard()
                ],
              )),
          _round != 3 ? _buildScoreButtons() : _buildResetButton()
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    _round = 0;
                    _redScore = [];
                    _blueScore = [];
                    _totalRedScore = 0;
                    _totalBlueScore = 0;
                    _redWin = false;
                    _blueWin = false;
                  });
                },
                child: const Icon(
                  Icons.clear,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreButtons() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _round++;
                    _redScore.add(10);
                    _blueScore.add(9);
                    _totalRedScore += 10;
                    _totalBlueScore += 9;
                    if (_round == 3) {
                      if (_totalRedScore > _totalBlueScore) {
                        _redWin = true;
                      } else {
                        _blueWin = true;
                      }
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 160, 0, 0)),
                ),
                child: const Icon(
                  Icons.person,
                  size: 30,
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _round++;
                  _redScore.add(9);
                  _blueScore.add(10);
                  _totalRedScore += 9;
                  _totalBlueScore += 10;
                  if (_round == 3) {
                    if (_totalRedScore > _totalBlueScore) {
                      _redWin = true;
                    } else {
                      _blueWin = true;
                    }
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 0, 0, 160)),
              ),
              child: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildScoreBoard({int round = 0, int redScore = 0, blueScore = 0}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Text(
            "ROUND $round",
            style: const TextStyle(fontSize: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$redScore",
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                "$blueScore",
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }

  Widget _buildTotalScoreBoard() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const Text(
            "TOTAL",
            style: TextStyle(fontSize: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$_totalRedScore",
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                "$_totalBlueScore",
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }

  Widget _buildRedBlueLine() {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 4,
              color: const Color.fromARGB(255, 160, 0, 0),
            )),
        Expanded(
            child: Container(
              height: 4,
              color: const Color.fromARGB(255, 0, 0, 160),
            ))
      ],
    );
  }

  Row _buildPerson(
      {Color iconColor = Colors.black,
        String imageAsset = "",
        String nation = "Nation",
        String name = "Harry Potter",
        bool isWinner = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.person,
          size: 72,
          color: iconColor,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    imageAsset,
                    width: 32,
                  ),
                  Text(
                    "  $nation",
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(name)
            ],
          ),
        ),
        isWinner
            ? const Icon(
          Icons.check,
          size: 40,
          color: Colors.green,
        )
            : const SizedBox.shrink()
      ],
    );
  }
}

