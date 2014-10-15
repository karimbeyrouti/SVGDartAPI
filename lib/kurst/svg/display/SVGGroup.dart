part of kurst.svg;

class SVGGroup extends SVGDisplayObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	num _width;
	num _height;

	//---------------------------------------------------------------------------------------------------------

	SVGGroup()
	{
		initElement( 'g');
	}

	//---------------------------------------------------------------------------------------------------------
	/**
	 *
	 * @param d3Object
	 */
	void append ( SVGDisplayObjectBase obj )
	{
		if ( ! isChild( obj ))
		{
			children.add( obj );
			obj.parentSVGObject = this;
			_element.append( obj.element );
		}
		else
		{
			_element.append( obj.element ); // move to front
		}

	}
}
