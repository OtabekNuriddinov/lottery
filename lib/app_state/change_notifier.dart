import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AppProvider extends ChangeNotifier{

  final List<int> _numbersList = [];
  List<int> get numbersList => _numbersList;

  final List<int> _resNumbers = [];
  List<int> get resNumbers => _resNumbers;

  final AudioPlayer _audioPlayer = AudioPlayer();

  void generate(int start, int end, int limit){
    _numbersList.clear();
    Random random = Random();
    while(limit>0){
      int number = random.nextInt(end - start + 1) + start;
      _numbersList.add(number);
      limit--;
    }
    notifyListeners();
  }

  void getResult(List<int>list, int num){
    _resNumbers.clear();
    Random random = Random();
    while(num>0 && list.isNotEmpty){
      int randomIndex = random.nextInt(list.length);
      int randomNumber = list[randomIndex];
      _resNumbers.add(randomNumber);
      num--;
    }
    notifyListeners();
  }

  void playWin() async {
    try{
      await _audioPlayer.setAsset("assets/sounds/congrats.mp3");
      _audioPlayer.play();
    }
    catch(e){
      print("Error: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}