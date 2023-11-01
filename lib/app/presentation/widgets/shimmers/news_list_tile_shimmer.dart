import 'package:flash_buzz/app/presentation/widgets/default_shimmer.dart';
import 'package:flash_buzz/app/presentation/widgets/news_list_tile.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

class NewsListTileShimmer extends StatelessWidget {
  const NewsListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(defaultMargin),
      itemCount: 10,
      itemBuilder: (_, i) {
        return NewsListTile(
          leading: DefaultShimmer(
            width: 96,
            height: 64,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          title: DefaultShimmer(
            width: 200,
            height: 16,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          subtitle: DefaultShimmer(
            width: 160,
            height: 16,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        );
      },
    );
  }
}
