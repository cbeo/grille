package haxe.ds.grid;

import haxe.ds.Maybe;

@:using(haxe.ds.grid.GridUtil)
interface Grid<T> {

    public var gridWidth(default,null):Int;
    public var gridHeight(default,null):Int;

    public function onGrid(x:Int,y:Int):Bool;
    public function get(x:Int,y:Int):Maybe<T>;
    public function set(x:Int,y:Int,t:T):Void;
}

