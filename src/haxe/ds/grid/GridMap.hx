package haxe.ds.grid;

import haxe.ds.Vector;
import haxe.ds.Maybe;

class GridMap<T> extends GridBase<T> implements Grid<T> {

    var cells:Vector<T>;

    function indexOf(x,y) {
	return y * gridWidth + x;
    }

    public function get(x:Int,y:Int):Maybe<T> {
	if (!onGrid( x, y)) return Nothing;
	var gotten =  cells.get( indexOf(x,y) );
	return if (gotten == null) Nothing else Just(gotten);
    }

    public function set(x:Int,y:Int,val:T) {
	cells.set( indexOf(x,y), val);
    }

    public function new (w,h) {
	super(w,h);
	cells = new Vector (w * h);
    }

}
