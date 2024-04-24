import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Part1Main extends StatefulWidget {
  const Part1Main({super.key});

  @override
  State<Part1Main> createState() => _Part1MainState();
}

class _Part1MainState extends State<Part1Main> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sound player')),
        body: Column(
          children: [
            Expanded(
              child: Ink(
                color: Colors.red,
                child: InkWell(
                  onTap: () async {
                    await player.play(AssetSource(
                      'Title_Screen.wav',
                    ));
                  },
                ),
              ),
            ),
            Expanded(
              child: Ink(
                color: Colors.orange,
                child: InkWell(
                  onTap: () async {
                    await player.play(AssetSource('Level_1.wav'));
                  },
                ),
              ),
            ),
            Expanded(
              child: Ink(
                color: Colors.yellow,
                child: InkWell(
                  onTap: () async {
                    await player.play(AssetSource('Level_2.wav'));
                  },
                ),
              ),
            ),
            Expanded(
              child: Ink(
                color: Colors.green,
                child: InkWell(
                  onTap: () async {
                    await player.play(AssetSource('Level_3.wav'));
                  },
                ),
              ),
            ),
            Expanded(
              child: Ink(
                color: Colors.blue,
                child: InkWell(
                  onTap: () async {
                    await player.play(AssetSource('Ending.wav'));
                  },
                ),
              ),
            ),
            Expanded(
              child: Ink(
                color: Colors.purple,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ],
        ));
  }
}
