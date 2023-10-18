import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:flash_buzz/app/presentation/pages/news/widgets/news_list_tile.dart';
import 'package:flash_buzz/app/presentation/widgets/default_app_bar.dart';
import 'package:flash_buzz/app/presentation/widgets/default_loading_indicator.dart';
import 'package:flash_buzz/app/presentation/widgets/default_refresh_indicator.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  void _getData() {
    context.read<TopHeadlinesBloc>().add(const TopHeadlinesEvent());
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      _getData();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
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
          onPressed: () => context.push('/search'),
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
      onRefresh: () => _onRefresh(),
      child: BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
        builder: (context, state) {
          if (state is TopHeadlinesInitial) {
            return Container();
          } else if (state is TopHeadlinesLoading) {
            return const DefaultLoadingIndicator();
          } else if (state is TopHeadlinesLoaded) {
            List<News>? listNews = state.newsModel.articles;

            return ListView.builder(
              padding: const EdgeInsets.all(defaultMargin),
              itemCount: listNews?.length,
              itemBuilder: (context, i) {
                News? news = listNews?[i];

                return _newsListTile(news);
              },
            );
          } else {
            return Container();
          }
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

    return NewsListTile(
      isLeadingImage: true,
      leadingString: image,
      isTitleText: true,
      titleString: title,
      isSubtitleText: true,
      subtitleString: subtitle,
    );
  }
}
