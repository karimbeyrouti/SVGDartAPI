part of kurst.svg;

class SVGPathCommand {

	String code;
	List<num> params;
	bool isRelative = false;

	SVGPathCommand( this.code , [ this.params , this.isRelative = false ] )
	{
	}
}
