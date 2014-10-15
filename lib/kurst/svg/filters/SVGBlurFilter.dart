part of kurst.svg;

class SVGBlurFilter extends SVGFilterBase
{

	//---------------------------------------------------------------------------------------------------------

	FEGaussianBlurElement feGaussianBlur;
	num _blurX = 1;
	num _blurY = 1;

	//---------------------------------------------------------------------------------------------------------

	SVGBlurFilter()
	{
		feGaussianBlur = createSVGElement( 'feGaussianBlur' );
		feGaussianBlur.setStdDeviation( this._blurX , this._blurY );
		appendFilter( feGaussianBlur );

	}

	//---------------------------------------------------------------------------------------------------------

	/**
	 *
	 */
	num get blurX => _blurX;
	set blurX ( num val )
	{
		_blurX = val;
		feGaussianBlur.setStdDeviation( _blurX , _blurY );
	}
	/**
	 *
	 */
	num get blurY  => _blurY;
	set blurY ( num val )
	{
		_blurY = val;
		feGaussianBlur.setStdDeviation( _blurX , _blurY );
	}


}
