import '../kurst/kurstsvg.dart';

import 'dart:html';
import 'dart:math';


SVGCanvas scanvas;

main() {

	// SVG Canvas
	scanvas             = new SVGCanvas( document.body );
	scanvas.id          = 'svgCanvas';
	scanvas.width       = window.innerWidth;
	scanvas.height      = window.innerHeight;

	window.onResize.listen( (event) => onResize() );

}

void onResize()
{
	scanvas.width       = window.innerWidth;
	scanvas.height      = window.innerHeight;
}