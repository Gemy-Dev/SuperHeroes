import 'package:flutter/material.dart';
import 'package:super_heros/config/themes/app_colors.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/presentation/screens/details/details_card.dart';
import 'package:super_heros/presentation/widgets/animation_arc.dart';
import 'package:super_heros/presentation/widgets/animation_text.dart';
import 'package:super_heros/presentation/widgets/anime_hero.dart';
import 'package:super_heros/presentation/widgets/custom_container.dart';

class HeroDetailsScreen extends StatelessWidget {
  const HeroDetailsScreen({super.key, required this.hero, required this.index});
  final SuperHeroModel hero;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              AppColor.blac,
              AppColor.darkGrey,
            ])),
        child: Stack(
          children: [
            ListView(children: [
              Hero(
                  tag: hero.images!.lg! + index.toString(),
                  child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0),
                            // <-- change this opacity
                            // Colors.transparent // <-- you might need this if you want full transparency at the edge
                          ],
                          stops: const [
                            .01,
                            .5
                          ], //<-- the gradient is interpolated, and these are where the colors above go into effect (that's why there are two colors repeated)
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstOut,
                      child: Image(
                        //  height: 70.h,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        image: NetworkImage(hero.images!.lg!, scale: 1),
                      ))),
              TextHero(
                  tag: hero.name! + index.toString(),
                  child: Text(
                    hero.name!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              CustomContainer(
                child: AnimeText(
                  text: 'Slug',
                  title: hero.slug.toString(),
                ),
              ),
              //////////////////////////
              /// _DetailsCard(
              DetailsCard(
                  title: "Power State",
                  child: hero.powerStats!.powerState
                      .map((e) => ListTile(
                          leading: Text(e.key,
                              style: const TextStyle(
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20)),
                          titleAlignment: ListTileTitleAlignment.center,
                          title: AnimationArc(
                            value: e.value?.toDouble() ?? 0,
                            activeColor: AppColor.darkRed,
                          )))
                      .toList()),
              DetailsCard(
                  title: "Apperance",
                  child: hero.appearance!.appearance
                      .where((element) => element.value != null)
                      .map((e) {
                    return AnimeText(title: e.key, text: e.value.toString());
                  }).toList()),

              ///////////////////////
              ///
              DetailsCard(
                title: 'Biography',
                child: hero.biography!.biography
                    .where(
                      (element) => element.value != null,
                    )
                    .map(
                      (e) => AnimeText(
                        title: e.key,
                        text: e.value.toString(),
                      ),
                    )
                    .toList(),
              ),

              //////////////////////

              DetailsCard(
                  title: "Work",
                  child: hero.work!.work
                      .where((element) => element.value != null)
                      .map(
                        (e) => AnimeText(
                          title: e.key,
                          text: e.value.toString(),
                        ),
                      )
                      .toList()),
              DetailsCard(
                  title: "Connections",
                  child: hero.connections!.connections
                      .where((element) => element.value != null)
                      .map(
                        (e) => AnimeText(
                          title: e.key,
                          text: e.value.toString(),
                        ),
                      )
                      .toList()),

              CustomContainer(
                child: AnimeText(
                  text: 'Slug',
                  title: hero.slug.toString(),
                ),
              ),

              Text(hero.work?.occupation?.toString() ?? ''),
              Text(hero.work?.baze?.toString() ?? ''),
            ]),
            IconButton(
                padding: const EdgeInsets.all(20),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios))
          ],
        ),
      ),
    );
  }
}
