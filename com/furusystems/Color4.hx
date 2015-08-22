package com.furusystems;

/**
 * ...
 * @author Andreas Rønning
 */
class Color4
{
	var data:Array<Float>;
	
	public var r(get, set):Float;
	public var g(get, set):Float;
	public var b(get, set):Float;
	public var a(get, set):Float;
	
	inline function get_r():Float { return data[0]; };
	inline function get_g():Float { return data[1]; };
	inline function get_b():Float { return data[2]; };
	inline function get_a():Float { return data[3]; };
	
	inline function set_r(v:Float):Float { return data[0]=v; };
	inline function set_g(v:Float):Float { return data[1]=v; };
	inline function set_b(v:Float):Float { return data[2]=v; };
	inline function set_a(v:Float):Float { return data[3]=v; };
	
	public inline function new(r:Float = 0, g:Float = 0, b:Float = 0, a:Float = 0) 
	{
		data = [r, g, b, a];
	}
	public inline function setFromHex(color:Int):Color4 {
		a = (color >> 24) / 255;
		r = (color >> 16 & 0xFF) / 255;
		g = (color >>  8 & 0xFF) / 255;
		b = (color & 0xFF) / 255;
		return this;
	}
	public inline function toHex():Int {
		return Std.int(a * 255) << 24 | Std.int(r * 255) << 16 | Std.int(g * 255) << 8 | Std.int(b * 255);
	}
	
	public inline function copyFrom(other:Color3):Void {
		r = other.r;
		g = other.g;
		b = other.b;
		a = 1;
	}
	
	public inline function clone():Color4 {
		return new Color4(r, g, b, a);
	}
	
	public inline function getArray():Array<Float> {
		return data;	
	}
	
	public static inline function mix(a:Color4, b:Color4, ratio:Float):Color4 {
		return new Color4(
			a.r + (b.r - a.r) * ratio,
			a.g + (b.g - a.g) * ratio,
			a.b + (b.b - a.b) * ratio,
			a.a + (b.a - a.a) * ratio);
	}
	
	public static function fromHex(color:Int):Color4 {
		var c = new Color4();
		c.a = (color >> 24) / 255;
		c.r = (color >> 16 & 0xFF) / 255;
		c.g = (color >>  8 & 0xFF) / 255;
		c.b = (color & 0xFF) / 255;
		return c;
	}
	public static function fromColor3(color:Color3):Color4 {
		var out = new Color4();
		out.a = 1;
		out.r = color.r;
		out.g = color.g;
		out.b = color.b;
		return out;
	}
	
}