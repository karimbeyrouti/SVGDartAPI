
library kurst.svg;

import 'dart:html';
import 'dart:math' hide Point, Rectangle;
import 'dart:async';// show StreamController;
import 'dart:svg';
import 'geom.dart' as kurstgeom;

part "svg/core/SVGObjectBase.dart";
part "svg/core/SVGDisplayObjectBase.dart";
part "svg/display/SVGCanvas.dart";
part "svg/display/SVGRectangle.dart";
part "svg/display/SVGCircle.dart";
part "svg/display/SVGGroup.dart";
part "svg/display/SVGImage.dart";
part "svg/data/SVGPathCommandDef.dart";
part "svg/data/SVGPathCommand.dart";
part "svg/display/SVGPath.dart";
part "svg/display/SVGPolygon.dart";
part "svg/display/SVGText.dart";
part "svg/display/SVGArc.dart";
part "svg/core/SVGGradientBase.dart";
part "svg/gradients/SVGGradientStop.dart";
part "svg/gradients/SVGGradientSpreadMethod.dart";
part "svg/gradients/SVGLinearGradient.dart";
part "svg/core/SVGFilterBase.dart";
part "svg/filters/SVGDropShadowFilter.dart";
part "svg/filters/SVGBlurFilter.dart";
part "svg/loader/SVGLoader.dart";

