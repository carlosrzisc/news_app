import 'package:injectable/injectable.dart';

import 'package:news_app/app/config/flavors/flavor_config.dart';

@prod
@Injectable(as: FlavorConfig)
class ProdConfig implements FlavorConfig {
  @override
  String get name => Environment.prod;

  @override
  bool get enableLogging => false;

  @override
  String get baseUrl => 'https://newsapi.org/v2/';
}
