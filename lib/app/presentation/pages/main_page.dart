import 'package:flash_buzz/app/presentation/bloc/page/page_bloc.dart';
import 'package:flash_buzz/app/presentation/widgets/default_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: DefaultBottomNavigationBar().pages.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: DefaultBottomNavigationBar().items,
            currentIndex: selectedIndex,
            onTap: (index) {
              context.read<PageBloc>().add(PageIndexChanged(index));
            },
          ),
        );
      },
    );
  }
}
