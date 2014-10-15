part of kurst.svg;

class SVGDropShadowFilter extends SVGFilterBase
{

	//---------------------------------------------------------------------------------------------------------

	FEBlendElement feBlend;
	FEGaussianBlurElement feBlur;
	FEOffsetElement feOffset;
	FEComponentTransferElement cte;

	//---------------------------------------------------------------------------------------------------------

	num _dy = 3;
	num _dx = 3;
	num _blur = 3;

	//---------------------------------------------------------------------------------------------------------

	SVGDropShadowFilter()
	{

		feOffset = createSVGElement( 'feOffset' );
		feOffset.setAttribute( 'dx' , _dx.toString() );
		feOffset.setAttribute( 'dy' , _dy.toString() );

		feBlur = createSVGElement( 'feGaussianBlur' );
		feBlur.setAttribute( 'in' , 'SourceAlpha');
		feBlur.setAttribute( 'stdDeviation' , _blur.toString() );

		cte = createSVGElement( 'feComponentTransfer' );

		SvgElement fa = createSVGElement( 'feFuncA' );
		fa.setAttribute( 'type' , 'linear' );
		fa.setAttribute( 'slope' , '0.65' );

		cte.append( fa );

		SvgElement mrgn 	= createSVGElement( 'feMergeNode' );
		SvgElement mrgnB 	= createSVGElement( 'feMergeNode' );
		mrgnB.setAttribute( 'in' , 'SourceGraphic' );

		SvgElement mrg 	= createSVGElement( 'feMerge' );
		mrg.append( mrgn );
		mrg.append( mrgnB );

		appendFilter( feBlur );
		appendFilter( feOffset );
		appendFilter( cte );
		appendFilter( mrg );

	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	num get dx => _dx;
	set dx ( num val )
	{
		_dx = val;
		feOffset.setAttribute( 'dx' , val.toString() );
	}
	/**
	 *
	 */
	num get dy => _dy;
	set dy ( num val )
	{
		_dy = val;
		feOffset.setAttribute( 'dy' , val.toString() );
	}
	/**
	 *
	 */
	num get blur => _blur;
	set blur ( num val )
	{
		_blur = val;
		feBlur.setAttribute( 'stdDeviation' , _blur.toString() );
	}

}
