
import 'package:flutter/material.dart';

import 'package:super_heros/core/extensions/size.dart';
import 'package:super_heros/presentation/widgets/custom_container.dart';

class AnimeText extends StatelessWidget {
  const AnimeText(
      {super.key,
      required this.title,
      required this.text,
    
    });
  final String title;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 5,
      margin: 5,
      padding: 0,
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Positioned(
            //     left: !isFromBottom ? _animation.value - 200 : 0,
            //     bottom: isFromBottom ? _animation.value - 200 : 0,
            //     child:
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            )
            // ),
            ,

            // Positioned(
            //     right: !isFromBottom ? _animation.value - 200 : 0,
            //     bottom: isFromBottom ? _animation.value - 200 : 0,
            //     child:
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
            //),
          ],
        ),
      ),
    );
  }
}

enum AnimeTextDirect { leftAndRight, bottomToTop }
