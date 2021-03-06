package com.weiplus.client;

//import com.weiplus.client.TestMakerScreen;
import Lambda;
using com.roxstudio.i18n.I18n;
import nme.events.Event;
import com.weiplus.client.model.AppData;
import com.weiplus.client.model.Status;
import com.roxstudio.haxe.ui.RoxApp;
import com.roxstudio.haxe.ui.RoxScreenManager;
import nme.display.FPS;
import nme.Lib;

#if cpp
//import com.weiplus.client.ImageChooser;
#end
//import com.weiplus.client.ImageEditor;
//import com.weiplus.client.HomeScreen;
//import com.weiplus.client.RichEditor;
//import com.weiplus.client.TestGesture;
//import com.weiplus.client.Postit;
//import com.weiplus.client.PostitScreen;

class Main {

    public function new() {
    }

    static public function main() {
//        trace("before init");
        I18n.init();
        var loc = nme.system.Capabilities.language;
        trace("lang=" + loc);
        if (StringTools.startsWith(loc, "zh")) {
            loc = "default";
        } else if (!Lambda.has(I18n.getSupportedLocales(), loc)) {
            loc = "en";
        }
        I18n.setCurrentLocale(loc);
        RoxApp.init();
//        trace("init ok");
        var m = new RoxScreenManager();
//        m.startScreen(Type.getClassName(com.weiplus.client.HomeScreen));
//        m.startScreen(Type.getClassName(CameraScreen));
//        m.startScreen(Type.getClassName(TestGesture));
//        m.startScreen(Type.getClassName(TestScreen));
//        m.startScreen(Type.getClassName(TestMakerScreen));
//        m.startScreen(Type.getClassName(SimpleMaker));
//        m.startScreen(Type.getClassName(SelectedScreen));
//        m.startRootScreen(Type.getClassName(SettingScreen));
//        m.startRootScreen(Type.getClassName(TestCurve));
//        m.startRootScreen(Type.getClassName(com.roxstudio.haxe.hxquery.Test));
        m.startRootScreen(Type.getClassName(Splash));

//        trace("screen started");
//        var st = new Status();
//        var data = st.appData = new AppData();
//        data.type = "test";
//        data.id = "1111";
//        data.url = "http://rox.local/res/data/data.zip";
//        data.url = "assets://res/data/data.zip";
//        m.startScreen(Type.getClassName(TestPlayScreen), st);
        RoxApp.stage.addChild(m);
//        RoxApp.stage.addEventListener(Event.ADDED_TO_STAGE, function(e: Dynamic) {
//            trace(">>>>(" + e.target + ",name=" + e.target.name + ") added to stage.");
//        });
//        RoxApp.stage.addEventListener(Event.ADDED, function(e: Dynamic) {
//            trace("----(" + e.target + ",name=" + e.target.name + ") added.");
//        });

//        var fps = new FPS();
//        fps.x = 400;
//        fps.y = 10;
//        fps.mouseEnabled = false;
//        RoxApp.stage.addChild(fps);
    }

    public static inline function fontName() {
        return #if android '/system/fonts/DroidSansFallback.ttf' #else 'Microsoft YaHei' #end;
    }

}
