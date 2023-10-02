import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:super_heros/config/themes/app_colors.dart';
import 'package:super_heros/core/extensions/go_to.dart';
import 'package:super_heros/core/extensions/size.dart';

import 'package:super_heros/presentation/bloc/hero_search.dart/hero_search_cubit.dart';

import 'package:super_heros/presentation/widgets/anime_hero.dart';
import 'package:super_heros/presentation/widgets/success_builder.dart';

import '../../core/constant.dart';
import '../screens/details/hero_details_screen.dart';
import 'custom_container.dart';

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final provider = ShowOverlay.instance;

    return ListenableBuilder(
        listenable: provider,
        builder: (context, _) {
          return Stack(alignment: Alignment.center, children: [
            child,
            !provider.showSearchOverLay
                ? const SizedBox()
                : BlurBackDrop(provider: provider),
            CardShowImage(provider: provider)
          ]);
        });
  }
}

class BlurBackDrop extends StatelessWidget {
  const BlurBackDrop({
    super.key,
    required this.provider,
  });

  final ShowOverlay provider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130,
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: provider.showSearchOverLay ? 5.0 : 0,
              sigmaY: provider.showSearchOverLay ? 5.0 : 0),
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

class CardShowImage extends StatelessWidget {
  const CardShowImage({
    super.key,
    required this.provider,
  });

  final ShowOverlay provider;

  @override
  Widget build(BuildContext context) {
    // to get card from bottm to up and reverse
    return AnimatedPositioned(
      curve: Curves.easeInExpo,
      duration: AppDuration.durationLate,
      top: provider.showSearchOverLay ? 150 : 100.h,
// to make card small before close or make it larg after get from bottom
      child: AnimatedContainer(
        duration: AppDuration.durationfast,
        width: !provider.isOpen ? 50 : 80.w,
        height: !provider.isOpen ? 50 : 70.h,
        child: Material(
          color: Colors.transparent,
          child: Container(
              constraints: BoxConstraints(
                maxWidth: 80.w,
                maxHeight: 70.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.darkGrey),
              child: CubitBuilder<HeroSearchCubit>(
                whenSccess: (state) {
                  final image = state.data?.images;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        // i use 1200 for this not have index and  you can chose any number but this
                        // must be large the list of super hero or villaine list
                        // goTo is an extinsion on Bulid context this for Navigator and make code easy
                        onTap: () => context.goTo(
                            HeroDetailsScreen(hero: state.data!, index: 1200)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: image == null
                              ? Icon(Icons.refresh)
                              : Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Hero(
                                      tag: image.lg! + 1200.toString(),
                                      child: FadeInImage(
                                        width: 80.w,
                                        height: 70.h,
                                        fit: BoxFit.cover,
                                        placeholder: NetworkImage(image.xs!),
                                        image: NetworkImage(
                                          image.lg!,
                                        ),
                                      ),
                                    ),
                                    CustomContainer(
                                      color: AppColor.blac.withOpacity(.6),
                                      width: double.infinity,
                                      child: TextHero(
                                        tag:
                                            state.data!.name! + 1200.toString(),
                                        child: Text(
                                          state.data!.name!,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                        )),
                  );
                },
              )),
        ),
      ),
    );
  }
}

class ShowOverlay extends ChangeNotifier {
  ShowOverlay._();
  static final _instace = ShowOverlay._();
  static ShowOverlay get instance => _instace;
  bool showSearchOverLay = false;
  bool isOpen = false;
  void changSearchOverlay(bool value) async {
    if (!value) {
      isOpen = value;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 600));
      showSearchOverLay = value;
      notifyListeners();
    } else {
      notifyListeners();
      showSearchOverLay = value;
      await Future.delayed(Duration(milliseconds: 600));
      isOpen = value;
      notifyListeners();
    }
  }
}
