part of kurst.svg;

class SVGText extends SVGDisplayObjectBase
{
	SVGText()
	{
		initElement( 'text' );
		_element.setAttribute( "pointer-events" , "all" );
	}

	/**
	 *
	 * @param val
	 */
	void set font ( String val )
	{
		_element.setAttribute( 'font-family' , val );
	}
	String get font
	{
		return _element.getAttribute( 'font-family' );
	}

	/**
	 *
	 * @param val
	 */
	void set fontsize ( String val )
	{
		_element.setAttribute( 'font-size' , val );
	}
	String get fontsize
	{
		return _element.getAttribute( 'font-size' );
	}

	/**
	 *
	 * @param val
	 */
	void set text ( String val )
	{
		_element.text = val;
	}
	String get text
	{
		return _element.text;
	}



}
