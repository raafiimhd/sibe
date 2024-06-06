import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:study_in_banglore/application/bussiness_logic/bloc/profile/profile_bloc.dart';
import 'package:study_in_banglore/application/presentation/home/widgets/places_widget.dart';
import 'package:study_in_banglore/application/presentation/utils/global_variable.dart';
import 'package:study_in_banglore/domain/core/color/colors.dart';
import 'package:study_in_banglore/domain/core/constant/const.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 220,
      color: AppColors.primaryColor,
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: LoadingAnimationWidget.inkDrop(
                  color: AppColors.kGrey, size: 25),
            ),
          );
        } else if (state.profileModel != null &&
            state.profileModel!.data != null) {
          userId = state.profileModel!.data!.id!;
          userName =
              "${state.profileModel!.data!.firstName} ${state.profileModel!.data!.lastName}";
          phoneNum = state.profileModel!.data!.phoneNumber!;
          return Padding(
            padding: const EdgeInsets.only(top: 40, left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: screenSize.height * 0.04,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    )),
                kWidth10,
                Padding(
                  padding: const EdgeInsets.only( left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi ${state.profileModel!.data!.lastName},',
                            style: const TextStyle(
                                color: AppColors.kWhite,
                                fontWeight: FontWeight.w100,
                                fontSize: 14),
                          ),
                          kWidth80,
                          PlacesWidget()
                        ],
                      ),

                      Text(
                        '${state.profileModel!.data!.firstName} ${state.profileModel!.data!.lastName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kWhite,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(
              'Profile not available',
              style: TextStyle(color: AppColors.kWhite),
            ),
          );
        }
      }),
    );
  }
}
