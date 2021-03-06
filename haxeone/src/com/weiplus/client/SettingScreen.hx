package com.weiplus.client;

using com.roxstudio.i18n.I18n;
import com.weiplus.client.MyUtils;
import nme.display.Shape;
import nme.display.Sprite;

using com.roxstudio.haxe.game.GfxUtil;
using com.roxstudio.haxe.ui.UiUtil;

class SettingScreen extends BaseScreen {
    private var starttm: Float;

    public function new() {
        super();
        starttm = haxe.Timer.stamp();
    }

    override public function createContent(h: Float) : Sprite {
        var content = super.createContent(h);
        var spacing = 20 * d2rScale;
        var yoff = spacing;
        var arr: Array<ListItem> = [];
        arr.push({ id: "share", icon: null, name: "分享设置".i18n(), type: 1, data: null });
        var list = MyUtils.list(arr, screenWidth - 2 * spacing, function(i: ListItem) : Bool {
            startScreen(Type.getClassName(ShareSetting));
            return true;
        });
        content.addChild(list.rox_move(spacing, yoff));
        yoff += list.height + spacing;

        arr = [];
        arr.push({ id: "umeng_xp", icon: null, name: "推荐应用".i18n(), type: 1, data: null });
        arr.push({ id: "umeng_fb", icon: null, name: "意见反馈".i18n(), type: 1, data: null });
        arr.push({ id: "clear_image_cache", icon: null, name: "清除图片缓存".i18n(), type: 1, data: null });
        arr.push({ id: "about", icon: null, name: "关于哈利波图".i18n(), type: 1, data: null });
        list = MyUtils.list(arr, screenWidth - 2 * spacing, function(i: ListItem) : Bool {
            switch (i.id) {
#if android
                case "umeng_xp": HaxeStub.startUmengXp();
                case "umeng_fb": HaxeStub.startUmengFb();
#end
                case "clear_image_cache":
                    MyUtils.clearImageCache();
                    UiUtil.message("图片缓存已清除".i18n());
                case "about":
                    UiUtil.message("迈吉客科技（上海）有限公司".i18n());
            }
            return true;
        });
        content.addChild(list.rox_move(spacing, yoff));
        yoff += list.height + spacing;

        arr = [];
        arr.push({ id: "logoff", icon: null, name: "注销登录".i18n(), type: 2, data: null });
        var list = MyUtils.list(arr, screenWidth - 2 * spacing, function(i: ListItem) : Bool {
            MyUtils.logout();
            startScreen(Type.getClassName(PublicScreen), CLEAR);
            UiUtil.message("你已经登出".i18n());
            return true;
        });
        content.addChild(list.rox_move(spacing, yoff));
        return content;
    }

    override public function onNewRequest(_) {
//        trace("SettingScreen started, time=" + (haxe.Timer.stamp() - starttm));
    }

}
