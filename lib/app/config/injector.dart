import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/app/config/injector.config.dart';
import 'package:news_app/repository/domain/hive_storage_objects.dart';
import 'package:path_provider/path_provider.dart';

@InjectableInit(preferRelativeImports: false)
Future<void> configure(String environment) async {
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter<ArticleSource>(ArticleSourceAdapter())
    ..registerAdapter<FavoriteArticle>(FavoriteArticleAdapter());
  await GetIt.instance.init(environment: environment);
}
