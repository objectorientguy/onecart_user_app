import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class AddressBar extends StatefulWidget {
  const AddressBar({
    super.key,
  });

  @override
  State<AddressBar> createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  String location = 'Null, Press Button';
  String address = 'Akshay Nagar';

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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  // void getCurrentPosition() async{
  //   LocationPermission permission = await Geolocator.checkPermission();
  //
  //   if(permission == LocationPermission.denied ||
  //   permission == LocationPermission.deniedForever)
  //     {
  //       print("Permission Not Given");
  //       LocationPermission asked = await Geolocator.requestPermission();
  //     }
  //   else {
  //     Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  //   print("Longitude: " +currentPosition.longitude.toString());
  //   // print("Latitude:" +currentPosition.latitude.toString());
  //     print("Fetch location");
  //
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColor.primary,
              size: kLocationIconSize,
            ),
            const SizedBox(
              width: xxTiniestSpacing,
            ),
            TextButton(
                onPressed: () async {
                  Position position = await getCurrentPosition();
                  location =
                      'Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                  // getCurrentPosition();
                },
                child: Text('Home',
                    style: Theme.of(context).textTheme.headingTiny)),
            const SizedBox(
              width: xxxTiniestSpacing,
            ),
            const Center(
                heightFactor: kLocationIconHeightFactor,
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.primary,
                  size: kLocationIconSize,
                ))
          ],
        ),
        const SizedBox(
          height: xxTiniestSpacing,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: xxSmallerSpacing,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              '${address}',
              style: Theme.of(context).textTheme.subHeadingMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
