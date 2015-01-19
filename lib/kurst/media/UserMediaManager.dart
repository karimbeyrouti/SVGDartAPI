part of kurst.media;

class UserMediaManager {

  //--------------------------------------------------------------------------------------------------------------

  static const String onAudioStreamInitialized = 'onAudioStreamInitialized';
  StreamController _mediaEventStreamController = new StreamController.broadcast();
  MediaStream _audioStream;

  //--------------------------------------------------------------------------------------------------------------

  UserMediaManager()
  {

  }
  /**
   *
   */
  void getMicrophoneStream(  )
  {
    Future userMediaFuture = window.navigator.getUserMedia(audio: true, video:false);
    userMediaFuture.then( audioStreamInitialized );
  }
  /**
   *
   */
  void audioStreamInitialized( MediaStream stream )
  {
    _audioStream = stream;
    _mediaEventStreamController.add( UserMediaManager.onAudioStreamInitialized );
  }
  /**
   *
   */
  MediaStream get audioStream => _audioStream;
  /**
   *
   */
  Stream get mediaEventStream => _mediaEventStreamController.stream;
}