part of kurst.geom;

class Point {

	num x = 0;
	num y = 0;

	Point( [ this.x = 0 , this.y = 0 ] )
	{
	}
	/**
	 * Adds the coordinates of another point to the coordinates of this point to
	 * create a new point.
	 *
	 * @param v The point to be added.
	 * @return The new point.
	 */
	Point add( Point v )
	{
		return new Point( x + v.x , y + v.y );
	}
	/**
	 * Creates a copy of this Point object.
	 *
	 * @return The new Point object.
	 */
	Point clone ( )
	{
		return new Point( x , y );
	}
	/**
	 * Determines whether two points are equal. Two points are equal if they have
	 * the same <i>x</i> and <i>y</i> values.
	 *
	 * @param toCompare The point to be compared.
		import 'dart:math' hide Point, Rectangle;
		import 'dart:math' as math;
	 * @return A value of <code>true</code> if the object is equal to this Point
	 *         object; <code>false</code> if it is not equal.
	 */
	bool equals(Point toCompare)
	{
		return (x == toCompare.x && y == toCompare.y);
	}
	/**
	 * Scales the line segment between(0,0) and the current point to a set
	 * length.
	 *
	 * @param thickness The scaling value. For example, if the current point is
	 *                 (0,5), and you normalize it to 1, the point returned is
	 *                  at(0,1).
	 */
	void normalize([num thickness = 1])
	{
		if (length != 0) {
			num invLength = thickness/length;
			x *= invLength;
			y *= invLength;
			return;
		}
		throw "Cannot divide by zero length.";
	}
	/**
	 * The length of the line segment from(0,0) to this point.
	 */
	num get length
	{
		return sqrt(x*x + y*y);
	}
	/**
	 * Offsets the Point object by the specified amount. The value of
	 * <code>dx</code> is added to the original value of <i>x</i> to create the
	 * new <i>x</i> value. The value of <code>dy</code> is added to the original
	 * value of <i>y</i> to create the new <i>y</i> value.
	 *
	 * @param dx The amount by which to offset the horizontal coordinate,
	 *           <i>x</i>.
	 * @param dy The amount by which to offset the vertical coordinate, <i>y</i>.
	 */
	void offset(num dx , num dy )
	{
		x += dx;
		y += dy;
	}
	/**
	 * Subtracts the coordinates of another point from the coordinates of this
	 * point to create a new point.
	 *
	 * @param v The point to be subtracted.
	 * @return The new point.
	 */
	Point subtract(Point v)
	{
		return new Point(x - v.x, y - v.y);
	}
	/**
	 * Returns a string that contains the values of the <i>x</i> and <i>y</i>
	 * coordinates. The string has the form <code>"(x=<i>x</i>,
	 * y=<i>y</i>)"</code>, so calling the <code>toString()</code> method for a
	 * point at 23,17 would return <code>"(x=23, y=17)"</code>.
	 *
	 * @return The string representation of the coordinates.
	 */
	String toString()
	{
		return "[Point] (x=$x , $y= y)";
	}
	/**
	 * Returns the distance between <code>pt1</code> and <code>pt2</code>.
	 *
	 * @param pt1 The first point.
	 * @param pt2 The second point.
	 * @return The distance between the first and second points.

	static num distance(Point pt1, Point pt2)
	{
		num dx = pt2.x - pt1.x;
		num dy = pt2.y - pt1.y;

		return sqrt(dx*dx + dy*dy);
	}
	 */
	/**
	 * Determines a point between two specified points. The parameter
	 * <code>f</code> determines where the new interpolated point is located
	 * relative to the two end points specified by parameters <code>pt1</code>
	 * and <code>pt2</code>. The closer the value of the parameter <code>f</code>
	 * is to <code>1.0</code>, the closer the interpolated point is to the first
	 * point(parameter <code>pt1</code>). The closer the value of the parameter
	 * <code>f</code> is to 0, the closer the interpolated point is to the second
	 * point(parameter <code>pt2</code>).
	 *
	 * @param pt1 The first point.
	 * @param pt2 The second point.
	 * @param f   The level of interpolation between the two points. Indicates
	 *            where the new point will be, along the line between
	 *            <code>pt1</code> and <code>pt2</code>. If <code>f</code>=1,
	 *            <code>pt1</code> is returned; if <code>f</code>=0,
	 *            <code>pt2</code> is returned.
	 * @return The new, interpolated point.
	 */
	static Point interpolate(Point pt1, Point pt2, num f)
	{
		return new Point(pt2.x + (pt1.x - pt2.x)*f, pt2.y + (pt1.y - pt2.y)*f);
	}
	/**
	 * Converts a pair of polar coordinates to a Cartesian point coordinate.
	 *
	 * @param len   The length coordinate of the polar pair.
	 * @param angle The angle, in radians, of the polar pair.
	 * @return The Cartesian point.
	 */
	static Point polar(num len, num angle)
	{
		return new Point(len*cos(angle), len*sin(angle));
	}
	/**
	 * Calcule distance between this point and another
	 * @param p
	 * @returns {number}
	 */
	num distance( Point p )
	{
		num dx = this.x - p.x;
		num dy = this.y - p.y;
		return sqrt( dx*dx + dy*dy );
	}
}
