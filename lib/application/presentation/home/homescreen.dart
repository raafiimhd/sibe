import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_in_banglore/application/bussiness_logic/bloc/profile/profile_bloc.dart';
import 'package:study_in_banglore/application/presentation/counselling/oneononefree.dart';
import 'package:study_in_banglore/application/presentation/home/widgets/apply_screens/apply_accommodation.dart';
import 'package:study_in_banglore/application/presentation/home/widgets/apply_screens/apply_counselling.dart';
import 'package:study_in_banglore/application/presentation/home/widgets/apply_screens/apply_events.dart';
import 'package:study_in_banglore/application/presentation/home/widgets/container_home_widget.dart';
import 'package:study_in_banglore/application/presentation/home/widgets/profile_container_widget.dart';
import 'package:study_in_banglore/application/presentation/routes/routes.dart';
import 'package:study_in_banglore/domain/core/color/colors.dart';
import 'package:study_in_banglore/domain/core/constant/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(const ProfileEvent.getProfile());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    color: AppColors.kWhite,
                  ),
                  const ProfileWidget(),
                  Positioned(
                    top: 130,
                    left: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('asset/Rectangle 1 (1).png'),
                        ),
                      ),
                      height: 200,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15),
                // child: Text(
                //   "Courses",
                //   style: TextStyle(
                //     fontFamily: 'Helvetica Neue',
                //     fontWeight: FontWeight.w500,
                //     fontSize: 20,
                //     color: AppColors.primaryColor,
                //   ),
                // ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerHomeWidget(
                    image: 'asset/fi_10455313.png',
                    text: 'Online',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.onlineCourses),
                  ),
                  ContainerHomeWidget(
                    image: 'asset/fi_1654193.png',
                    text: 'Offline',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.offlineCourses),
                  ),
                  ContainerHomeWidget(
                    image: 'asset/fi_3000745.png',
                    text: 'Short-term',
                    onTap: () => Navigator.of(context)
                        .pushNamed(Routes.shortTermCourses),
                  ),
                ],
              ),
              // const Padding(
              //   padding: EdgeInsets.only(left: 15, bottom: 20, top: 15),
              //   child: Text(
              //     "Campus",
              //     style: TextStyle(
              //       fontFamily: 'Helvetica Neue',
              //       fontWeight: FontWeight.w500,
              //       fontSize: 20,
              //       color: AppColors.primaryColor,
              //     ),
              //   ),
              // ),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerHomeWidget(
                    image: 'asset/fi_864102.png',
                    text: 'Universities',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.universities),
                  ),
                  ContainerHomeWidget(
                    image: 'asset/fi_2231649.png',
                    text: 'Colleges',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.colleges),
                  ),
                  ContainerHomeWidget(
                    image: 'asset/chat (6).png',
                    text: '1 on 1 Free\nCounselling',
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => FreeCounselling())),
                  ),
                ],
              ),
              kHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerHomeWidget(
                    image: 'asset/job.png',
                    text: 'Part Time Job',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.parttimejob),
                  ),
                  ContainerHomeWidget(
                      image: 'asset/icon-event-white.png',
                      text: 'Events',
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.eventsinbenglore);
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ContainerHomeWidget(
                        image: 'asset/home-location.png',
                        text: 'Accommodation\n      Near Me',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.accommadationList);
                        }),
                  )
                ],
              ),
              kHeight20,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 320,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 222, 221, 221),
                                offset: Offset(5.0, 5.0),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                              BoxShadow(
                                color: AppColors.kWhite,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage('asset/Group.png'),
                                    ),
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Refer and Earn',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Text(
                                        'Invite friends to get discounts',
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Share the app option
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 222, 221, 221),
                                                  offset: Offset(5.0, 5.0),
                                                  blurRadius: 10.0,
                                                  spreadRadius: 2.0,
                                                ),
                                                BoxShadow(
                                                  color: AppColors.kWhite,
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Invite Now',
                                                style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: sWidth * 0.300),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/_ÎÓÈ_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
