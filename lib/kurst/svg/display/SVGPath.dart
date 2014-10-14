part of kurst.svg;

class SVGPath extends SVGDisplayObjectBase
{

	//---------------------------------------------------------------------------------------------------------

	static SVGPathCommandDef moveto 		    = new SVGPathCommandDef( 'M' , 'Move To' );
	static SVGPathCommandDef lineto 		    = new SVGPathCommandDef( 'L' , 'Line To' );
	static SVGPathCommandDef hlineto		    = new SVGPathCommandDef( 'H' , 'Horizontal Lineto' );
	static SVGPathCommandDef vlineto 		    = new SVGPathCommandDef( 'V' , 'Vertical Lineto' );
	static SVGPathCommandDef curveto 		    = new SVGPathCommandDef( 'C' , 'Curve To' );
	static SVGPathCommandDef smoothcurveto      = new SVGPathCommandDef( 'S' , 'Smooth Curveto' );
	static SVGPathCommandDef quadratic 		    = new SVGPathCommandDef( 'Q' , 'Quadratic Bézier Curve' );
	static SVGPathCommandDef smoothquadratic    = new SVGPathCommandDef( 'T' , 'Smooth Quadratic Bézier Curve' );
	static SVGPathCommandDef arc 			    = new SVGPathCommandDef( 'A' , 'Elliptical Arc' );
	static SVGPathCommandDef close 			    = new SVGPathCommandDef( 'Z' , 'Close Path' );

	//---------------------------------------------------------------------------------------------------------

	List<SVGPathCommand> commands = new List<SVGPathCommand>();
	bool relative = false;
	bool drawOnCommand = true;

	//---------------------------------------------------------------------------------------------------------

	SVGPath()
	{
		initElement( 'path' );
	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	void addDrawCommand( SVGPathCommandDef command , [ List<num> parameters ] )
	{
		if ( parameters != null )
		{
			commands.add( new SVGPathCommand( command.code , parameters ));
		}
		else
		{
			commands.add( new SVGPathCommand( command.code ));
		}

		if ( drawOnCommand )
		{
			draw();
		}
	}
	/**
	 *
	 */
	void clear()
	{
		commands.length = 0;
		draw();
	}
	/**
	 *
	 */
	void draw()
	{
		if ( this.commands.length == 0 )
		{
			_element.attributes.remove( 'd' ); // not sure that is the removeAttribute command
		}
		else
		{

			String str = '';
			int l = commands.length;
			SVGPathCommand cmd;
			String code;
			List<num> cmdP;
			int cmdL;

			for (int c = 0 ; c < l ; c++)
			{
				cmd = commands[c];
				code = cmd.code;
				code = ( relative ) ? code.toLowerCase() : code.toUpperCase();
				str += ( c == 0 ) ? code : ' ' + code;
				cmdP = cmd.params;

				if (cmdP != null)
				{
					cmdL = cmdP.length;
					for (int d = 0 ; d < cmdL ; d++)
					{
						str += ' ' + cmdP[d].toString();
					}
				}
			}
			_element.setAttribute('d', str);
		}
	}
}
