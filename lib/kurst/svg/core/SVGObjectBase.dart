part of kurst.svg;

class SVGObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	Element _element;
	String _id;

	//---------------------------------------------------------------------------------------------------------

	SVGObjectBase( ){}

	//---------------------------------------------------------------------------------------------------------

	/**
	 * @param elementName
	 */
	void initElement ( string elementName  )
	{
		_element = this.createSVGElement( elementName );
	}
	/**
	 * @param elementName
	 * @returns {Selection}
	 */
	SVGElement createSVGElement ( string elementName  ) // protected
	{
		return document.createElementNS( 'http://www.w3.org/2000/svg' , elementName );
	}

	//---------------------------------------------------------------------------------------------------------

	String get id => _id;

	void set id( String v )
	{
		_id = v;
	}

	Element get element => _element;

}
