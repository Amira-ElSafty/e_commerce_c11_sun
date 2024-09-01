import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_sun/core/resources/color_manager.dart';
import 'package:flutter_e_commerece_c11_sun/core/widget/dialog_utils.dart';
import 'package:flutter_e_commerece_c11_sun/domain/di/di.dart';
import 'package:flutter_e_commerece_c11_sun/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:flutter_e_commerece_c11_sun/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter_e_commerece_c11_sun/features/main_layout/home/presentation/widgets/announcement_widget.dart';
import 'package:flutter_e_commerece_c11_sun/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabViewModel>(
      create: (context) => viewModel
        ..getAllCategories()
        ..getAllBrands(),
      child: BlocConsumer<HomeTabViewModel, HomeTabStates>(
        listener: (context, state) {
          if (state is HomeCategoryErrorState) {
            DialogUtils.showMessage(
                context: context, message: state.failures.errorMessage);
          } else if (state is HomeBrandsErrorState) {
            DialogUtils.showMessage(
                context: context, message: state.failures.errorMessage);
          } else if (state is HomeCategorySuccessState) {
            DialogUtils.showMessage(
                context: context,
                message: state.responseEntity.results?.toString() ?? '0');
          } else if (state is HomeBrandsSuccessState) {
            DialogUtils.showMessage(
                context: context,
                message: state.responseEntity.results?.toString() ?? '0');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                AnnouncementWidget(),
                SizedBox(
                  height: 20.h,
                ),
                CustomSectionBar(sectionName: 'Categories', function: () {}),
                state is HomeCategorySuccessState
                    ? SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryOrBrandWidget(
                                list: state.responseEntity.data![index]);
                          },
                          itemCount: state.responseEntity.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      )),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionName: 'Brands', function: () {}),
                state is HomeBrandsSuccessState
                    ? SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryOrBrandWidget(
                                list: state.responseEntity.data![index]);
                          },
                          itemCount: state.responseEntity.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      )),
                // CustomSectionBar(
                //   sectionNname: 'Most Selling Products',
                //   function: () {},
                // ),
                // SizedBox(
                //   child: SizedBox(
                //     height: 360.h,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const ProductCard(
                //           title: "Nike Air Jordon",
                //           description:
                //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                //           rating: 4.5,
                //           price: 1100,
                //           priceBeforeDiscound: 1500,
                //           image: ImageAssets.categoryHomeImage,
                //         );
                //       },
                //       itemCount: 20,
                //     ),
                //   ),
                // ),
                SizedBox(height: 12.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
