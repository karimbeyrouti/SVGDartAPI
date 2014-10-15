part of kurst.svg;

class SVGGradientStop extends SVGObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	SVGGradientBase _gradient_ref;

	//---------------------------------------------------------------------------------------------------------

	SVGGradientStop( [ SVGGradientBase gradient , String offset , String color , num opacity ] )
	{
		initElement( 'svg:stop' );

		if ( gradient != null )
		{
			_gradient_ref = gradient;
			_gradient_ref.appendStop( this );
		}

		setData( offset , color , opacity );

	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 * @param offset
	 * @param color
	 * @param opacity
	 */
	void setData ( [ String offset , String color , num opacity ] )
	{
		if ( offset != null )
		{
			_element.setAttribute( 'offset' , offset );
		}

		if ( color != null )
		{
			_element.setAttribute( 'stop-color' , color );
		}

		if ( opacity != null )
		{
			_element.setAttribute( 'stop-opacity' , opacity.toString() );
		}
	}

	/**
	 *
	 * @param val
	 */
	set alpha ( num val )
	{
		_element.setAttribute( 'stop-opacity' , val.toString() );
	}
	num get alpha
	{
		return num.parse( _element.getAttribute( 'stop-opacity' ) );
	}
	/**
	 *
	 * @param val
	 */
	set color ( String val )
	{
		_element.setAttribute( 'stop-color' , val );
	}
	String get color
	{
		return _element.getAttribute( 'stop-color' );
	}
	/**
	 *
	 * @param val
	 */
	set offset ( String val )
	{
		_element.setAttribute( 'offset' , val );
	}
	String get offset
	{
		return _element.getAttribute( 'offset' );
	}

}
