// import 'package:capstone_alterra_flutter/model/offline_model.dart';
// import 'package:capstone_alterra_flutter/styles/theme.dart';
// import 'package:capstone_alterra_flutter/util/utils.dart';
// import 'package:flutter/material.dart';

// class OfflineCard extends StatelessWidget {
//   const OfflineCard({
//     super.key,
//     required this.offline,
//   });

//   final OfflineClass offline;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(18),
//         child: SizedBox(
//           height: 163,
//           child: Stack(
//             children: [
//               Image.network(
//                 offline.picture.toString(),
//                 height: 163,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//               Container(
//                 height: 163,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF1A4B5F).withOpacity(0.8),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Text(
//                         //   offline.time.toString(),
//                         //   style: kHeading6.copyWith(color: whiteColor),
//                         // ),
//                         const SizedBox(
//                           height: 12.0,
//                         ),
//                         // Text(
//                         //   offline.duration.toString(),
//                         //   style: kSubtitle1.copyWith(color: whiteColor),
//                         // )
//                       ],
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         offline.title.toString(),
//                         style: kHeading6.copyWith(color: whiteColor),
//                       ),
//                       Text(
//                         'With Maya',
//                         style: kSubtitle1.copyWith(color: whiteDark),
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.group_add_sharp,
//                             color: primaryLight,
//                             size: 24,
//                           ),
//                           const SizedBox(
//                             width: 5.0,
//                           ),
//                           Text(
//                             offline.slot.toString(),
//                             style: kSubtitle2.copyWith(color: whiteColor),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(Utils.currencyFormat(offline.price!),
//                               style: kSubtitle1.copyWith(color: whiteColor)),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 16),
//                         height: 32,
//                         width: 70,
//                         child: TextButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) => OfflineBook(
//                             //       title: offline,
//                             //       teacher: teacher,
//                             //       price: price,
//                             //       minute: hour,
//                             //     ),
//                             //   ),
//                             // );
//                           },
//                           style: TextButton.styleFrom(
//                             backgroundColor: primaryBase,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: Text(
//                             'BOOK',
//                             style: kButton.copyWith(color: whiteColor),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
