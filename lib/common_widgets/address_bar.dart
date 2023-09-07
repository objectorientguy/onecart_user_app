import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../blocs/address_bloc/address_bloc.dart';
import '../blocs/address_bloc/address_event.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import 'address_bottom_sheet.dart';

class AddressBar extends StatefulWidget {
  const AddressBar({
    super.key,
  });

  @override
  State<AddressBar> createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  String location = 'Null, Press Button';
  String address = 'Akshay Nagar 1st Block 1st Cross, Rammurthy nagar...';

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
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(FetchAddress());

    return InkWell(
      onDoubleTap: () {
        Scaffold.of(context).showBottomSheet<void>(
            elevation: xxTinierSpacing,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(smallCardCurve),
                    topLeft: Radius.circular(smallCardCurve))),
            (BuildContext context) {
          return const AddressBottomSheet();
        });
      },
      onTap: () async {
        Position position = await getCurrentPosition();
        location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
        getAddressFromLatLong(position);
        // getCurrentPosition();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: AppColor.primary,
                size: kLocationIconSize,
              ),
              const SizedBox(
                width: xxxTiniestSpacing,
              ),
              Text('Home', style: Theme.of(context).textTheme.headingTiny),
              const SizedBox(
                width: xxxTiniestSpacing,
              ),
              const Center(
                heightFactor: kLocationIconHeightFactor,
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.primary,
                  size: kLocationIconSize,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kCircleAvatarRadius,
            ),
            child: SizedBox(
              child: Text(
                address,
                style: Theme.of(context).textTheme.subHeadingMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
