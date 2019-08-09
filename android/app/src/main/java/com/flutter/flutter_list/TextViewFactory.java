package com.flutter.flutter_list;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class TextViewFactory extends PlatformViewFactory {

    private BinaryMessenger messenger;

    public TextViewFactory(BinaryMessenger mgr) {
        super(StandardMessageCodec.INSTANCE);
        messenger=mgr;
    }

    @Override
    public PlatformView create(Context context, int i, Object args) {
        return new FlutterTextView(context,i,messenger);
    }

}
