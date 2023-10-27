import 'package:flash_buzz/app/presentation/pages/favorites/favorites_page.dart';
import 'package:flash_buzz/app/presentation/pages/news/news_page.dart';
import 'package:flash_buzz/app/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';

class DefaultBottomNavigationBar {
  final List pages = [
    const NewsPage(),
    const SearchPage(),
    const FavoritesPage(),
  ];

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.newspaper_rounded),
      label: 'News',
      tooltip: 'News',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search_rounded),
      label: 'Search',
      tooltip: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_rounded),
      label: 'Favorites',
      tooltip: 'Favorites',
    ),
  ];
}
