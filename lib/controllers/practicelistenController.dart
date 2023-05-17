import 'package:flutter/material.dart';
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
  String? latestFile;

  Future record() async {
    if (!isRecorderReady) {
      return;
    }

    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) {
      return;
    }

    final path = await recorder.stopRecorder();
    latestFile = path!;
  }

  Future startStopRecord() async {
    widget.model.setIsRecording();
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
    await audioPlayer.play(latestFile!, isLocal: true);
  }

  void setIndex(int index) {
    setState(() {
      widget.model.setIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Practicelisten(
        model: widget.model,
        setIndex: setIndex,
        playLatestFile: playLatestFile,
        record: startStopRecord);
  }
}
