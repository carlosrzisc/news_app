import 'package:app_model/app_model.dart';
import 'package:flutter/material.dart';

typedef NewsItemBuilder = Widget Function(BuildContext, Article);

class NewsListView extends StatefulWidget {
  const NewsListView(
    this.newsList, {
    required this.itemBuilder,
    this.onLoadMore,
    super.key,
  });
  final List<Article> newsList;
  final VoidCallback? onLoadMore;
  final NewsItemBuilder itemBuilder;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() => _onScroll(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.newsList.length,
      padding: const EdgeInsets.only(top: 70, bottom: 100),
      itemBuilder: (_, index) => widget.itemBuilder(context, widget.newsList[index]),
      controller: _scrollController,
    );
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) {
      widget.onLoadMore?.call();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
