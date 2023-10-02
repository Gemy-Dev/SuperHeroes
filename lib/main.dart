import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_heros/config/themes/app_colors.dart';
import 'package:super_heros/config/themes/app_themes.dart';
import 'package:super_heros/core/extensions/size.dart';
import 'package:super_heros/dependency_injection.dart';
import 'package:super_heros/presentation/bloc/hero_search.dart/hero_search_cubit.dart';
import 'package:super_heros/presentation/bloc/heros_bloc/heroes_cubit.dart';
import 'package:super_heros/presentation/bloc/villain_bloc/villain_cubit.dart';
import 'package:super_heros/presentation/screens/home/home_screen.dart';
import 'dependency_injection.dart' as di;
import 'presentation/widgets/overlay_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => di.sl<HeroesCubit>()..getHeroesData()),
          BlocProvider(
              create: (context) => di.sl<VillainCubit>()..getHeroesData()),
          BlocProvider(create: (context) => di.sl<HeroSearchCubit>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.light,
          navigatorKey: SharedContext.key,
          home: OverlayWidget(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        //  tileMode: TileMode.clamp,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      AppColor.blac,
                      // Color.fromARGB(255, 47, 17, 21).withOpacity(1),
                      AppColor.darkGrey,
                    ])),
                child: const HomeScreen()),
          ),
        ));
  }
}
