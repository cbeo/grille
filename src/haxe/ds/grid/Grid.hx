package haxe.ds.grid;

import haxe.ds.Maybe;

interface Grid<T> {

    public var width(default,null):Int;
    public var height(default,null):Int;

    public function onGrid(x:Int,y:Int):Bool;
    public function get(x:Int,y:Int):Maybe<T>;
    public function set(x:Int,y:Int,t:T):Void;
    public function drop(x:Int,y:Int):Void;

}

