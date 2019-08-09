package com.flutter.flutter_list;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;

public class FlutterTextView implements PlatformView, MethodChannel.MethodCallHandler {

    private  TextView textView;
    private final MethodChannel methodChannel;

    FlutterTextView(Context context, int id, BinaryMessenger messenger) {
        textView = new TextView(context);
        methodChannel = new MethodChannel(messenger, "plugins.felix.angelov/textview_" + id);
        methodChannel.setMethodCallHandler(this);
    }


    @Override
    public View getView() {
        return textView;
    }

    @Override
    public void dispose() {
        textView=null;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "setText":
                setText(methodCall,result);
                break;
            default:
                result.notImplemented();
        }
    }

    private void setText(MethodCall methodCall, MethodChannel.Result result){
        String text= (String) methodCall.arguments;
        textView.setText(text);
        result.success(null);
    }

}
