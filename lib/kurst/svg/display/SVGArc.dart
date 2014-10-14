part of kurst.svg;

class SVGArc extends SVGPath
{
	//---------------------------------------------------------------------------------------------------------

	kurstgeom.Point _startPoint = new kurstgeom.Point();
	kurstgeom.Point _endPoint   = new kurstgeom.Point();

	num _radius                 = 10;
	num _arcSweep               = 0;
	num _startAngle             = 0;
	num _endAngle               = 359.99;

	//---------------------------------------------------------------------------------------------------------

	SVGArc()
	{
		fillOpacity     = 0;
		stroke          = '#000000';
		strokewidth     = 10;

		drawOnCommand   = false;
		addDrawCommand( SVGPath.moveto , [ _startPoint.x , _startPoint.y ] );
		drawOnCommand = true;
		addDrawCommand( SVGPath.arc , [ _radius , _radius , 0 , _arcSweep , 0 , _endPoint.x , _endPoint.y ] );

	}

	/**
	 *
	 * @param centerX
	 * @param centerY
	 * @param radius
	 * @param angleInDegrees
	 * @param point
	 * @returns {Point}
	 */
	kurstgeom.Point polarToCartesian ( num centerX , num centerY , num radius , num angleInDegrees , [  kurstgeom.Point point ] )
	{
		num angleInRadians = (angleInDegrees - 90) * PI / 180.0;

		if ( point != null )
		{
			point.x = centerX + (radius * cos( angleInRadians ));
			point.y = centerY + (radius * sin( angleInRadians ));

			return point;
		}

		return new Point( centerX + (radius * cos( angleInRadians )) , centerY + (radius * sin( angleInRadians )) );
	}

	void updateArc( num x , num y , num radius, num sAngle, num eAngle )
	{
		polarToCartesian( x , y , radius , eAngle , _startPoint );
		polarToCartesian( x , y , radius , sAngle , _endPoint );

		_arcSweep = eAngle - sAngle <= 180 ? 0 : 1;

		commands[0].params[0] = _startPoint.x;
		commands[0].params[1] = _startPoint.y;

		commands[1].params[0] = radius;
		commands[1].params[1] = radius;
		commands[1].params[2] = 0;
		commands[1].params[3] = _arcSweep;
		commands[1].params[4] = 0;
		commands[1].params[5] = _endPoint.x;
		commands[1].params[6] = _endPoint.y;
	}

	void draw()
	{
		updateArc( x , y , _radius , _startAngle , _endAngle );
		super.draw();
	}

	void updateTransform()
	{

		//_element.setAttribute( "transform" , "rotate(" + this.rotation + "," + (this.x + this.registration.x ) + ", " + (this.y + this.registration.y ) + ")" );

		num _regx = x + registration.x;
		num _regy = y + registration.y;

		draw();

		_element.setAttribute( "transform" , "rotate( $_rotation ,$_regx , $_regy )" );

	}

	/**
	 *
	 * @param val
	 */
	void set startAngle ( num val )
	{
		_startAngle = val;
		draw();
	}
	num get startAngle => this._startAngle;
	/**
	 *
	 * @param val
	 */
	void set endAngle ( num val )
	{
		_endAngle = val;
		draw();
	}
	num get endAngle => this._endAngle;
	/**
	 *
	 * @param val
	 */
	void set radius ( num val )
	{
		_radius = val;
		draw();
	}
	num get radius => this._radius;

}
