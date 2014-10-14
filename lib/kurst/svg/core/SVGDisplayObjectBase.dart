part of kurst.svg;

class SVGDisplayObjectBase extends SVGObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	SVGDisplayObjectBase parentSVGObject;
	List<SVGDisplayObjectBase> children;
	kurstgeom.Point registration;

	//---------------------------------------------------------------------------------------------------------

	num _x = 0;
	num _y = 0;
	num _rotation = 0;

	//---------------------------------------------------------------------------------------------------------

	SVGDisplayObjectBase( )
	{
		children = new List<SVGDisplayObjectBase>();
		registration = new kurstgeom.Point( );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void updateTransform( )
	{
		num _regx = registration.x;
		num _regy = registration.y;

		_element.setAttribute( "transform" , "translate( $_x ,$_y ) rotate( $_rotation ,$_regx , $_regy )" );
	}
	/**
	 *
	 */
	void draw( )
	{

	}
	/**
	 *
	 * @param colour
	 */
	void fill ( String colour )
	{
		_element.setAttribute( 'fill' , colour );
	}
	/**
	 *
	 */
	void remove ( )
	{

		if ( parentSVGObject == null ) return;

		if ( _element.parentNode != null )
		{
			SVGObjectBase n;
			num l = parentSVGObject.children.length;

			for ( num c = 0 ; c < l ; c ++ )
			{
				n = parentSVGObject.children[c];

				print ( n );
				if ( n == this )
				{
					parentSVGObject.children.removeAt( c );
					//console.log( 'remove' , c , this.parentSVGObject.children , this.parentSVGObject.children.length );
				}
			}

			parentSVGObject = null;
			_element.remove();

		}
	}
	/**
	 *
	 * @param obj
	 * @returns {boolean}
	 */
	bool isChild( SVGObjectBase obj )
	{
		if ( parentSVGObject == null ) return false;

		num l = parentSVGObject.children.length;
		SVGObjectBase o;
		for ( num c = 0 ; c < l ; c ++ )
		{
			o = children[c];

			if ( o == obj )
			{
				return true;
			}
		}

		return false;
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	String get color
	{
		return _element.getAttribute( 'fill' );
	}
	void set color( String v )
	{
		this.fill( val );
	}
	/**
	 *
	 */
	Node get parentNode
	{
		return _element.parentNode;
	}
	/**
	 *
	 */
	num get fillOpacity
	{
		return num.parse(_element.getAttribute( 'fill-opacity' ) );
	}
	void set fillOpacity( num v )
	{
		_element.setAttribute( 'fill-opacity' ,  v.toString() );
	}
	/**
	 *
	 */
	num get strokeOpacity
	{
		return num.parse(_element.getAttribute( 'stroke-opacity' ) );
	}
	void set strokeOpacity( num v )
	{
		_element.setAttribute( 'stroke-opacity' , v.toString() );
	}
	/**
	 *
	 */
	num get strokewidth
	{
		return num.parse(_element.getAttribute( 'stroke-width' ) );
	}
	void set strokewidth( num v )
	{
		_element.setAttribute( 'stroke-width' , v.toString() );
	}
	/**
	 *
	 */
	String get stroke
	{
		return _element.getAttribute( 'stroke' );
	}
	void set stroke( String v )
	{
		_element.setAttribute( 'stroke' , v );
	}
	/**
	 *
	 */
	num get x => _x;
	void set x( num v )
	{
		_x = v;
		updateTransform();
	}
	/**
	 *
	 */
	num get y => _y;
	void set y( num v )
	{
		_y = v;
		updateTransform();
	}
	/**
	 *
	 */
	num get rotation => _rotation;
	void set rotation( num v )
	{
		_rotation = v;
		updateTransform();
	}
	/**
	 *
	 */
	num get width
	{
		return _element.getBoundingClientRect().width;
	}
	/**
	 *
	 */
	num get height
	{
		return _element.getBoundingClientRect().height;
	}

}