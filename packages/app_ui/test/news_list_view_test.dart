import 'package:app_model/app_model.dart';
import 'package:app_ui/src/widgets/news_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockArticle extends Mock implements Article {}

void main() {
  late List<Article> newsList;
  late NewsItemBuilder itemBuilder;
  late VoidCallback onLoadMore;

  setUp(() {
    newsList = List.generate(10, (index) => MockArticle());
    itemBuilder = (_, article) => Container();
    onLoadMore = () {};
  });

  testWidgets('NewsListView should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NewsListView(
            newsList,
            itemBuilder: itemBuilder,
            onLoadMore: onLoadMore,
          ),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
  });
}
