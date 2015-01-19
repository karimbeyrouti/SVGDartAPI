part of kurst.media;

class AudioContextManager {

  //--------------------------------------------------------------------------------------------------------------

  static const String onAudioStreamInitialized = 'onAudioStreamInitialized';
  StreamController _mediaEventStreamController = new StreamController.broadcast();

  //--------------------------------------------------------------------------------------------------------------

  AudioContext audioContext = new AudioContext();
  MediaStreamAudioSourceNode audioInput;
  GainNode inputPoint;
  AnalyserNode analyserNode;

  //--------------------------------------------------------------------------------------------------------------

  num multiplier;
  num offset;
  num mag;
  Uint8List freqByteData;

  //--------------------------------------------------------------------------------------------------------------

  AudioContextManager()
  {
    inputPoint = audioContext.createGain();
  }

  /**
   *
   * @param stream
   */
  MediaStreamAudioSourceNode createInputFromStream( MediaStream stream )
  {
    audioInput = audioContext.createMediaStreamSource( stream );
    audioInput.connectNode( this.inputPoint );
    return audioInput;
  }
  /**
   *
   * @param fftSize
   * @returns {AnalyserNode}
   */
  AnalyserNode createAnalyser( [ int fftSize = 2048 ] )
  {
    analyserNode           = audioContext.createAnalyser();
    analyserNode.fftSize   = fftSize;
    freqByteData           = new Uint8List(this.analyserNode.frequencyBinCount);
    inputPoint.connectNode( analyserNode );

    return analyserNode;
  }
  /**
   * Update frequency data
   */
  void updateFrequencyData()
  {
    analyserNode.getByteFrequencyData( freqByteData );
  }
  /**
   *
   * @param bin - FFT bin
   * @param numBars - number of bins
   * @param groupAverage - Average bin group
   * @returns {number}
   */
  num getBin([ int bin , int numBars ,  bool groupAverage = true ] )
  {
    multiplier = analyserNode.frequencyBinCount / numBars;
    offset     = ( bin * this.multiplier ).floor();
    mag        = 0;


    if ( groupAverage  )
    {
      for (num j = 0; j< multiplier; j++)
      {
        mag += freqByteData[this.offset + j];
      }
      mag = ( mag / multiplier );
    }
    else
    {
      mag += this.freqByteData[offset];
    }

    return mag / 255;

  }

  /**
   *
   */
  Stream get mediaEventStream => _mediaEventStreamController.stream;
}