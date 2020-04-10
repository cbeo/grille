package haxe.ds.grid;

import haxe.ds.Maybe;

class GridCell<T> {
    var grid:Grid<T>;

    public var x:Int;
    public var y:Int;
    public var value(get,set):T;

    function get_value():T {
	return grid.get(x,y).take();
    }

    function set_value(v:T) {
	grid.set( x, y, v);
	return v;
    }

    public var safeValue(get,never):Maybe<T>;

    function get_safeValue():Maybe<T> {
        return grid.get(x,y);
    }
    
    public function remove () {
        grid.remove(x,y);
    }
    
    public function neighbors(?manhattan = false):Array<GridCell<T>> {
	var ns = [];
	var pushCell = (cell) -> ns.push( cell );
	if (manhattan) {
	    this.above.thenDo( pushCell );
	    this.below.thenDo( pushCell );
	    this.left.thenDo( pushCell );
	    this.right.thenDo( pushCell );
	} else {
	    for (xi in -1 ... 2) for (yi in -1 ... 2) 
		relativeBy(xi,yi).thenDo( pushCell );
	}
	return ns;
    }

    public function neighborBlock():Array<Maybe<T>> {
        var f = (cell:GridCell<T>) -> cell.safeValue;
        return [
            aboveLeft.andThen( f ), above.andThen( f ), aboveRight.andThen( f ),
            left.andThen( f ), safeValue, right.andThen( f ),
            belowLeft.andThen( f ), below.andThen( f ), belowRight.andThen( f )
        ];
    }

    public var above(get,never):Maybe<GridCell<T>>;
    function get_above() {
	return relativeBy(0,-1);
    }
    public var aboveRight(get,never):Maybe<GridCell<T>>;
    function get_aboveRight() {
	return relativeBy(1,-1);
    }
    public var aboveLeft(get,never):Maybe<GridCell<T>>;
    function get_aboveLeft() {
	return relativeBy(-1,-1);
    }
    public var left(get,never):Maybe<GridCell<T>>;
    function get_left() {
	return relativeBy(-1,0);
    }
    public var right(get,never):Maybe<GridCell<T>>;
    function get_right() {
	return relativeBy(1,0);
    }
    public var below(get,never):Maybe<GridCell<T>>;
    function get_below() {
	return relativeBy(0,1);
    }
    public var belowRight(get,never):Maybe<GridCell<T>>;
    function get_belowRight() {
	return relativeBy(1,1);
    }
    public var belowLeft(get,never):Maybe<GridCell<T>>;
    function get_belowLeft() {
	return relativeBy(-1,1);
    }
    
    // public function relativeBy(dx,dy):Maybe<GridCell<T>> {
    //     return if ( grid.onGrid(x+dx,y+dy) ) Just(new GridCell(grid,x+dx,y+dy)) else Nothing;
    // }

    public function relativeBy(dx,dy):Maybe<GridCell<T>> {
        return if (grid.get(x+dx, y+dy).isJust()) Just(new GridCell(grid, x+dx, y+dy)) else Nothing;
    }

    public function new(grid,x,y) {
	this.grid = grid;
	this.x = x;
	this.y = y;
    }
}
 
