import 'dart:async';

import 'package:flash_buzz/app/data/models/search_model.dart';
import 'package:flash_buzz/app/presentation/bloc/search/search_bloc.dart';
import 'package:flash_buzz/app/presentation/widgets/default_404.dart';
import 'package:flash_buzz/app/presentation/widgets/default_app_bar.dart';
import 'package:flash_buzz/app/presentation/widgets/default_loading_indicator.dart';
import 'package:flash_buzz/app/presentation/widgets/default_search_bar.dart';
import 'package:flash_buzz/app/presentation/widgets/news_list_tile.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/app/utils/helpers/open_in_web_view.dart';
import 'package:flash_buzz/app/utils/helpers/scroll_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final ScrollController _scrollCtrl = ScrollController();
  late SearchBloc _searchBloc;
  late Timer _timer;

  void _search(String query) {
    if (_searchCtrl.text.isNotEmpty) {
      if (_timer.isActive) {
        _timer.cancel();
      }
      _timer = Timer(const Duration(milliseconds: 500), () {
        _searchBloc.add(SearchNews(query));
      });
    } else {
      _clearSearch();
    }
    setState(() {});
  }

  void _clearSearch() {
    setState(() {
      _searchCtrl.clear();
      _searchBloc.add(const ClearSearch());
    });
  }

  Future<void> _getMoreSearchNews() async {
    await _searchBloc.getMoreSearchNews(_searchCtrl.text);
    if (mounted) setState(() {});
  }

  void _scrollListener() {
    _scrollCtrl.addListener(() {
      if (ScrollHelper.isScrollEnd(_scrollCtrl)) {
        _getMoreSearchNews();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searchBloc = context.read<SearchBloc>();
    _clearSearch();
    _searchFocus.requestFocus();
    _timer = Timer(const Duration(milliseconds: 500), () {});
    _scrollListener();
  }

  @override
  void dispose() {
    super.dispose();
    _searchCtrl.dispose();
    _searchFocus.dispose();
    _timer.cancel();
    _scrollCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Search',
      ),
      body: _searchNews(),
    );
  }

  Widget _searchNews() {
    return Column(
      children: [
        _searchBar(),
        Expanded(
          child: _searchResult(),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(defaultMargin),
      child: DefaultSearchBar(
        controller: _searchCtrl,
        focusNode: _searchFocus,
        hintText: 'Search news...',
        onChanged: (value) => _search(value),
        onPressed: () => _clearSearch(),
      ),
    );
  }

  Widget _searchResult() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const DefaultLoadingIndicator();
        } else if (state is SearchLoaded) {
          return _searchListView(state.searchModel);
        } else if (state is SearchError) {
          return const Default404(
            title: 'Result not found',
          );
        }
        return const Default404(
          title: 'Search news',
          subtitle: 'Search news by keyword',
        );
      },
    );
  }

  Widget _searchListView(SearchModel searchModel) {
    int? totalResults = searchModel.totalResults;
    List<News>? listNews = searchModel.articles;
    int newsLength = listNews?.length ?? 0;

    return ListView.builder(
      controller: _scrollCtrl,
      padding: const EdgeInsets.all(defaultMargin),
      itemCount: newsLength,
      itemBuilder: (_, i) {
        News? news = listNews?[i];
        bool isLastIndex = i + 1 == newsLength;
        bool isTotalResultsEqual = totalResults == newsLength;

        if (isLastIndex && !isTotalResultsEqual) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: defaultMargin),
            child: DefaultLoadingIndicator(),
          );
        }
        return _searchListTile(news);
      },
    );
  }

  _searchListTile(News? news) {
    String image = news?.urlToImage ?? '';
    String title = news?.title ?? '-';
    String author = news?.author ?? '-';
    String publishedAt = timeago.format(news?.publishedAt ?? DateTime.now());
    String subtitle = '$author | $publishedAt';
    String url = news?.url ?? '';

    return NewsListTile(
      isLeadingImage: true,
      leadingString: image,
      isTitleText: true,
      titleString: title,
      isSubtitleText: true,
      subtitleString: subtitle,
      onTap: () => OpenInWebView.news(context, title: title, url: url),
    );
  }
}
