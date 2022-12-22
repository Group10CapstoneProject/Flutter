import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/provider/offline_provider.dart';
import 'package:capstone_alterra_flutter/screen/offline/offline_book.dart';
import 'package:capstone_alterra_flutter/screen/offline/offline_filter.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/state_enum.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({super.key});

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  bool isSelected = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DateTime time = DateTime.now();
      String date = Utils.timeDate(time);
      final OfflineProvider provider =
          Provider.of<OfflineProvider>(context, listen: false);
      provider.getOfflineClass(time: date, categoryId: 1, orderByPrice: 'DESC');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Filter
          filter(),

          const SizedBox(
            height: 14.0,
          ),

          cardClass(),
        ],
      ),
    );
  }

  // Kumpulan Filter
  Widget filter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: whiteBase,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OfflineFilterScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.tune,
                color: blackColor,
              ),
              label: Text(
                'Filter',
                style: TextStyle(color: blackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Kumpulan Kelas
  Widget cardClass() {
    return Consumer<OfflineProvider>(
      builder: (context, value, child) {
        List<OfflineModel> result = value.offline;
        if (value.myState == RequestState.loading) {
          return Center(
            child: CircularProgressIndicator(color: primaryBase),
          );
        } else if (value.myState == RequestState.loaded) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    height: 163,
                    child: Stack(
                      children: [
                        Image.network(
                          result[index].picture!,
                          height: 163,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Container(
                          height: 163,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A4B5F).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 16, bottom: 12, top: 12),
                          child: Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat('Hm').format(
                                        result[index].time,
                                      ),
                                      // i.time.toString(),
                                      style:
                                          kHeading6.copyWith(color: whiteColor),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      '${result[index].duration} min',
                                      // i.duration.toString(),
                                      style: kSubtitle1.copyWith(
                                          color: whiteColor),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      result[index].title!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          kHeading6.copyWith(color: whiteColor),
                                    ),
                                    Text(
                                      'With ${result[index]
                                              .trainerName}',
                                      style:
                                          kSubtitle1.copyWith(color: whiteDark),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.group_add_sharp,
                                          color: primaryLight,
                                          size: 24,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          result[index].slot.toString(),
                                          // i.slot.toString(),
                                          style: kSubtitle2.copyWith(
                                              color: whiteColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        Utils.currencyFormat(
                                            result[index].price!),
                                        style: kSubtitle1.copyWith(
                                            color: whiteColor)),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      OfflineProvider offlineProvider =
                                          Provider.of<OfflineProvider>(context,
                                              listen: false);
                                      JSONModel<OfflineModel> json =
                                          await offlineProvider
                                              .getDetailsOffline(
                                                  result[index].id!);
                                                  
                                      if (json.statusCode == 200) {
                                        if (mounted) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OfflineBook(
                                                model: json.data!,
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: primaryBase,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'BOOK',
                                      style:
                                          kButton.copyWith(color: whiteColor),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: result.length,
          );
        } else {
          return const Center(
            child: Text('No Data'),
          );
        }
      },
    );
  }
}
