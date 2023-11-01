import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/presentation/bloc/page/page_bloc.dart';
import 'package:flash_buzz/app/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:flash_buzz/app/presentation/widgets/news_list_tile.dart';
import 'package:flash_buzz/app/presentation/widgets/default_404.dart';
import 'package:flash_buzz/app/presentation/widgets/default_429.dart';
import 'package:flash_buzz/app/presentation/widgets/default_app_bar.dart';
import 'package:flash_buzz/app/presentation/widgets/default_loading_indicator.dart';
import 'package:flash_buzz/app/presentation/widgets/default_refresh_indicator.dart';
import 'package:flash_buzz/app/presentation/widgets/shimmers/news_list_tile_shimmer.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/app/utils/helpers/open_in_web_view.dart';
import 'package:flash_buzz/app/utils/helpers/scroll_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollCtrl = ScrollController();
  late TopHeadlinesBloc _topHeadlinesBloc;

  void _getData() {
    if (!_topHeadlinesBloc.isInit) {
      _topHeadlinesBloc.add(const TopHeadlinesEvent());
      _topHeadlinesBloc.isInit = true;
    }
  }

  Future<void> _getMoreData() async {
    await _topHeadlinesBloc.getMoreTopHeadlines();
    if (mounted) setState(() {});
  }

  void _scrollListener() {
    _scrollCtrl.addListener(() {
      if (ScrollHelper.isScrollEnd(_scrollCtrl)) {
        _getMoreData();
      }
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      _topHeadlinesBloc.isInit = false;
      _getData();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _topHeadlinesBloc = context.read<TopHeadlinesBloc>();
    _getData();
    _scrollListener();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _flashBuzzApp(),
    );
  }

  PreferredSizeWidget _appBar() {
    return DefaultAppBar(
      title: 'Flash Buzz',
      style: TextStyle(
        fontSize: title3FS,
        fontWeight: bold,
      ),
      actions: [
        _searchButton(),
      ],
    );
  }

  Widget _searchButton() {
    return IconButton(
      onPressed: () {
        context.read<PageBloc>().add(const PageIndexChanged(1));
      },
      tooltip: 'Search',
      icon: Icon(
        Icons.search_rounded,
        color: whiteColor,
      ),
    );
  }

  Widget _flashBuzzApp() {
    return DefaultRefreshIndicator(
      onRefresh: _onRefresh,
      child: BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
        builder: (context, state) {
          if (state is TopHeadlinesLoading) {
            return const NewsListTileShimmer();
          } else if (state is TopHeadlinesLoaded) {
            return _newsListView(state.newsModel);
          } else if (state is TopHeadlinesError) {
            return state.message.contains('429')
                ? const Default429()
                : const Default404();
          }
          return Container();
        },
      ),
    );
  }

  Widget _newsListView(NewsModel newsModel) {
    int? totalResults = newsModel.totalResults;
    List<News>? listNews = newsModel.articles;
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
        return _newsListTile(news);
      },
    );
  }

  Widget _newsListTile(News? news) {
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
