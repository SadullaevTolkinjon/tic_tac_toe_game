import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'player.dart';

class Tictac extends StatefulWidget {
  @override
  State<Tictac> createState() => _TictacState();
}

class _TictacState extends State<Tictac> {
  int sanoq = 0;
  int durrang = 0;
  bool togrimi = true;
  var playerfirst = 0;
  var playersecond = 0;
  List<Player> genereatedlist = List.generate(
    9,
    (index) => Player("O", "X", "", soncha: 0),
  );

  List ekran = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My tic tac game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Gamer1  $playerfirst",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Gamer2 $playersecond",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold))
                  ],
                ),
              )),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 200,
                    width: 200,
                    color: Color(0XFF7472FA),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "${ekran[index]}",
                            style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFFEBEBEB)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _buttontap(index);
                  },
                );
              },
              itemCount: 9,
            ),
            flex: 5,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _qaytaboshlash();
                      },
                      child: Text("Qayta boshlash"),
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  _qaytaboshlash() {
    setState(() {
      for (var i = 0; i < 9; i += 1) {
        ekran[i] = "";
      }
      durrang = 0;
    });
  }

  _buttontap(index) {
    sanoq += 1;
    setState(
      () {
        if (sanoq == 1 && ekran[index] == "") {
          ekran[index] = genereatedlist[index].x;
          durrang += 1;
        } else if (sanoq == 2 && ekran[index] == "") {
          ekran[index] = genereatedlist[index].o;
          durrang += 1;
        }
        if (sanoq >= 2) {
          sanoq = 0;
        }
      
        galaba();
      },
    );
  }

  galaba() {
    if (ekran[0] == ekran[1] && ekran[0] == ekran[2] && ekran[0] != "") {
      _showWinDialog(ekran[0]);
      durrang = 0;
    } else if (ekran[3] == ekran[4] && ekran[3] == ekran[5] && ekran[3] != "") {
      _showWinDialog(ekran[3]);
      durrang = 0;
    } else if (ekran[6] == ekran[7] && ekran[6] == ekran[8] && ekran[6] != "") {
      _showWinDialog(ekran[6]);
      durrang = 0;
    } else if (ekran[0] == ekran[3] && ekran[0] == ekran[6] && ekran[0] != "") {
      _showWinDialog(ekran[0]);
      durrang = 0;
    } else if (ekran[1] == ekran[4] && ekran[1] == ekran[7] && ekran[1] != "") {
      _showWinDialog(ekran[1]);
      durrang = 0;
    } else if (ekran[2] == ekran[5] && ekran[2] == ekran[8] && ekran[2] != "") {
      _showWinDialog(ekran[2]);
      durrang = 0;
    } else if (ekran[0] == ekran[4] && ekran[0] == ekran[8] && ekran[0] != "") {
      _showWinDialog(ekran[0]);
      durrang = 0;
    } else if (ekran[2] == ekran[4] && ekran[2] == ekran[6] && ekran[2] != "") {
      _showWinDialog(ekran[2]);
      durrang = 0;
    } else if (durrang == 9) {
      _durrangDialog();
    }
  }

  _showWinDialog(String galaba) {
    setState(() {
      if (galaba == "X") {
        playerfirst += 1;
      } else if (galaba == "O") {
        playersecond += 1;
      }
    });
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0XFF24348E),
          title: Text(
            "${galaba} G'alaba qildi!!!",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Go back"))
          ],
        );
      },
    );
  }

  _durrangDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0XFF24348E),
          title: Text(
            "Durrang Bratan!!!",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Go back"))
          ],
        );
      },
    );
  }
}
