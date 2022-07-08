import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../main.dart';

class AKDisplayScreen extends StatefulWidget {
  const AKDisplayScreen({Key? key}) : super(key: key);

  @override
  State<AKDisplayScreen> createState() => _AKDisplayScreenState();
}

class _AKDisplayScreenState extends State<AKDisplayScreen> {
  List<String> _sentences = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _sentences = ayatulKursiSentences;
  }

  @override
  void dispose() {
    super.dispose();
    if (_audioPlayer.state == PlayerState.playing) {
      _audioPlayer.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Ayatul Kursi",
              style: TextStyle(fontFamily: "default"),
            ),
            backgroundColor: Colors.purpleAccent,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.purpleAccent, Colors.purple]),
              ),
            )),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Tap a row to recite audio",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontFamily: "default"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _sentences.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: InkWell(
                            onTap: () async {
                              await _audioPlayer
                                  .setSource(AssetSource('audio/$index.mp3'));
                              await _audioPlayer.resume();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      _sentences[index],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 60, fontFamily: "Alvi", color: _getColor(index)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Text(
                      "$appVersion uxQuran",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Color _getColor(int index) {
    switch(index) {
      case 0:
        return Colors.deepPurple;

      case 1:
        return Colors.deepOrange;

      case 2:
        return Colors.teal;

      case 3:
        return Colors.indigo;

      case 4:
        return Colors.pink;

      case 5:
        return Colors.orange;

      case 6:
        return Colors.blue;

      default:
        return Colors.purple;
    }
  }
}
