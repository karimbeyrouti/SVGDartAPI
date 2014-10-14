part of kurst.svg;

class SVGCanvas extends SVGDisplayObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	Element container;
	SvgElement svg;
	SvgElement defs;

	//---------------------------------------------------------------------------------------------------------

	SVGCanvas( Element this.container )
	{
		initElement( 'svg');

		svg     = _element;
		defs    = createSVGElement( 'svg:defs' );

		container.append( svg );
		container.append( defs );

	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 * @param d3Object
	 */
	void append ( SVGDisplayObjectBase obj )
	{
		if ( ! isChild( obj ) )
		{
			children.add( obj );
			obj.parentSVGObject = this;
			svg.append( obj.element );
		}
		else
		{
			_element.append( obj.element ); // move to front
		}
	}
	/**
	 *
	 * @param d3Object
	 */
	void appendDef ( SVGObjectBase obj )
	{
		defs.append( obj.element );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	num get alpha
	{
		return  num.parse( this.svg.getAttribute( 'fill-opacity' ) );
	}
	set alpha ( num val )
	{
		svg.setAttribute( 'fill-opacity' , val.toString() );
	}
	/**
	 *
	 */
	num get width
	{
		return  num.parse( this.svg.getAttribute( 'width' ) );
	}
	set width ( num val )
	{
		svg.setAttribute( 'width' , val.toString() );
	}
	/**
	 *
	 */
	num get height
	{
		return  num.parse( this.svg.getAttribute( 'height' ) );
	}
	set height ( num val )
	{
		svg.setAttribute( 'height' , val.toString() );
	}


}
