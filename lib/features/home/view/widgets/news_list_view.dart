import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/news_api.dart';
import 'package:news_app/features/home/bloc/home_bloc.dart';
import 'package:news_app/features/home/view/widgets/news_item/presenter/news_item_presenter.dart';

class NewsListView extends StatefulWidget {
  const NewsListView(
    this.newsList, {
    this.onTap,
    super.key,
  });
  final List<Article> newsList;
  final void Function(Article)? onTap;

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
      padding: const EdgeInsets.only(top: 130, bottom: 40),
      itemBuilder: (_, index) => NewsItemPresenter(
        widget.newsList[index],
        onTap: () => widget.onTap?.call(widget.newsList[index]),
      ),
      controller: _scrollController,
    );
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) {
      context.read<HomeBloc>().add(const HomeEvent.load());
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
