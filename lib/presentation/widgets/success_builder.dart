import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_heros/presentation/bloc/base/base_cubit.dart';

import '../bloc/base/base_state.dart';

 class CubitBuilder<B extends BaseCubit<dynamic,BaseState<dynamic>>> extends StatelessWidget {
  

 const  CubitBuilder({super.key, required this.whenSccess, });

  final Widget Function(BaseState state) whenSccess;
 
  @override
  Widget build(BuildContext context) {

  return  BlocBuilder<B,BaseState>(builder:(context,state){
 if (state is LoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is FailedState) {
      return const Center(
        child: Icon(Icons.refresh),
      );
    } else if (state is SuccessState) {
      return whenSccess(state);
    } else {
      return const SizedBox();
    }
    } ,);
   
  }
}
