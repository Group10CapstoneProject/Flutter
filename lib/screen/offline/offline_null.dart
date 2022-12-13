// import 'package:capstone_alterra_flutter/model/offline_model.dart';
// import 'package:capstone_alterra_flutter/provider/offline_provider.dart';
// import 'package:capstone_alterra_flutter/styles/theme.dart';
// import 'package:capstone_alterra_flutter/util/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class OfflineCoba extends StatefulWidget {
//   const OfflineCoba({super.key});

//   @override
//   State<OfflineCoba> createState() => _OfflineCobaState();
// }

// class _OfflineCobaState extends State<OfflineCoba> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       print('3');
//       final OfflineProvider provider =
//           Provider.of<OfflineProvider>(context, listen: false);
//       print('5');
//       provider.getOfflineClass('2022-12-02', 1, 'DESC');
//       print('4');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final OfflineProvider provider =
//     //     Provider.of<OfflineProvider>(context, listen: false);
//     // provider.getOfflineClass;
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Consumer<OfflineProvider>(
//               builder: (context, value, child) {
//                 final result = value.offline;
//                 var data = result.data;
//                 return (data != null)
//                     ? ListView(
//                         children: [
//                           for (OfflineClass i in data.offlineClasses!)
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 16),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(18),
//                                 child: SizedBox(
//                                   height: 163,
//                                   child: Stack(
//                                     children: [
//                                       Image.network(
//                                         i.picture ?? '',
//                                         height: 163,
//                                         fit: BoxFit.cover,
//                                         width: double.infinity,
//                                       ),
//                                       Container(
//                                         height: 163,
//                                         decoration: BoxDecoration(
//                                           color: const Color(0xFF1A4B5F)
//                                               .withOpacity(0.8),
//                                           borderRadius:
//                                               BorderRadius.circular(18),
//                                         ),
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 12),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   i.time.toString(),
//                                                   style: kHeading6.copyWith(
//                                                       color: whiteColor),
//                                                 ),
//                                                 const SizedBox(
//                                                   height: 12.0,
//                                                 ),
//                                                 Text(
//                                                   i.duration.toString(),
//                                                   style: kSubtitle1.copyWith(
//                                                       color: whiteColor),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               Text(
//                                                 i.title.toString(),
//                                                 style: kHeading6.copyWith(
//                                                     color: whiteColor),
//                                               ),
//                                               Text(
//                                                 'With Maya',
//                                                 style: kSubtitle1.copyWith(
//                                                     color: whiteDark),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.group_add_sharp,
//                                                     color: primaryLight,
//                                                     size: 24,
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 5.0,
//                                                   ),
//                                                   Text(
//                                                     i.slot.toString(),
//                                                     style: kSubtitle2.copyWith(
//                                                         color: whiteColor),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text(
//                                                       Utils.currencyFormat(
//                                                           i.price!),
//                                                       style:
//                                                           kSubtitle1.copyWith(
//                                                               color:
//                                                                   whiteColor)),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                             children: [
//                                               Container(
//                                                 margin: const EdgeInsets.only(
//                                                     bottom: 16),
//                                                 height: 32,
//                                                 width: 70,
//                                                 child: TextButton(
//                                                   onPressed: () {
//                                                     // Navigator.push(
//                                                     //   context,
//                                                     //   MaterialPageRoute(
//                                                     //     builder: (context) => OfflineBook(
//                                                     //       title: offline,
//                                                     //       teacher: teacher,
//                                                     //       price: price,
//                                                     //       minute: hour,
//                                                     //     ),
//                                                     //   ),
//                                                     // );
//                                                   },
//                                                   style: TextButton.styleFrom(
//                                                     backgroundColor:
//                                                         primaryBase,
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                     ),
//                                                   ),
//                                                   child: Text(
//                                                     'BOOK',
//                                                     style: kButton.copyWith(
//                                                         color: whiteColor),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       )
//                     : SizedBox();
//                 // child: Text(result.data!.offlineClasses![index].picture));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
