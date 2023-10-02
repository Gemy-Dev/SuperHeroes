import 'package:flutter/material.dart';

import '../../../config/themes/app_colors.dart';
import '../../bloc/villain_bloc/villain_cubit.dart';
import '../../widgets/anime_hero.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/success_builder.dart';
import '../details/hero_details_screen.dart';

class VillainList extends StatelessWidget {
  const VillainList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Villain',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.grey, letterSpacing: 2),
            ),
          ),
          Expanded(
            child: CubitBuilder<VillainCubit>(
              whenSccess: (state) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final villain = state.data[index];
                      final image = villain.images?.lg;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HeroDetailsScreen(
                                          hero: villain,
                                          index: index,
                                        )));
                          },
                          child: CustomContainer(
                            //  width: 80.w,
                            color: AppColor.darkBlue,
                            padding: 10,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: (image != null)
                                      ? Hero(
                                          tag: image + index.toString(),
                                          child: Image.network(image,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover))
                                      : const Icon(Icons.refresh),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextHero(
                                          tag: villain.name! + index.toString(),
                                          child: Text(
                                            villain.name ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        Text(
                                          villain.biography?.publisher ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          villain.slug ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
