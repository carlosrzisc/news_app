import 'package:hive/hive.dart';
import 'package:news_api/news_api.dart';

part 'hive_storage_objects.g.dart';

@HiveType(typeId: 0)
class FavoriteArticle {
  FavoriteArticle({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @HiveField(0)
  ArticleSource? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  @override
  String toString() {
    return '$title: $author';
  }

  Article toArticle() {
    return Article(
      source: source?.toSource(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}

@HiveType(typeId: 1)
class ArticleSource {
  ArticleSource({
    this.id,
    this.name,
  });

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @override
  String toString() {
    return '$name';
  }

  Source toSource() {
    return Source(
      id: id,
      name: name,
    );
  }
}

extension ArticleSourceX on Source {
  ArticleSource toHive() => ArticleSource(id: id, name: name);
}

extension ArticleX on Article {
  FavoriteArticle toHive() => FavoriteArticle(
        source: source?.toHive(),
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );
}
