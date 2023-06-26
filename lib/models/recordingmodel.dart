class RecordingModel {
  int _listenIndex = 0;

  int get listenIndex => _listenIndex;

  void setIndex(int index) {
    _listenIndex = index;
  }

  bool _isRecording = false;

  bool get isRecording => _isRecording;

  void setIsRecording() {
    _isRecording ? _isRecording = false : _isRecording = true;
  }

  String _latestFile = '';

  String get latestFile => _latestFile;

  void setLatestFile(String path){
    _latestFile = path;
  }
}