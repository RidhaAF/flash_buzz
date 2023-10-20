import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/presentation/bloc/page/page_bloc.dart';
import 'package:flash_buzz/app/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:flash_buzz/app/presentation/pages/news/widgets/news_list_tile.dart';
import 'package:flash_buzz/app/presentation/widgets/default_404.dart';
import 'package:flash_buzz/app/presentation/widgets/default_429.dart';
import 'package:flash_buzz/app/presentation/widgets/default_app_bar.dart';
import 'package:flash_buzz/app/presentation/widgets/default_loading_indicator.dart';
import 'package:flash_buzz/app/presentation/widgets/default_refresh_indicator.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollCtrl = ScrollController();

  void _getData() {
    if (!context.read<TopHeadlinesBloc>().isInit) {
      context.read<TopHeadlinesBloc>().add(const TopHeadlinesEvent());
      context.read<TopHeadlinesBloc>().isInit = true;
    }
  }

  Future<void> _getMoreData() async {
    await context.read<TopHeadlinesBloc>().getMoreTopHeadlines();
    if (mounted) setState(() {});
  }

  void _scrollListener() {
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.offset >= _scrollCtrl.position.maxScrollExtent &&
          !_scrollCtrl.position.outOfRange) {
        _getMoreData();
      }
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      context.read<TopHeadlinesBloc>().isInit = false;
      _getData();
      setState(() {});
    }
  }

  Future<void> _openNews(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
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
        IconButton(
          onPressed: () {
            context.read<PageBloc>().add(const PageIndexChanged(1));
          },
          tooltip: 'Search',
          icon: Icon(
            Icons.search_rounded,
            color: whiteColor,
          ),
        ),
      ],
    );
  }

  Widget _flashBuzzApp() {
    return DefaultRefreshIndicator(
      onRefresh: _onRefresh,
      child: BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
        builder: (context, state) {
          if (state is TopHeadlinesInitial || state is TopHeadlinesLoading) {
            return state is TopHeadlinesLoading
                ? const DefaultLoadingIndicator()
                : Container();
          } else if (state is TopHeadlinesLoaded) {
            int? totalResults = state.newsModel.totalResults;
            List<News>? listNews = state.newsModel.articles;
            int newsLength = listNews?.length ?? 0;

            return ListView.builder(
              controller: _scrollCtrl,
              padding: const EdgeInsets.all(defaultMargin),
              itemCount: newsLength,
              itemBuilder: (context, i) {
                News? news = listNews?[i];

                if (i + 1 == newsLength && totalResults != newsLength) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultMargin),
                    child: DefaultLoadingIndicator(),
                  );
                }
                return _newsListTile(news);
              },
            );
          } else if (state is TopHeadlinesError) {
            return state.message.contains('429')
                ? const Default429()
                : const Default404();
          }
          return const Default404();
        },
      ),
    );
  }

  Widget _newsListTile(News? news) {
    String image = news?.urlToImage ?? '';
    String title = news?.title ?? '';
    String author = news?.author ?? '';
    String publishedAt = timeago.format(news?.publishedAt ?? DateTime.now());
    String subtitle = '$author - $publishedAt';
    String url = news?.url ?? '';

    return NewsListTile(
      isLeadingImage: true,
      leadingString: image,
      isTitleText: true,
      titleString: title,
      isSubtitleText: true,
      subtitleString: subtitle,
      onTap: () => _openNews(url),
    );
  }
}
