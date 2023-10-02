import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_heros/config/themes/app_colors.dart';
import 'package:super_heros/core/extensions/size.dart';
import 'package:super_heros/presentation/bloc/hero_search.dart/hero_search_cubit.dart';

import '../../widgets/overlay_widget.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

bool isShow = false;
bool showCloseButton = false;

class _MyAppBarState extends State<MyAppBar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _animationController2;
  late Animation<double> _animation2;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation2 = Tween<double>(begin: 1, end: 0).animate(_animationController);
    _animationController2.addListener(() {
      setState(() {});
    });
    _animationController2.forward();

    super.initState();
  }

  void hideButton() {
    _animation.addListener(() {
      if (_animation.isCompleted) {
        _animation2 =
            Tween<double>(begin: 1, end: 0).animate(_animationController2);
        setState(() {});
      }
    });
    _animationController.reset();
    _animationController.reverse();
  }
  // void hideButton() {
  //   _animation.addListener(() {
  //     if (_animation.isCompleted) {
  //       _animation =
  //           Tween<double>(begin: 1, end: 0).animate(_animationController);
  //       setState(() {});
  //     }
  //   });
  //   _animationController.reset();
  //   _animationController.reverse();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _animation.value * 50,
                height: _animation.value * 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(50, 50),
                        backgroundColor: AppColor.darkGrey),
                    onPressed: () async {
                      hideButton();
                      Future.delayed(Duration(seconds: 3));
                      isShow = true;
                      ShowOverlay.instance.changSearchOverlay(true);
                      setState(() {});
                      await Future.delayed(Duration(milliseconds: 200));
                      showCloseButton = true;
                      setState(() {});
                    },
                    child: isShow ? SizedBox() : Icon(Icons.search)),
              ),
              Spacer(),
              Text(
                'Super Heroes',
              ),
              Spacer(),
            ]),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: isShow ? 90.w : _animation2.value * 50,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.darkGrey),
              padding: EdgeInsets.zero,
              width: isShow ? 90.w : 60,
              height: 60,
              duration: Duration(milliseconds: 300),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(60, 60),
                          backgroundColor: AppColor.darkGrey),
                      onPressed: () async {
                        isShow = true;
                        ShowOverlay.instance.changSearchOverlay(true);
                        setState(() {});
                        await Future.delayed(Duration(milliseconds: 200));
                        showCloseButton = true;
                        setState(() {});
                      },
                      child: Icon(Icons.search)),
                  Expanded(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: isShow ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          onChanged: (value) async {
                            await context
                                .read<HeroSearchCubit>()
                                .getSearch(value);
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: AppColor.grey,
                              filled: true),
                        ),
                      ),
                    ),
                  ),
                  if (showCloseButton)
                    AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: showCloseButton ? 1 : 0,
                        child: IconButton(
                          onPressed: () => setState(() {
                            ShowOverlay.instance.changSearchOverlay(false);
                            isShow = false;
                            showCloseButton = false;
                          }),
                          icon: Icon(Icons.arrow_back_ios),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(40, 60),
                              backgroundColor: Colors.transparent),
                        ))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
