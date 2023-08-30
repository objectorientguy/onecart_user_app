// import 'package:flutter/cupertino.dart';
//
// class ImageZoomSection extends StatefulWidget {
//   final List imageListOne ;
//    ImageZoomSection({super.key,  required this.imageListOne});
//
//   @override
//   State<ImageZoomSection> createState() => _ImageZoomSectionState();
// }
//
// class _ImageZoomSectionState extends State<ImageZoomSection> {
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         const SizedBox(
//           height: 40,
//         ),
//         SizedBox(
//           height: 200,
//           width: 200,
//           child: PageView.builder(
//               itemCount: widget.imageList.length,
//               pageSnapping: true,
//               controller: _pageController,
//               onPageChanged: (page) {
//                 setState(() {
//                   currentIndex = page;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: (){
//
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     margin: const EdgeInsets.all(8),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Image.network(
//                         widget.imageList[index].toString(),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//         ),
//         Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(widget.imageList.length, (index) {
//               if (index == currentIndex) {
//                 return const Icon(
//                   Icons.circle,
//                   color: AppColor.primary,
//                   size: 12,
//                 );
//               }
//               return const Icon(
//                 Icons.circle,
//                 color: AppColor.grey,
//                 size: 10,
//               );
//             })),
//         const SizedBox(
//           height: 20,
//         ),
//       ],
//     );
//   }
// }
