import 'package:flutter/material.dart';
import 'package:news_app/l10n/l10n.dart';

class NewsInputSearch extends StatefulWidget {
  const NewsInputSearch({
    this.onSearch,
    super.key,
  });
  final void Function(String)? onSearch;

  @override
  State<NewsInputSearch> createState() => _NewsInputSearchState();
}

class _NewsInputSearchState extends State<NewsInputSearch> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Card(
        elevation: 6,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          1,
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: context.l10n.search,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => widget.onSearch?.call(_controller.text),
            ),
            fillColor: Theme.of(context).textTheme.bodyMedium?.color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
