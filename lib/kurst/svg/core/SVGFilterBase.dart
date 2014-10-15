part of kurst.svg;

class SVGFilterBase extends SVGObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	List<SvgElement> filters = new List<SvgElement>();

	//---------------------------------------------------------------------------------------------------------

	SVGFilterBase()
	{
		initElement( 'filter');
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void appendFilter( SvgElement SVGFilterPrimitive )
	{
		if ( ! containsFilter( SVGFilterPrimitive ))
		{
			filters.add( SVGFilterPrimitive );
			element.append( SVGFilterPrimitive );
		}
	}
	/**
	 *
	 */
	void removeFilter( SvgElement SVGFilterPrimitive )
	{
		if ( containsFilter( SVGFilterPrimitive ))
		{
			_element.remove( SVGFilterPrimitive );

			SvgElement n ;
			int l = filters.length;

			for ( int c = 0 ; c < l ; c ++ )
			{
				n = filters[c];

				if ( n == SVGFilterPrimitive )
				{
					filters.removeAt( c );
				}

			}
		}
	}
	/**
	 *
	 */
	bool containsFilter( SvgElement SVGFilterPrimitive )
	{

		SvgElement n ;
		int l = filters.length;

		for ( int c = 0 ; c < l ; c ++ )
		{
			n = filters[c];

			if ( n == SVGFilterPrimitive )
			{
				return true;
			}

		}

		return false;
	}

}
