package com.weiplus.client;

import nme.geom.Rectangle;
import nme.display.Shape;
import nme.text.TextField;
import nme.display.BitmapData;
import com.roxstudio.haxe.game.ResKeeper;
import nme.display.Bitmap;
import com.roxstudio.haxe.ui.UiUtil;
import com.roxstudio.haxe.ui.RoxNinePatch;
import nme.geom.Rectangle;
import com.roxstudio.haxe.ui.RoxNinePatchData;
import com.roxstudio.haxe.ui.RoxFlowPane;
import com.weiplus.client.model.Status;
import nme.display.Sprite;
import com.roxstudio.haxe.ui.RoxScreen;

using com.roxstudio.haxe.game.GfxUtil;
using com.roxstudio.haxe.ui.UiUtil;

class PostScreen extends BaseScreen {

    private static inline var SPACING = 30;
    private static inline var TEXT = "我用#哈利波图#制作了一个很酷的游戏，快来玩吧！";

#if android
    private static inline var MAKER_DIR = "/sdcard/.harryphoto/maker";
#end

    var status: Status;
    var image: BitmapData;
    var data: Dynamic;
    var preview: Sprite;
    var input: TextField;

    override public function onCreate() {
        title = new Sprite();
        title.addChild(UiUtil.staticText("发布", 0xFF0000, 36));
        super.onCreate();
        graphics.rox_fillRect(0xFF2C2C2C, 0, 0, screenWidth, screenHeight);
        var btn = UiUtil.button(UiUtil.TOP_LEFT, null, "发布", 0xFFFFFF, 36, "res/btn_red.9.png", doPost);
        addTitleButton(btn, UiUtil.RIGHT);
    }

    override public function createContent(height: Float) : Sprite {
        var content = super.createContent(height);
        var main = new Sprite();
        var mainh = height / d2rScale;

        preview = new Sprite();
        preview.graphics.rox_fillRect(0xFFFFFFFF, 0, 0, 320, 320);

        main.addChild(preview.rox_move((designWidth - preview.width) / 2, SPACING));

        var sharepanel = sharePanel();
        main.addChild(sharepanel.rox_move(0, mainh - sharepanel.height));

//        var shape = new Shape();
//        shape.graphics.rox_fillRect(0xFFFF0000, 0, 0, 6, sharepanel.height);
//        main.addChild(shape.rox_move(0, mainh - sharepanel.height));
//
        var inputh = mainh - sharepanel.height - preview.height - 3 * SPACING;
        var shape = new Shape();
        shape.graphics.rox_fillRoundRect(0xFFFFFFFF, 0, 0, 80, 80);
        var bmd = new BitmapData(80, 80, true, 0);
        bmd.draw(shape);
        var npd = new RoxNinePatchData(new Rectangle(20, 20, 40, 40), bmd);
        input = UiUtil.input(TEXT, 0, 30, UiUtil.LEFT, true, 576, inputh - 40);
        var inputbox = new RoxFlowPane(616, inputh, UiUtil.TOP_LEFT, [ input ], new RoxNinePatch(npd));

        main.addChild(inputbox.rox_move(12, preview.height + 2 * SPACING));
        trace("inputh="+inputh+",mainh="+mainh+",inputboxh="+inputbox.height+",input=("+input.width+","+input.height
                +"),text=("+input.textWidth+","+input.textHeight+")");

        main.rox_scale(d2rScale);
        content.addChild(main);
        return content;
    }

    override public function onNewRequest(makerData: Dynamic) {
        status = makerData.status;
        image = makerData.image;
        data = makerData.data;
        preview.graphics.rox_drawRegion(image, null, 4, 4, 312, 312);
        var playButton = UiUtil.button("res/btn_play.png", onPlay);
        playButton.rox_scale(0.6);
        preview.addChild(playButton);
        playButton.rox_move((preview.width - playButton.width) / 2, (preview.height - playButton.height) / 2);
    }

    private function onPlay(_) {
        var classname = "com.weiplus.apps." + status.appData.type + ".App";
//        trace("play class=" + classname + ",status=" + status);
        startScreen(classname, status);
    }

    private function doPost(_) {
        trace("doPost");
#if android
        var mask = new Sprite();
        mask.graphics.rox_fillRect(0x77000000, 0, 0, screenWidth, screenHeight);
        var loading = UiUtil.staticText("发布中...", 0xFFFFFF, 36);
        loading.rox_move((screenWidth - loading.width) / 2, (screenHeight - loading.height) / 2);
        mask.addChild(loading);
        addChild(mask);
        HpManager.postStatus(input.text, MAKER_DIR + "/image.jpg", status.appData.type,
                MAKER_DIR + "/data.zip", "", "", this);
#else
        finish(Type.getClassName(SelectedScreen), RoxScreen.OK);
#end
    }

    private function onApiCallback(apiName: String, resultCode: String, jsonStr: String) {
        removeChildAt(numChildren - 1); // remove mask
        finish(Type.getClassName(SelectedScreen), RoxScreen.OK);
    }

    private function sharePanel() : Sprite {
        var btn0 = shareButton("sina", "新浪微博", "tl");
        var btn1 = shareButton("tencent", "腾讯微博", "tr");
        var btn2 = shareButton("renren", "人人网", "ml");
        var btn3 = shareButton(null, "", "mr");
//        var btn3 = shareButton("sohu_g", "搜狐微博", "ml");
//        var btn4 = shareButton("qqspace_g", "QQ空间", "ml");
//        var btn5 = shareButton("twit_g", "Twitter", "mr");
        var layout = new RoxNinePatchData(new Rectangle(0, 0, 20, 20));
        var lpanel = new RoxFlowPane([ btn0, btn2 ], new RoxNinePatch(layout), UiUtil.HCENTER, [ 0 ]);
        var rpanel = new RoxFlowPane([ btn1, btn3 ], new RoxNinePatch(layout), UiUtil.HCENTER, [ 0 ]);
        var sp = new Sprite();
        var label = UiUtil.staticText("同步到：", 0x808080, 26, UiUtil.LEFT, 610);
        sp.addChild(label.rox_move(20, 0));
        sp.addChild(lpanel.rox_move(12, label.height + 12));
        sp.addChild(rpanel.rox_move(320, label.height + 12));

//        var input = UiUtil.input(TEXT, 0, 30, UiUtil.LEFT, false, 576, 56);
//        sp.addChild(input.rox_move(20, label.height + 12 + lpanel.height + 5));
        return sp;
    }

    private function shareButton(icon: String, name: String, bg: String) : RoxFlowPane {
        var bg = UiUtil.ninePatch("res/btn_share_" + bg + ".9.png");
        var ico = icon != null ? new Bitmap(ResKeeper.getAssetImage("res/ico_" + icon + ".png")).rox_smooth() : null;
        var txt = icon != null ? UiUtil.staticText(name, 0xFFFFFF, 32, UiUtil.LEFT, 150) : null;

        var sp = new RoxFlowPane(308, 88, UiUtil.TOP_LEFT, icon != null ? [ ico, txt ] : [],
                bg, UiUtil.VCENTER, [ 10 ], icon != null ? onShareButton : null);
        sp.name = name;
        return sp;
    }

    private function onShareButton(e: Dynamic) {
        trace("share button " + e.target.name + " clicked");
    }

}