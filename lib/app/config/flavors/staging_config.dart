import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/app/config/flavors/flavor_config.dart';

@test
@LazySingleton(as: FlavorConfig)
class StagingConfig implements FlavorConfig {
  @override
  String get name => Environment.test;

  @override
  bool get enableLogging => kDebugMode;

  @override
  String get baseUrl => 'https://newsapi.org/v2/';
}
