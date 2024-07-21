

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/category/cubit/category_cubit.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import 'category_box.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    return SizedBox(
      height: 40.h,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategorySuccess) {
            final categories = state.categories;
            // log("$categories");
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryBox(
                  category: categories[index].name,
                  isSelected: state.selectedIndex == index,
                  onTap: () {
                    log("Selected Index: ${state.selectedIndex}");
                    log("Index: $index");
                     cubit.selectCategory(index);
                  },
                );
              },
              separatorBuilder: (_, i) => AppSizedboxes.w10,
              itemCount: categories.length,
            );
          } else if (state is CategoryNetworkError) {
            return const Center(
                child: Text('Network error. Please try again.'));
          } else {
            return const Center(child: Text('Unknown state.'));
          }
        },
      ),
    );
  }
}
