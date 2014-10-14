import 'kurst/kurstsvg.dart';

import 'dart:html';
import 'dart:math';

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
SVGArc arc;
SVGLinearGradient grad;

main() {

	// HTML Div container
	container           = querySelector( '#mainDiv');

	// SVG Canvas
	scanvas             = new SVGCanvas( container );
	scanvas.id          = 'svgCanvas';
	scanvas.width       = 800;
	scanvas.height      = 600;

	// SVG Gradients
	grad                = new SVGLinearGradient();
	grad.id             = 'TestGrad';
	grad.x1             = "0%";
	grad.y1             = "50%";
	grad.x2             = "100%";
	grad.y2             = "50%";
	grad.spreadMethod   = SVGGradientSpreadMethod.PAD;
	grad.addStop( "0%" , "#00ff00" , .1 );
	grad.addStop( "100%" , "#F0000" , 1 );

	// SVG Group
	rectGroup           = new SVGGroup();

	// SVG Rectangle
	rect                = new SVGRectangle();
	rect.x              = 10;
	rect.y              = 10;
	rect.width          = 200;
	rect.height         = 200;
	rect.stroke         = '#ff0000';
	rect.strokewidth    = 2;
	rect.gradient       = grad;

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

	// SVG ARC
	arc                 = new SVGArc();
	arc.radius          = 40;
	arc.strokewidth     = 11;
	arc.startAngle      = 0;
	arc.endAngle        = 78;
	arc.x               = 300;
	arc.y               = 300;

	// Add elements to canvas
	scanvas.appendDef( grad );
	scanvas.append( tripath );
	scanvas.append( rectGroup );
	rectGroup.append( rect );
	rectGroup.append( rectb );
	scanvas.append( circle );
	scanvas.append( image );
	scanvas.append( poly );
	scanvas.append( txt );
	scanvas.append( arc );

}