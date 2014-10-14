part of kurst.svg;

class SVGGradientBase extends SVGObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	List<SVGGradientStop> _stops = new List<SVGGradientStop>();

	//---------------------------------------------------------------------------------------------------------

	SVGGradientBase()
	{
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void appendStop( SVGGradientStop stop )
	{
		_element.append( stop.element );
	}
	/**
	 *
	 * @param offset
	 * @param color
	 * @param opacity
	 */
	SVGGradientStop addStop ( String offset , String color , num opacity )
	{
		_stops.add( new SVGGradientStop( this , offset , color , opacity ) );
		return _stops[ _stops.length - 1 ];
	}
	/**
	 *
	 * @param id
	 * @returns {SVGGradientStop}
	 */
	SVGGradientStop getStop ( num id )
	{
		if ( id < _stops.length )
		{
			return _stops[id];
		}
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 * @param val
	 */
	set alpha ( num val )
	{
		for ( num c = 0 ; c < _stops.length ; c++ )
		{
			_stops[c].alpha = val;
		}
	}
	/**
	 *
	 * @param val
	 */
	set spreadMethod ( String val )
	{
		_element.setAttribute( 'spreadMethod' , val );
	}
	String get spreadMethod
	{
		return _element.getAttribute( 'spreadMethod' );
	}

}
