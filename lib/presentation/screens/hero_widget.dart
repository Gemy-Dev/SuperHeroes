import 'package:flutter/material.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/presentation/screens/details/hero_details_screen.dart';

class HeroCard extends StatefulWidget {
  final SuperHeroModel hero;

  const HeroCard({
    super.key,
    required this.hero,
  });

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  double fade = 0;
  @override
  void initState() {
    fade = 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.hero.id);
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HeroDetailsScreen(
                    hero: widget.hero,
                    index: 52855,
                  ))),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(
              //     image: NetworkImage(widget.hero.images!.lg.toString()),
              //     fit: BoxFit.fill),
            ),
            child: AnimatedOpacity(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 600),
                opacity: fade,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: widget.hero.images!.lg!,
                    child: FadeInImage(
                      excludeFromSemantics: true,
                      fadeInCurve: Curves.linear,
                      fadeInDuration: Duration(milliseconds: 300),
                      placeholder: NetworkImage(
                        widget.hero.images!.xs.toString(),
                      ),
                      image: NetworkImage(
                        widget.hero.images!.lg.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
        ));
  }
}
