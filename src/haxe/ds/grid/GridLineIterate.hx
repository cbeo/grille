package haxe.ds.grid;

// adapted from https://www.redblobgames.com/grids/line-drawing.html

typedef Pt = {x:Float,y:Float};

class GridLineIterate<T> {

    static function linInterp(start:Float, end:Float, t:Float):Float {
	return start + t * (end - start);
    }

    static function linInterpPt(pt1:Pt, pt2:Pt, t:Float): Pt {
	return {x: linInterp( pt1.x, pt2.x, t),
		y: linInterp( pt1.y, pt2.y, t)};
    }

    static function diagonalDist(pt1:Pt, pt2:Pt):Float {
	var dx = pt2.x - pt1.x;
	var dy = pt2.y - pt1.y;
	return Math.max(Math.abs(dx), Math.abs(dy));
    }

    var pt1:Pt;
    var pt2:Pt;
    var pathLength:Int;
    var step:Float;

    var cell:GridCell<T>;

    public inline function hasNext():Bool {
	return step <= pathLength;
    }

    public inline function next(): GridCell<T> {
	var t = if (pathLength == 0) 0.0 else step / pathLength;
	var pti = linInterpPt(pt1,pt2, t);
	step += 1;
	cell.x = Std.int(Math.round(pti.x));
	cell.y = Std.int(Math.round(pti.y));
	return cell;
    }

    public function new (g:Grid<T>, x1:Int, y1:Int, x2:Int, y2:Int) {
	cell = new GridCell(g, x1, y1);
	pt1 = {x:x1,y:y1};
	pt2 = {x:x2,y:y2};
	this.pathLength = Std.int( diagonalDist(pt1,pt2) );
	step = 0.0;
    }
    
}
