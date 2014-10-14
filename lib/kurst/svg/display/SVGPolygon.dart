part of kurst.svg;

class SVGPolygon extends SVGDisplayObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	List<kurstgeom.Point> points = new List<kurstgeom.Point>();

	//---------------------------------------------------------------------------------------------------------

	SVGPolygon()
	{
		initElement( 'polygon' );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void addPoint( num x , num y )
	{
		points.add( new kurstgeom.Point( x , y ));
		updatePoly();
	}
	/**
	 *
	 */
	void updatePoly ()
	{
		String pString  = '';
		int l = points.length;
		kurstgeom.Point p;
		num xp;
		num yp;

		for ( int c = 0 ; c < l ; c ++ )
		{
			p = points[c];

			xp = p.x;
			yp = p.y;

			pString += xp.toString() + ',' + yp.toString() + ' ';
		}

		_element.setAttribute( 'points' , pString );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	num get width
	{
		return num.parse( _element.getAttribute( 'width' ) );
	}
	void set width( num val )
	{
		_element.setAttribute( 'width' , val.toString() );
	}
	/**
	 *
	 */
	num get height
	{
		return num.parse( _element.getAttribute( 'height' ) );
	}
	void set height( num val )
	{
		_element.setAttribute( 'height' , val.toString() );
	}

}
