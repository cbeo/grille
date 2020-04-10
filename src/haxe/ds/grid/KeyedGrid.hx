package haxe.ds.grid;

import haxe.ds.Maybe;

class KeyedGrid<T> extends GridBase<T> implements Grid<T> {

    public var keyed(default,null):Array<T>;
    var grid:Grid<Int>;

    public function get(x:Int,y:Int):Maybe<T> {
	return grid.get(x,y)
	    .map( index -> keyed[index]);
    }

    public function set(x:Int,y:Int,t:T) {
	var index = keyed.indexOf(t);
	if (index < 0) {
	    index = keyed.length;
	    keyed.push(t);
	}
	grid.set(x,y,index);
    }

    public function remove(x:Int,y:Int) {
        grid.remove(x,y);
    }
    
    public function addKeyed(t:T) {
	keyed.push(t);
    }

    public function new (k, w, h) {
	super(w,h);
	grid = new GridMap(w,h);
	this.keyed = k;
    }

}
