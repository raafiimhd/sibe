import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:study_in_banglore/application/bussiness_logic/bloc/colleges/colleges_bloc.dart';
import 'package:study_in_banglore/application/presentation/colleges/colleges_details.dart';
import 'package:study_in_banglore/application/presentation/utils/snack_bar/snack_bar.dart';
import 'package:study_in_banglore/domain/core/color/colors.dart';
import 'package:study_in_banglore/domain/core/constant/const.dart';

class CollegesWidgets extends StatelessWidget {
  const CollegesWidgets({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollegesBloc, CollegesState>(
      listener: (context, state) {
        if (state.hasError) {
          showSnack(
            context: context,
            message: state.message!,
            color: AppColors.kRed,
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: LoadingAnimationWidget.inkDrop(
                color: AppColors.kGrey,
                size: 25,
              ),
            ),
          );
        } else if (state.colleges != null &&
            state.colleges!.data != null &&
            state.colleges!.data!.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.colleges!.data!.length,
              itemBuilder: (context, index) {
                final college = state.colleges!.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: sWidth * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 5, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  college.college!,
                                  style: const TextStyle(
                                      color: AppColors.kWhite, fontSize: 17),
                                  maxLines: 2,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.save_minus4,
                                  size: 30,
                                  color: AppColors.kGrey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            college.place ?? 'Kochi',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            maxLines: 2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${college.rating}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.kWhite),
                                    ),
                                    kWidth5,
                                    RatingBar.builder(
                                      initialRating: college.rating!.toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                CollegesDetailsScreen(
                                                  id: college.id!,
                                                )));
                                  },
                                  style: ButtonStyle(
                                    minimumSize:
                                        WidgetStateProperty.all<Size>(
                                            const Size(40, 40)),
                                  ),
                                  child: const Text(
                                    "Explore",
                                    style: TextStyle(color: AppColors.kBlack),
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('Colleges Not Available'),
          );
        }
      },
    );
  }
}
