//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import cloud_functions
import connectivity_plus
import firebase_core
import geolocator_apple
import shared_preferences_foundation
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseFunctionsPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFunctionsPlugin"))
  ConnectivityPlugin.register(with: registry.registrar(forPlugin: "ConnectivityPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
