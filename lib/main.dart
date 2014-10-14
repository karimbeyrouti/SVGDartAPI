import 'kurst/kurstsvg.dart';

import 'dart:html';

Element container;
SVGCanvas scanvas;
SVGRectangle rect;
SVGRectangle rectb;
SVGCircle circle;

main() {

	container           = querySelector( '#mainDiv');

	scanvas             = new SVGCanvas( container );
	scanvas.id          = 66;
	scanvas.width       = 800;
	scanvas.height      = 600;

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

	// Add elements to canvas
	scanvas.append( rect );
	scanvas.append( rectb );
	scanvas.append( circle );

}