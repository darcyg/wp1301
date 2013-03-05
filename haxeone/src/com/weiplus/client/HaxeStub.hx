package com.weiplus.client;


class HaxeStub
{
	var __jobject:Dynamic;
	
	
	public function new(handle:Dynamic)
	{
		__jobject = handle;
	}
	
	
	private static var _startActivity_func:Dynamic;

	public static function startActivity(arg0:String, arg1:Int, arg2:String):Void
	{
		if (_startActivity_func == null)
			_startActivity_func = nme.JNI.createStaticMethod("com/weiplus/client/HaxeStub", "startActivity", "(Ljava/lang/String;ILjava/lang/String;)V", true);
		var a = new Array<Dynamic>();
		a.push(arg0);
		a.push(arg1);
		a.push(arg2);
		_startActivity_func(a);
	}
	
	
	private static var _startImageCapture_func:Dynamic;

	public static function startImageCapture(arg0:Int, arg1:String):Void
	{
		if (_startImageCapture_func == null)
			_startImageCapture_func = nme.JNI.createStaticMethod("com/weiplus/client/HaxeStub", "startImageCapture", "(ILjava/lang/String;)V", true);
		var a = new Array<Dynamic>();
		a.push(arg0);
		a.push(arg1);
		_startImageCapture_func(a);
	}
	
	
	private static var _startGetContent_func:Dynamic;

	public static function startGetContent(arg0:Int, arg1:String):Void
	{
		if (_startGetContent_func == null)
			_startGetContent_func = nme.JNI.createStaticMethod("com/weiplus/client/HaxeStub", "startGetContent", "(ILjava/lang/String;)V", true);
		var a = new Array<Dynamic>();
		a.push(arg0);
		a.push(arg1);
		_startGetContent_func(a);
	}
	
	
	private static var _onActivityResult_func:Dynamic;

	public static function onActivityResult(arg0:Int, arg1:Int, arg2:Dynamic /*android.content.Intent*/):Void
	{
		if (_onActivityResult_func == null)
			_onActivityResult_func = nme.JNI.createStaticMethod("com/weiplus/client/HaxeStub", "onActivityResult", "(IILandroid/content/Intent;)V", true);
		var a = new Array<Dynamic>();
		a.push(arg0);
		a.push(arg1);
		a.push(arg2);
		_onActivityResult_func(a);
	}
	
	
	private static var _getResult_func:Dynamic;

	public static function getResult(arg0:Int):String
	{
		if (_getResult_func == null)
			_getResult_func = nme.JNI.createStaticMethod("com/weiplus/client/HaxeStub", "getResult", "(I)Ljava/lang/String;", true);
		var a = new Array<Dynamic>();
		a.push(arg0);
		return _getResult_func(a);
	}
	
	
}