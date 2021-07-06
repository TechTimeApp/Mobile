import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtime/Controllers/blocs/client/categorisBloc/categories_bloc.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Widgets/core/shimmer_effect.dart';
import 'package:techtime/widgets/client/title_image_card.dart';

class CategoriesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (_, index) {
                        return TitleImageCard(
                            category: state.categories[index]);
                      }),
                );
              }
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, i) {
                    return const ShimmerEffect(
                      child: TitleImageCard(),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
