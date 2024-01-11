import 'package:injectable/injectable.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/bootstrap.dart';

void main() async {
  await bootstrap(() => const App(), Environment.dev);
}
