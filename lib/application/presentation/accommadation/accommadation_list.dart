import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:study_in_banglore/application/bussiness_logic/bloc/bloc/accommodation_bloc.dart';
import 'package:study_in_banglore/application/presentation/utils/customs/cusom_app_bar.dart';
import 'package:study_in_banglore/application/presentation/utils/snack_bar/snack_bar.dart';
import 'package:study_in_banglore/domain/core/color/colors.dart';
import 'package:study_in_banglore/domain/models/accommodation_model/query_accommodation.dart';

class AccommodationList extends StatelessWidget {
  AccommodationList({super.key});
  var height, width;

final List<Uri> uris = [
    Uri.parse('https://www.nobroker.in/'),
    Uri.parse('https://www.justdial.com/'),
    Uri.parse('https://zolostays.com/'),
    Uri.parse('https://www.magicbricks.com/'),
    Uri.parse('https://www.your-space.in/'),
    Uri.parse('https://www.rentmystay.com/'),
  ];

  Future<void> _launchMultipleUrls() async {
    for (Uri url in uris) {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    height = screenSize.height;
    width = screenSize.width;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Request the current position
      // Position position = await _determinePosition();

      // Define the radius
      // int radius = 10; // Adjust as needed

      // Dispatch the event to the bloc with the obtained location and radius
      context.read<AccommodationBloc>().add(
        AccommodationEvent.getAccommodation(
          queryModel: QueryAccommodation(
            latitude: 12.9925,
            longitude: 77.5784,
            radius: 10,
            page: 1,
            limit: 100,
          ),
        ),
      );
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(title: 'Accommodation Near Me'),
      ),
      body: BlocConsumer<AccommodationBloc, AccommodationState>(
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
          } else if (state.accommodationModel != null &&
              state.accommodationModel!.data != null &&
              state.accommodationModel!.data!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final accommodation = state.accommodationModel!.data![index];
                  return ListTile(
                    leading: Container(
                      width: width * 0.3,
                      height: width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(accommodation.logo!),
                        ),
                      ),
                    ),
                    title: Text(
                      accommodation.title!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(accommodation.distance.toString()),
                        Text(
                          accommodation.price!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primaryColor,
                        ),
                      ),
                      onPressed: _launchMultipleUrls,
                      child: Text(
                        'Apply',
                        style: TextStyle(color: AppColors.kWhite),
                      ),
                    ),
                  );
                },
                itemCount: state.accommodationModel!.data!.length,
              ),
            );
          } else {
            return Center(
              child: Text('Accommodation Not Available'),
            );
          }
        },
      ),
    );
  }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }
}
