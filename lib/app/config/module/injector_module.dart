import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/app/config/flavors/flavor_config.dart';
import 'package:news_app/app/routing/app_router.dart';
import 'package:news_app/repository/domain/hive_storage_objects.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Box<FavoriteArticle>> get hiveFavBox => Hive.openBox('favorites');

  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  NewsApi get api {
    const apiKey = String.fromEnvironment('API_KEY');
    return NewsApi.withOptions(
      isLoggingEnabled: GetIt.I.get<FlavorConfig>().enableLogging,
      apiKey: apiKey,
    );
  }
}
