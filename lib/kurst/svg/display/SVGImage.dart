part of kurst.svg;

class SVGImage extends SVGDisplayObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	SVGImage()
	{
		initElement( 'image' );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 * @param val
	 */
	void set src ( String val )
	{
		_element.setAttributeNS( 'http://www.w3.org/1999/xlink' , 'href' , val );
	}
	String get src
	{
		return _element.getAttributeNS( 'http://www.w3.org/1999/xlink' , 'href' );
	}
	/**
	 *
	 * @param val
	 */
	void set width ( num val )
	{
		this.element.setAttribute( 'width' , val.toString() );
	}
	num get width
	{
		return num.parse( this.element.getAttribute( 'width' ) );
	}
	/**
	 *
	 * @param val
	 */
	void set height ( num val )
	{
		_element.setAttribute( 'height' , val.toString());
	}
	num get height
	{
		return num.parse( _element.getAttribute( 'height' ) );
	}
	/**
	 *
	 */
	num get alpha
	{
		return num.parse( _element.getAttribute( 'opacity' ) );
	}
	void set alpha ( num val )
	{
		_element.setAttribute( 'opacity' , val.toString() );
	}
}
