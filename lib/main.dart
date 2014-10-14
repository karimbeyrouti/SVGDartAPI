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
SVGPolygon poly;
SVGText txt;

main() {

	// HTML Div container
	container           = querySelector( '#mainDiv');

	// SVG Canvas
	scanvas             = new SVGCanvas( container );
	scanvas.id          = 66;
	scanvas.width       = 800;
	scanvas.height      = 600;

	// SVG Group
	rectGroup           = new SVGGroup();

	// SVG Rectangle
	rect                = new SVGRectangle();
	rect.x              = 10;
	rect.y              = 10;
	rect.width          = 200;
	rect.height         = 200;
	rect.fillOpacity    = .5;
	rect.stroke         = '#ff0000';
	rect.strokewidth    = 2;
	rect.fill( '#00ff00' );

	// SVG Rounded Rectangle
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

	// SVG Circle
	circle              = new SVGCircle();
	circle.r            = 20;
	circle.x            = 100;
	circle.y            = 100;
	circle.fill( '#0000ff');

	// SVG Image
	image               = new SVGImage();
	image.src           = 'assets/apps_icon.png';
	image.x             = 300;
	image.y             = 300;
	image.width         = 22;
	image.height        = 23;

	// SVG Path
	tripath                = new SVGPath();
	tripath.addDrawCommand( SVGPath.moveto , [75 , 0] );
	tripath.addDrawCommand( SVGPath.lineto , [75 , 200] );
	tripath.addDrawCommand( SVGPath.lineto , [255 , 200] );
	tripath.addDrawCommand( SVGPath.close );
	tripath.fill( '#ff0000');

	// SVG Polygon
	poly                = new SVGPolygon();
	poly.x              = 100;
	poly.y              = 100;
	poly.addPoint( 5 , 30 );
	poly.addPoint( 15 , 10 );
	poly.addPoint( 25 , 30 );
	poly.fill( '#00ff00' );
	poly.stroke = '#000000';

	// SVG Text
	txt                 = new SVGText();
	txt.y               = 300;
	txt.text            = 'Hello SVG';
	txt.font            = 'Arial';
	txt.color           = '#000000';


	// Add elements to canvas
	scanvas.append( tripath );
	scanvas.append( rectGroup );
	rectGroup.append( rect );
	rectGroup.append( rectb );
	scanvas.append( circle );
	scanvas.append( image );
	scanvas.append( poly );
	scanvas.append( txt );

}