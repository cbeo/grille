package haxe.ds.grid;

class GridBase<T> {

    public var gridWidth(default,null):Int;
    public var gridHeight(default,null):Int;

    public function onGrid(x:Int,y:Int):Bool {
	return (x >= 0 && y >= 0 && x < gridWidth && y < gridHeight);
    }

    public function new (w,h) {
	this.gridWidth = w;
	this.gridHeight = h;
    }

}
