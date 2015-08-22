package com.furusystems;

/**
 * ...
 * @author Andreas Rønning
 */
class Color3
{
	static inline var inv:Float = 1.0 / 255.0;
	
	var data:Array<Float>;
	
	public var r(get, set):Float;
	public var g(get, set):Float;
	public var b(get, set):Float;
	
	inline function get_r():Float { return data[0]; };
	inline function get_g():Float { return data[1]; };
	inline function get_b():Float { return data[2]; };
	
	inline function set_r(v:Float):Float { return data[0] = v; };
	inline function set_g(v:Float):Float { return data[1] = v; };
	inline function set_b(v:Float):Float { return data[2] = v; };
	
	public inline function new(r:Float = 0, g:Float = 0, b:Float = 0) 
	{
		data = [r, g, b];
	}
	
	public inline function getArray():Array<Float> {
		return data;	
	}
	
	public inline function setFromHex(color:Int):Color3 {
		r = (color >> 16) * inv;
		g = (color >> 8 & 0xFF) * inv;
		b = (color & 0xFF) * inv;
		return this;
	}
	public inline function toHex():Int {
		return Std.int(r * 255) << 16 | Std.int(g * 255) << 8 | Std.int(b * 255);
	}
	public inline function copyFrom(other:Color3):Void {
		r = other.r;
		g = other.g;
		b = other.b;
	}
	public inline function clone():Color3 {
		return new Color3(r, g, b);
	}
	
	public static inline function mix(a:Color3, b:Color3, ratio:Float):Color3 {
		return new Color3(
			a.r + (b.r - a.r) * ratio,
			a.g + (b.g - a.g) * ratio,
			a.b + (b.b - a.b) * ratio);
	}
	
	public static inline function fromHex(color:Int):Color3 {
		var c = new Color3();
		c.r = (color >> 16) * inv;
		c.g = (color >> 8 & 0xFF) * inv;
		c.b = (color & 0xFF) * inv;
		return c;
	}
	public static inline function fromColor4(color:Color4):Color3 {
		var out = new Color3();
		out.r = color.r;
		out.g = color.g;
		out.b = color.b;
		return out;
	}
	
}