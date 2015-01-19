import '../kurst/kurstsvg.dart';
import '../kurst/kurstmedia.dart';

import 'dart:html';
import 'dart:math';


SVGCanvas scanvas;
SVGRectangle backgroundRect;
UserMediaManager userMediaManager;
AudioContextManager audioContextManager ;
List<SVGRectangle> rectangles  = new List<SVGRectangle>();

Boolean rafEnabled = false;
int numBars = 256;
num magnitude;

main()
{

    userMediaManager  = new UserMediaManager();
    userMediaManager.getMicrophoneStream();
    userMediaManager.mediaEventStream.listen( (String message) => onMicrophoneInitialized(message) );

	scanvas             = new SVGCanvas( document.body );
	scanvas.id          = 'svgCanvas';
	scanvas.width       = window.innerWidth;
	scanvas.height      = window.innerHeight;

    backgroundRect      = new SVGRectangle();
    backgroundRect.fill( '#000000' );

    scanvas.append( backgroundRect );
	window.onResize.listen( (event) => onResize() );

    for ( int c = 0 ; c < numBars ; c ++ )
    {
        SVGRectangle rect = new SVGRectangle();
        rect.fill( '#ffffff' );
        rect.width  =  ( window.innerWidth - numBars ) / numBars;
        rect.height = 10;
        rect.x      = ( rect.width + 1 ) * c ;

        scanvas.append( rect );
        rectangles.add( rect );


    }

    onResize();

}

void startAnimation() {
    if (!rafEnabled) {
        window.requestAnimationFrame(update);
        rafEnabled = true;
    }
}

void update(num time) {

    audioContextManager.updateFrequencyData();

    for (int i = 0; i < numBars; ++i)
    {
        magnitude 		    = audioContextManager.getBin( i , numBars , true );
        SVGRectangle rect   = rectangles[ i ];

        rect.height         =  ( window.innerHeight) * magnitude;
        rect.y              = ( backgroundRect.height / 2 ) - ( rect.height / 2 );

    }

    window.requestAnimationFrame(update);
}

void onMicrophoneInitialized( String message )
{
    audioContextManager = new AudioContextManager();
    audioContextManager.createInputFromStream( userMediaManager.audioStream );
    audioContextManager.createAnalyser( 2048 );

    startAnimation();
}

void onResize()
{

    for ( int c = 0 ; c < rectangles.length ; c ++ )
    {
        SVGRectangle rect = rectangles[c];
        rect.width  =  ( window.innerWidth) / numBars;
        rect.x      = ( rect.width + 1 ) * c ;
    }

	scanvas.width         = window.innerWidth;
	scanvas.height        = window.innerHeight;

    backgroundRect.x      = 0;
    backgroundRect.y      = 0;
    backgroundRect.width  = scanvas.width;
    backgroundRect.height = scanvas.height;
}