import 'package:app_model/app_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:news_api/src/cache/cache_options.dart';
import 'package:news_api/src/logger/logger_interceptor.dart';
import 'package:news_api/src/model/api_endpoints.dart';
import 'package:retrofit/http.dart';

part 'news_api.g.dart';

/// A Retrofit API for interacting with the News API.
@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class NewsApi {
  factory NewsApi._(Dio dio, {String? baseUrl}) = _NewsApi;

  /// Creates a new instance of the News API with the given options.
  ///
  /// The `apiKey` is required and will be included in all API calls.
  /// If `isLoggingEnabled` is `true`, will log request/response to the console.
  /// The `baseUrl` is optional, the default value is `https://newsapi.org/v2/`.
  factory NewsApi.withOptions({
    required String apiKey,
    bool isLoggingEnabled = false,
    String? baseUrl,
  }) =>
      NewsApi._(
        Dio(
          BaseOptions(
            headers: {'Accept': 'application/json'},
            queryParameters: {'apiKey': apiKey},
          ),
        )
          ..interceptors.add(
            isLoggingEnabled ? NetworkLoggerInterceptor() : InterceptorsWrapper(),
          )
          ..interceptors.add(
            DioCacheInterceptor(options: cacheOptions),
          ),
        baseUrl: baseUrl,
      );

  /// Search through millions of articles from over 80,000 large and small news sources and blogs.
  /// For more information: https://newsapi.org/docs/endpoints/everything
  @GET(ApiEndpoints.everything)
  Future<NewsResponse> getEverything({
    @Query('q') String? query,
    @Query('searchIn') NewsSearchInList? searchIn,
    @Query('sources') SourceList? sources,
    @Query('from') NewsDateTime? from,
    @Query('to') NewsDateTime? to,
    @Query('language') NewsLanguage? language,
    @Query('sortBy') NewsSortBy? sortBy,
    @Query('pageSize') int? pageSize,
    @Query('page') int? page,
  });

  /// Provides live top and breaking headlines for a country, specific category in a country, single source,
  /// or multiple sources. You can also search with keywords. Articles are sorted by the earliest date published first.
  /// For more information: https://newsapi.org/docs/endpoints/top-headlines
  @GET(ApiEndpoints.topHeadlines)
  Future<NewsResponse> getTopHeadlines({
    @Query('q') String? query,
    @Query('country') NewsCountry? country,
    @Query('category') NewsCategory? category,
    @Query('sources') SourceList? sources,
    @Query('pageSize') int? pageSize,
    @Query('page') int? page,
  });

  /// This endpoint returns the subset of news publishers that top headlines (/v2/top-headlines) are available from.
  /// It's mainly a convenience endpoint that you can use to keep track of the publishers available on the API, and you
  /// can pipe it straight through to your users.
  /// For more information: https://newsapi.org/docs/endpoints/sources
  @GET(ApiEndpoints.sources)
  Future<SourcesResponse> getSources({
    @Query('category') NewsCategory? category,
    @Query('language') NewsLanguage? language,
    @Query('country') NewsCountry? country,
  });
}
