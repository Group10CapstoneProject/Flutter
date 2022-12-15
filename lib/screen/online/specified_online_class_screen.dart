import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_model.dart';
import 'package:capstone_alterra_flutter/provider/specified_online_class_provider.dart';
import 'package:capstone_alterra_flutter/screen/online/detail_online_class.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SpecifiedOnlineClassScreen extends StatelessWidget {
  const SpecifiedOnlineClassScreen({super.key, required this.onlineClassCategoryModel});

  final OnlineClassCategoryModel onlineClassCategoryModel;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(onlineClassCategoryModel.name, style: kHeading6,),
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8,),
                for(OnlineClassModel i in onlineClassCategoryModel.onlineClasses!)
                  _ClassCard(
                    id: i.id,
                    title: i.title, 
                    minute: i.duration, 
                    difficulty: i.level, 
                    price: i.price, 
                    image: i.picture,
                    context: context,
                  )
              ],
            ),
          ),
          Consumer<SpecifiedOnlineClassProvider>(
            builder: (context, value, child) => (value.isLoading) ? const CircularLoading() : const SizedBox(),
          )
        ],
      ),
    );
  }
}






///Card yang menampung item kelas
class _ClassCard extends StatefulWidget {
  const _ClassCard({
    required this.id,
    required this.title,
    required this.minute,
    required this.difficulty,
    required this.price,
    required this.context,
    this.image,
  });

  final int id;
  final String title;
  final int minute;
  final String difficulty;
  final int price;
  final BuildContext context;
  final String? image;

  @override
  State<_ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<_ClassCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 328/237,
      child: GestureDetector(
        onTap: () async{
          SpecifiedOnlineClassProvider provider = Provider.of<SpecifiedOnlineClassProvider>(context, listen: false);
          JSONModel<OnlineClassModel> json = await provider.getSingleOrDetailOnlineClass(widget.id);
          if(json.statusCode == 200 && mounted){
            Navigator.push(
              context, 
              MaterialPageRoute(
                settings: const RouteSettings(name: '/DetailOnlineClass'),
                builder: (context) => DetailOnlineClass(
                  onlineClassModel: json.data!,
                )
              )
            );
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Unexpected error')
              )
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                color: Color(0x1A000000),
                offset: Offset(2, 4)
              )
            ],
            color: primaryBase,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [

              ///Image
              AspectRatio(
                aspectRatio: 328/160,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: (widget.image != null) ? 
                      DecorationImage(
                        image: NetworkImage(widget.image!),
                        fit: BoxFit.cover
                      ) : null,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                ),
              ),

              ///Green Divider
              Container(
                height: 8,
                width: double.infinity,
                color: primaryBase,
              ),

              ///Title, Price, Minute, Difficulty
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.title, 
                              style: kSubtitle1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ),
                          const SizedBox(width: 48,),
                          Text(Utils.currencyFormat(widget.price), style: kSubtitle1.apply(color: primaryBase),),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.alarm_on, color: primaryBase,),
                              const SizedBox(width: 4,),
                              Text('${widget.minute} min', style: kBody2.apply(color: blackLightest),)
                            ],
                          ),
                          const SizedBox(width: 16,),
                          Row(
                            children: [
                              SvgPicture.asset('assets/online_page/fire.svg', color: primaryBase,),
                              const SizedBox(width: 4,),
                              Text(widget.difficulty, style: kBody2.apply(color: blackLightest),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _classCard({
//   required int id,
//   required String title,
//   required int minute,
//   required String difficulty,
//   required int price,
//   required BuildContext context,
//   String? image,
// }){
  
// }