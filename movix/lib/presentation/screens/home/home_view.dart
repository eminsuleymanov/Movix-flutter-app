import 'package:flutter/material.dart';

import '../../../core/bottom_navigation/app_navigation_bar.dart';
import '../../../core/bottom_navigation/navigation_views.dart';

class HomeView extends StatefulWidget {
  const HomeView({ super.key });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationViews(currentIndex: _currentIndex),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}