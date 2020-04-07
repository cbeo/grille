package haxe.ds.grid;

import haxe.ds.Maybe;

using Lambda;

class SparseGrid<T> extends GridBase<T> implements Grid<T> {

    var cells:Array<{x:Int,y:Int,value:T}> = [];

    public function cell(x:Int,y:Int) : {x:Int,y:Int,value:T} {
	if (!onGrid(x,y)) 'Bad grid reference x,y = $x, $y';
	return cells.find(pt -> pt.x == x && pt.y == y);
    }

    public function get(x:Int,y:Int):Maybe<T> {
	var found = cell(x,y);
	return if (found != null) Just( found.value ) else Nothing;
    }

    public function set(x:Int,y:Int,value:T) {
	var found = cell(x,y);
	if (found != null) {
	    found.value = value;
	} else {
	    cells.push({x:x,y:y,value:value});
	}
    }

    
    public function sparseIterator():Iterator<{x:Int,y:Int,value:T}> {
	return cells.iterator();
    }

    public function new (width:Int,height:Int) {
	super(width, height);
	cells = [];
    }

}
