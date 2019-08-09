package com.flutter.flutter_list;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class TextViewPlugin{

    public static void registReceiveMsgPlugin(PluginRegistry.Registrar registrar){
        registrar.platformViewRegistry()
                .registerViewFactory("plugins.felix.angelov/textview",new TextViewFactory(registrar.messenger()));
    }

}
