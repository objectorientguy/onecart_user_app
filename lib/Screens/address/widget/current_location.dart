import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/search_text_field.dart';

class CurrentLocation extends StatefulWidget {
  static const routeName = 'CurrentLocation';

  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final _mapController = MapController(
    initMapWithUserPosition: const UserTrackingOption.withoutUserPosition(
      enableTracking: true
    )
  );

  var markerMap=<String,String>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      _mapController.listenerMapSingleTapping.addListener(() async {
        GeoPoint? postion=_mapController.listenerMapSingleTapping.value;
        if(postion!=null){
          await _mapController.addMarker(postion,markerIcon: const MarkerIcon(icon: Icon(Icons.pin_drop,color: Colors.blue),));
        }
        var key='${postion!.latitude}_${postion.longitude}';
        markerMap[key]=markerMap.length.toString();
      });
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GenericAppBar(
        title: "Confirm delivery location",
        style: Theme.of(context)
            .textTheme
            .xxTiny
            .copyWith(color: AppColor.black, fontWeight: FontWeight.w400),
      ),
      // bottomNavigationBar: const FetchCurrentLocation(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          OSMFlutter(
              onGeoPointClicked: (GeoPoint? geoPoint){
                var key='${geoPoint!.latitude}_${geoPoint.longitude}';
                 showModalBottomSheet(context: context, builder: (context){
                   return Card(
                     child: Padding(
                       padding: const EdgeInsets.all(8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Expanded(child:Column(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Text('Position ${markerMap[key]}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                               const Divider(thickness: 1,),
                               Text(key)
                             ],
                           )),
                           GestureDetector(
                             onTap: ()=>Navigator.pop(context),
                             child: const Icon(Icons.clear),
                           )
                         ],
                       ),
                     ),
                   );
                 });
              },
              controller: _mapController,
              // mapIsLoading: Center(child: CircularProgressIndicator(),),
              osmOption: OSMOption(
                enableRotationByGesture: true,
                showZoomController: true,
                  userLocationMarker: UserLocationMaker(
                      personMarker: const MarkerIcon(
                        icon: Icon(Icons.personal_injury_outlined),
                      ),
                      directionArrowMarker: const MarkerIcon(
                        icon: Icon(Icons.personal_injury_outlined),
                      ))),

          ),
          Padding(
            padding: const EdgeInsets.all(tinierSpacing),
            child: SearchTextField(
                hintText: 'Search for area,street name..',
                hintStyle: Theme.of(context)
                    .textTheme
                    .xxxTinier
                    .copyWith(fontWeight: FontWeight.w300),
                prefixicon: const Icon(
                  Icons.search,
                  color: AppColor.primary,
                ),
                textcontroller: myController),
          ),
        ],
      ),
    );
  }
}
