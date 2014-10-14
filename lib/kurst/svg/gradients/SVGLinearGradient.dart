part of kurst.svg;

class SVGLinearGradient extends SVGGradientBase
{

	//---------------------------------------------------------------------------------------------------------

	SVGLinearGradient()
	{
		initElement( 'svg:linearGradient' );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 * @param val
	 */
	set x1 ( String val )
	{
		_element.setAttribute( 'x1' , val );
	}
	String get x1
	{
		return _element.getAttribute( 'x1' );
	}
	/**
	 *
	 * @param val
	 */
	set y1 ( String val )
	{
		_element.setAttribute( 'y1' , val );
	}
	String get y1
	{
		return _element.getAttribute( 'y1' );
	}
	/**
	 *
	 * @param val
	 */
	set x2 ( String val )
	{
		_element.setAttribute( 'x2' , val );
	}
	String get x2
	{
		return _element.getAttribute( 'x2' );
	}
	/**
	 *
	 * @param val
	 */
	set y2 ( String val )
	{
		_element.setAttribute( 'y2' , val );
	}
	String get y2
	{
		return _element.getAttribute( 'y2' );
	}
}
