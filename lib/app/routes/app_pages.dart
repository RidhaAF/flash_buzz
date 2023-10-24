import 'package:flash_buzz/app/presentation/pages/main_page.dart';
import 'package:flash_buzz/app/presentation/pages/news/news_web_view_page.dart';
import 'package:flash_buzz/app/presentation/pages/search/search_page.dart';
import 'package:flash_buzz/app/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppPages {
  static final GoRouter pages = GoRouter(
    initialLocation: AppRoutes.news,
    routes: [
      GoRoute(
        path: AppRoutes.news,
        name: 'news',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: AppRoutes.newsWebView,
        name: 'news-web-view',
        builder: (context, state) {
          final String title = state.pathParameters['title'] ?? '';
          final String url = state.pathParameters['url'] ?? '';

          return NewsWebViewPage(
            title: title,
            url: url,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.search,
        name: 'search',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.favorites,
        name: 'favorites',
        builder: (context, state) => const MainPage(),
      ),
    ],
  );
}
