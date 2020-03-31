package haxe.ds.grid;

import haxe.ds.Maybe;

class GridUtil {

    public static function iterator<T> ( g:Grid<T> ) :GridIterate<T> {
	return iterate( g, 0, 0, g.gridWidth-1, g.gridHeight-1 );
    }

    public static function iterate<T> ( g:Grid<T>, sx, sy, ex, ey ) :GridIterate<T> {
	return new GridIterate( g, sx, sy, ex, ey);
    }

    public static function filter<T> (g:Grid<T>, pred:GridCell<T> -> Bool) : Array<GridCell<T>> {
	return [for (t in iterator(g)) if (pred( t )) t];
    }

    public static function line<T> (g:Grid<T>, x1, y1, x2, y2) : GridLineIterate<T> {
	return new GridLineIterate(g, x1, y1, x2, y2);
    }

    public static function cell<T>(g:Grid<T>,x,y): GridCell<T> {
	return new GridCell(g,x,y);
    }
}
