package haxe.ds.grid;

import haxe.ds.Maybe;

using Lambda;

class SparseGrid<T> extends GridBase<T> implements Grid<T> {

    var cells:Array<{x:Int,y:Int,value:T}> = [];

    function cell(x:Int,y:Int) : {x:Int,y:Int,value:T} {
	if (!onGrid(x,y)) 'Bad grid reference x,y = $x, $y';
	return cells.find(pt -> pt.x == x && pt.y == y);
    }

    public function get(x:Int,y:Int):Maybe<T> {
	var found = cell(x,y);
	return if (found != null) Just( found.value ) else Nothing;
    }

    public function drop(x:Int,y:Int) {
	cells = cells.filter( cell -> !(cell.x == x && cell.y == y) );
    }

    public function set(x:Int,y:Int,value:T) {
	var found = cell(x,y);
	if (found != null) {
	    found.value = value;
	} else {
	    cells.push({x:x,y:y,value:value});
	}
    }

    public function new (width:Int,height:Int) {
	super(width, height);
	cells = [];
    }

}