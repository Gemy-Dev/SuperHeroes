import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_heros/config/themes/app_colors.dart';
import 'package:super_heros/core/constant.dart';
import 'package:super_heros/core/extensions/size.dart';
import 'package:super_heros/presentation/bloc/hero_search.dart/hero_search_cubit.dart';

import '../../widgets/overlay_widget.dart';

const duration = Duration(milliseconds: 300);

class AnimatedAppBar extends StatefulWidget {
  const AnimatedAppBar({super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar>
    with TickerProviderStateMixin {
  bool isBtnMoved = false;
  bool isSearchOpen = false;
  void changeBtnState(bool value) async {
    if (value) {
      isBtnMoved = value;
      setState(() {});
      await Future.delayed(AppDuration.durationfast);
      isSearchOpen = value;
      ShowOverlay.instance.changSearchOverlay(value);
      setState(() {});
    } else {
      isSearchOpen = value;
      ShowOverlay.instance.changSearchOverlay(value);
      setState(() {});
      await Future.delayed(AppDuration.durationfast);
      isBtnMoved = value;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: AppDuration.durationfast,
              top: isBtnMoved ? 30 : 0,
              left: isBtnMoved ? 20 : 0,
              child: SearchButton(
                onTap: () => changeBtnState(true),
                onClose: () => changeBtnState(false),
                isOpen: isSearchOpen,
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Super Hero',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.red, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}

class SearchButton extends StatefulWidget {
  const SearchButton(
      {super.key,
      required this.onTap,
      required this.onClose,
      required this.isOpen});
  final VoidCallback onTap;
  final VoidCallback onClose;
  final bool isOpen;

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.darkGrey),
          duration: AppDuration.durationfast,
          width: widget.isOpen ? 100.w - 70 : 50,
          height: 50,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search),
              ),
              //  if (isOpen)
              Expanded(
                child: AnimatedOpacity(
                  duration: AppDuration.durationfast,
                  opacity: widget.isOpen ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      onChanged: (value) async {
                        await context.read<HeroSearchCubit>().getSearch(value);
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: AppColor.grey,
                          filled: true),
                    ),
                  ),
                ),
              ),
              // if (isOpen)
              AnimatedContainer(
                  duration: AppDuration.durationfast,
                  width: widget.isOpen ? 50 : 0,
                  child: IconButton(
                    onPressed: widget.onClose,
                    icon: !widget.isOpen
                        ? const SizedBox()
                        : const Icon(Icons.arrow_back_ios),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(40, 60),
                        backgroundColor: Colors.transparent),
                  ))
            ],
          ),
        ));
  }
}
