package haxe.ds.grid;

import haxe.ds.Vector;
import haxe.ds.Maybe;

class GridMap<T> extends GridBase<T> implements Grid<T> {

    var cells:Vector<{filled:Bool,data:T}>;
    
    function indexOf(x,y) {
	return y * gridWidth + x;
    }

    public function get(x:Int,y:Int):Maybe<T> {
	if (!onGrid( x, y)) return Nothing;
	var gotten =  cells.get( indexOf(x,y) );
	return if (gotten == null || !gotten.filled) Nothing else Just(gotten.data);
    }

    public function set(x:Int,y:Int,val:T) {
        if (!onGrid(x, y)) throw 'GridMap Error: $x,$y not on Grid';
        
        var index = indexOf(x, y);
        var gotten = cells.get( index );
        if (gotten == null) {
	    cells.set( index, {filled:true, data:val});
        } else {
            gotten.data = val;
        }
    }

    public function remove(x:Int,y:Int) {
        if (!onGrid(x, y)) throw 'GridMap Error: $x,$y not on Grid';
        
        var gotten = cells.get( indexOf( x, y) );
        if (gotten != null)
            gotten.filled = false;
    }

    public function new (w,h) {
	super(w,h);
	cells = new Vector (w * h);
    }

}
