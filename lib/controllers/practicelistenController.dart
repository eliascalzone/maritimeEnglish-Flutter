import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttermaritime/model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:fluttermaritime/views/praticelisten.dart';
import 'package:permission_handler/permission_handler.dart';

class PracticelistenController extends StatefulWidget {
  final Model model;
  const PracticelistenController({super.key, required this.model});

  @override
  State<PracticelistenController> createState() =>
      _PracticelistenControllerState();
}

class _PracticelistenControllerState extends State<PracticelistenController> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  final audioPlayer = AudioPlayer();

  Future record() async {
    if (!isRecorderReady) {
      return;
    }

    await recorder.startRecorder(toFile: 'audio.mp4', codec: Codec.aacMP4);
  }

  Future stop() async {
    if (!isRecorderReady) {
      return;
    }

    final path = await recorder.stopRecorder();
    setState(() {
      widget.model.setLatestFile(path!);
    });
  }

  Future startStopRecord() async {
    clearPath();
    setState(() {
      widget.model.setIsRecording();
    });
    if (recorder.isRecording) {
      await stop();
    } else {
      await record();
    }
  }

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();

    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;
  }

  Future playLatestFile() async {
    await audioPlayer.play(widget.model.latestFile, isLocal: true, volume: 7);
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      "Error in getting access to the file.";
    }
  }

  void clearPath() {
    deleteFile(File(widget.model.latestFile));
    setState(() {
      widget.model.setLatestFile('');
    });
  }

  void setIndex(int index) {
    setState(() {
      widget.model.setIndex(index);
    });
  }

  final FlutterTts flutterTts = FlutterTts();

  void speakTts(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1);
    await flutterTts.speak(word);
  }

  @override
  Widget build(BuildContext context) {
    return Practicelisten(
        model: widget.model,
        setIndex: setIndex,
        playLatestFile: playLatestFile,
        record: startStopRecord,
        speakTts: speakTts,
        clearPath: clearPath);
  }
}
