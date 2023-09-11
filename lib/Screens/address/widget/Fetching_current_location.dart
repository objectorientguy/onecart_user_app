import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../common_widgets/custom_elevated_button.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class FetchCurrentLocation extends StatefulWidget {
  const FetchCurrentLocation({super.key});

  @override
  State<FetchCurrentLocation> createState() => _FetchCurrentLocationState();
}

class _FetchCurrentLocationState extends State<FetchCurrentLocation> {
  String location = 'Null, Press Button';
  String addressHalf = 'Tatya Nagar,';
  String addressFull = ' Deo Nagar Nagpur';

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print(placemark);
    }
    Placemark place = placemark[0];
    addressHalf = ' ${place.subLocality}, ${place.locality}';
    addressFull =
        '${place.postalCode}, ${place.administrativeArea} ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Position position = await getCurrentPosition();
        location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
        getAddressFromLatLong(position);
      },
      child: Container(
          height: kAddressContainerWidth,
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(tinierSpacing),
            child: Column(
              children: [
                Container(
                  width: kLocationContainerWidth,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.lighterRed,
                      ),
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(kBorderDiscount)),
                  padding: const EdgeInsets.symmetric(
                      vertical: xxTinierSpacing, horizontal: xxTinierSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.my_location,
                        color: AppColor.lighterRed,
                      ),
                      const SizedBox(width: xxTinierSpacing),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Use Your Current Location',
                            style: Theme.of(context)
                                .textTheme
                                .xxxTinier
                                .copyWith(
                                    color: AppColor.lighterRed,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: xxxSmallestSpacing,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColor.lighterRed,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          addressHalf,
                          style: Theme.of(context)
                              .textTheme
                              .tinier
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: xxTiniestSpacing,
                        ),
                        Text(
                          addressFull,
                          style: Theme.of(context)
                              .textTheme
                              .xxxTinier
                              .copyWith(color: AppColor.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: smallerSpacing,
                ),
                CustomElevatedButton(
                  backgroundColor: AppColor.lighterRed,
                  onPressed: () {},
                  buttonWidth: double.maxFinite,
                  buttonHeight: kElevatedButtonHeightSmall,
                  child: const Text("Enter Complete Address"),
                ),
              ],
            ),
          )),
    );
  }
}
