package haxe.ds.grid;

class GridBase<T> {

    public var width(default,null):Int;
    public var height(default,null):Int;

    public function onGrid(x:Int,y:Int):Bool {
	return (x >= 0 && y >= 0 && x < width && y < height);
    }

    public function new (w,h) {
	this.width = w;
	this.height = h;
    }

}
