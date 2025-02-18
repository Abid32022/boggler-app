// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:smart_auth/smart_auth_web.dart';
import 'package:speech_to_text/speech_to_text_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FluttertoastWebPlugin.registerWith(registrar);
  SmartAuthWeb.registerWith(registrar);
  SpeechToTextPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
