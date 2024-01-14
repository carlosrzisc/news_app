import 'package:app_model/app_model.dart';
import 'package:app_ui/src/widgets/news_item/news_item.dart';
import 'package:app_ui/src/widgets/news_item/widgets/article_content.dart';
import 'package:app_ui/src/widgets/news_item/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockArticle extends Mock implements Article {}

void main() {
  late Article mockArticle;
  late VoidCallback mockOnTap;
  late VoidCallback mockOnFavoriteTap;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockArticle = MockArticle();
    mockOnTap = () {};
    mockOnFavoriteTap = () {};
  });

  testWidgets('NewsItem widget should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NewsItem(
            mockArticle,
            onTap: mockOnTap,
            onFavoriteTap: mockOnFavoriteTap,
          ),
        ),
      ),
    );

    expect(find.byType(InkWell), findsNWidgets(2));
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(4));
    expect(find.byType(ArticleContent), findsOneWidget);
    expect(find.byType(FavoriteButton), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Expanded), findsNWidgets(2));
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('FavoriteButton widget should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FavoriteButton(
            onFavoriteTap: mockOnFavoriteTap,
          ),
        ),
      ),
    );

    expect(find.byType(Align), findsNWidgets(2));
    expect(find.byType(DecoratedBox), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);
  });

  testWidgets('ArticleContent widget should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ArticleContent(
            article: mockArticle,
          ),
        ),
      ),
    );

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Expanded), findsNWidgets(2));
    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(ConstrainedBox), findsNWidgets(2));
    expect(find.byType(SizedBox), findsNWidgets(3));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
