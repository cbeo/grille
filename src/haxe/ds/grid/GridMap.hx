package haxe.ds.grid;

import haxe.ds.Vector;
import haxe.ds.Maybe;

class GridMap<T> extends GridBase<T> implements Grid<T> {

    var cells:Vector<T>;

    function checkCoordinate(x,y) {
	if (x < 0 || y < 0 || x >= gridWidth || y >= gridHeight)
	    throw 'Bad grid reference x,y = $x, $y';
    }

    function indexOf(x,y) {
	checkCoordinate(x,y);
	return y * gridWidth + x;
    }

    public function get(x:Int,y:Int):Maybe<T> {
	var gotten =  cells.get( indexOf(x,y) );
	return if (gotten == null) Nothing else Just(gotten);
    }

    public function set(x:Int,y:Int,val:T) {
	cells.set( indexOf(x,y), val);
    }

    public function drop(x:Int,y:Int) {
	set(x,y,null);
    }

    public function new (w,h) {
	super(w,h);
	cells = new Vector (w * h);
    }

}
