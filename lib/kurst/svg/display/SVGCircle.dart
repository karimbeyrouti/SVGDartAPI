part of kurst.svg;

class SVGCircle extends SVGDisplayObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	num _width;
	num _height;

	//---------------------------------------------------------------------------------------------------------

	SVGCircle()
	{
		initElement( 'circle');
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	num get r
	{
		num.parse( _element.getAttribute( 'r' ) );
	}
	set r ( num val )
	{
		_element.setAttribute( 'r' , val.toString() );
	}
	/**
	 *
	 */
	num get width
	{
		return num.parse( _element.getAttribute( 'width' ) );
	}
	set width ( num val )
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
	set height ( num val )
	{
		_element.setAttribute( 'height' , val.toString() );
	}
	/**
	 *
	 */
	num get cy
	{
		num.parse( _element.getAttribute( 'cy' ) );
	}
	set cy ( num val )
	{
		_element.setAttribute( 'cy' , val.toString() );
	}
	/**
	 *
	 */
	num get cx
	{
		num.parse( _element.getAttribute( 'cy' ) );
	}
	set cx ( num val )
	{
		_element.setAttribute( 'cy' , val.toString() );
	}
}
