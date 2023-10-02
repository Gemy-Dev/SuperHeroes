import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:super_heros/core/extensions/size.dart';

import '../../../domain/model/super_hero_model.dart';
import '../../bloc/heros_bloc/heroes_cubit.dart';
import '../../widgets/anime_hero.dart';
import '../../widgets/success_builder.dart';
import '../hero_widget.dart';

class HeroesList extends StatefulWidget {
  const HeroesList({super.key});

  @override
  State<HeroesList> createState() => _HeroesListState();
}

class _HeroesListState extends State<HeroesList> {
  final controller = CarouselController();

  ValueNotifier currenIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: double.infinity,
      child: CubitBuilder<HeroesCubit>(
        whenSccess: (state) {
          final List<SuperHeroModel> data = state.data;
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                          // <-- change this opacity
                          // Colors.transparent // <-- you might need this if you want full transparency at the edge
                        ],
                        stops: const [
                          0.05,
                          0.3,
                          0.8,
                          .95
                        ], //<-- the gradient is interpolated, and these are where the colors above go into effect (that's why there are two colors repeated)
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstOut,
                    child: ValueListenableBuilder(
                      valueListenable: currenIndex,
                      builder: (constext, index, child) => Image.network(
                        data[currenIndex.value].images!.lg!,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                left: 0,
                right: 0,
                child: CarouselSlider.builder(
                  //   carouselController: controller,
                  itemCount: data.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Column(
                      children: [
                        Expanded(
                          child: HeroCard(
                            hero: state.data[index],
                          ),
                        ),
                        TextHero(
                            tag: data[index].name! + index.toString(),
                            child: Text(
                              state.data[index].name.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.8,
                                  fontFamily: 'BebasNeue',
                                  fontSize: 20),
                            )),
                      ],
                    );
                  },
                  options: CarouselOptions(
                      animateToClosest: true,
                      enlargeCenterPage: true,
                      aspectRatio: 7 / 7,
                      clipBehavior: Clip.antiAlias,
                      enlargeFactor: .2,
                      viewportFraction: .7,
                      initialPage: currenIndex.value,
                      onPageChanged: (index, reson) =>
                          currenIndex.value = index),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
