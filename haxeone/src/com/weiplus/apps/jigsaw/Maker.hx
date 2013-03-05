package com.weiplus.apps.jigsaw;

import com.weiplus.client.model.AppData;
import com.weiplus.client.SimpleMaker;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.geom.Matrix;

using com.roxstudio.haxe.ui.UiUtil;

class Maker extends SimpleMaker {

    override private function setLevel(level: Int) {
        super.setLevel(level);
        var img = untyped data.image;
        var lvls = [ 5, 6, 9 ];
        untyped data.size = lvls[level];
        addGrids(lvls[level]);
        image = new BitmapData(Std.int(SimpleMaker.SIDELEN / 2), Std.int(SimpleMaker.SIDELEN / 2), true, 0);
        var r = image.width / preview.width;
        image.draw(preview, new Matrix(0.5, 0, 0, 0.5, image.width / 2, image.width / 2), true);
        var appdata: AppData = status.appData;
        appdata.width = image.width;
        appdata.height = image.height;
        appdata.type = "jigsaw";
        status.makerData = data;
    }

}
