part of kurst.svg;

class SVGLoader
{

	//---------------------------------------------------------------------------------------------------------

	StreamController _loadStreamController = new StreamController.broadcast();
	SVGGroup _element;
	List<SVGDisplayObjectBase> _children = new List<SVGDisplayObjectBase>();
	Future _request;

	//---------------------------------------------------------------------------------------------------------

	SVGLoader()
	{
		_element = new SVGGroup();
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void load( String uri )
	{
		_request = HttpRequest.getString( uri ).then( onDataLoaded );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 * @param htmlElement
	 */
	void parseSVGHtmlElement( NodeList nodeList , [ SVGGroup parentGroup ] )
	{
		SVGDisplayObjectBase svgObject;
		SVGGroup parent = ( parentGroup == null ) ? this._element : parentGroup;

		bool isNestedGroup = ! ( parentGroup == null );
		bool addToElements = false;
		int length = nodeList.length;
		Node node;

		for(int c = 0; c < length ; c++)
		{
			node = nodeList[ c ].clone( true );
			addToElements = false;

			switch ( node.nodeName )
			{
				case 'g':
					svgObject = new SVGGroup();
					if ( node.childNodes.length > 0 )
						parseSVGHtmlElement( node.childNodes , svgObject );
					svgObject.element = node;
					parent.append( svgObject );
					addToElements = !isNestedGroup;
					break;

				case 'rect':
					svgObject = new SVGRectangle();
					svgObject.element = node;
					parent.append( svgObject );
					addToElements = true;
					break;

				case 'circle':
					svgObject = new SVGCircle();
					svgObject.element = node;
					parent.append( svgObject );
					addToElements = true;
					break;

				case 'polygon':
					svgObject = new SVGPolygon();
					svgObject.element = node;
					parent.append( svgObject );
					addToElements = true;
					break;

				case 'path':
					svgObject = new SVGPath();
					svgObject.element = node;
					parent.append( svgObject );
					addToElements = true;
					break;

				case 'text':
					svgObject = new SVGText();
					svgObject.element = node;
					parent.append( svgObject );
					addToElements = true;
					break;

				case '#text':// Ignore #text nodes
					addToElements = false;
					break;

				default :// Gradients / Animations / Definitions / ... etc;
					addToElements = false;
					parent.element.append( node );
					break;

			}

			if ( addToElements && ! isNestedGroup )
			{
				_children.add( svgObject );
			}
		}
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void onDataLoaded(String responseText)
	{
		DomParser parser = new DomParser();
		XmlDocument XMLDoc = parser.parseFromString( responseText  , "text/xml" );
		parseSVGHtmlElement( XMLDoc.documentElement.childNodes );
		_loadStreamController.add( 'onSVGLoaded');
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	Stream get loadStream => _loadStreamController.stream;
	/**
	 *
	 */
	SVGGroup get element => _element;
	/**
	 *
	 */
	List<SVGDisplayObjectBase> get children => _children;

}
