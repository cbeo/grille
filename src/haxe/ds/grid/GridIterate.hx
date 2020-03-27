package haxe.ds.grid;

import haxe.ds.Maybe;

   

class GridIterate<T> {

    var grid:Grid<T>;
    public var x(default,null):Int;
    public var y(default,null):Int;
    var endX:Int;
    var endY:Int;
    var pt:GridCell<T>;

    public inline function new (grid,x,y,ex,ey) {
	this.grid = grid;
	this.x = x;
	this.y = y;
	this.endX = ex;
	this.endY = ey;
	this.pt = new GridCell(grid,x,y);
    }

    public inline function hasNext():Bool {
	return x <= endX && y <= endY;
    }

    public inline function next(): GridCell<T> {
	pt.x = x;
	pt.y = y;
	if (x >= endX) {
	    x = 0;
	    y += 1;
	} else {
	    x += 1;
	}
	return pt;
    }
}
