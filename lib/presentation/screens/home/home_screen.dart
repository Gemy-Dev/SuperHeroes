import 'package:flutter/material.dart';

import 'package:super_heros/config/themes/app_colors.dart';

import 'package:super_heros/presentation/screens/home/heroes_view.dart';

import '../search_bar/animated_appbar.dart';
import 'villains_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.navy.withOpacity(.5),
      body: const SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            centerTitle: true,
            flexibleSpace: AnimatedAppBar(),
            backgroundColor: Colors.transparent,
            toolbarHeight: 120,
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            HeroesList(),
          ])),
          SliverList(delegate: SliverChildListDelegate.fixed([VillainList()])),
        ]),
      ),
    );
  }
}
