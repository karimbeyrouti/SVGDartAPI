import 'kurst/kurstsvg.dart';

import 'dart:html';

Element container;
SVGCanvas scanvas;
SVGRectangle rect;
SVGRectangle rectb;
SVGGroup rectGroup;
SVGCircle circle;
SVGImage image;
SVGPath tripath ;

main() {

	container           = querySelector( '#mainDiv');

	scanvas             = new SVGCanvas( container );
	scanvas.id          = 66;
	scanvas.width       = 800;
	scanvas.height      = 600;

	// Group
	rectGroup           = new SVGGroup();

	// Rectangle
	rect                = new SVGRectangle();
	rect.x              = 10;
	rect.y              = 10;
	rect.width          = 200;
	rect.height         = 200;
	rect.fillOpacity    = .5;
	rect.stroke         = '#ff0000';
	rect.strokewidth    = 2;
	rect.fill( '#00ff00' );

	// Rounded Rectangle
	rectb               = new SVGRectangle();
	rectb.x             = 30;
	rectb.y             = 30;
	rectb.width         = 200;
	rectb.height        = 200;
	rectb.fillOpacity   = .5;
	rectb.stroke        = '#ff0000';
	rectb.strokewidth   = 2;
	rectb.rx            = 10;
	rectb.ry            = 10;
	rectb.fill( '#00ff00' );
	rectb.element.onClick.listen( (event) => rectb.remove() );

	// Circle
	circle              = new SVGCircle();
	circle.r            = 20;
	circle.x            = 100;
	circle.y            = 100;
	circle.fill( '#0000ff');

	// Image
	image               = new SVGImage();
	image.src           = 'assets/apps_icon.png';
	image.x             = 300;
	image.y             = 300;
	image.width         = 22;
	image.height        = 23;

	tripath                = new SVGPath();
	tripath.addDrawCommand( SVGPath.moveto , [75 , 0] );
	tripath.addDrawCommand( SVGPath.lineto , [75 , 200] );
	tripath.addDrawCommand( SVGPath.lineto , [255 , 200] );
	tripath.addDrawCommand( SVGPath.close );
	tripath.fill( '#ff0000');

	// Add elements to canvas

	scanvas.append( tripath );
	scanvas.append( rectGroup );
	rectGroup.append( rect );
	rectGroup.append( rectb );
	scanvas.append( circle );
	scanvas.append( image );

}