import 'package:capstone_alterra_flutter/model/json_model.dart';
import 'package:capstone_alterra_flutter/model/online_class_category_model.dart';
import 'package:capstone_alterra_flutter/provider/online_class_provider.dart';
import 'package:capstone_alterra_flutter/screen/online/online_filter_screen.dart';
import 'package:capstone_alterra_flutter/screen/online/specified_online_class_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnlineClassScreen extends StatefulWidget {
  const OnlineClassScreen({super.key});

  @override
  State<OnlineClassScreen> createState() => _OnlineClassScreenState();
}

class _OnlineClassScreenState extends State<OnlineClassScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      OnlineClassProvider provider = Provider.of<OnlineClassProvider>(context,listen: false);
      await provider.getAllOnlineClassCategories();
    });
  }

  @override
  Widget build(BuildContext context) {

    OnlineClassProvider provider = Provider.of<OnlineClassProvider>(context,listen: false);

    return Stack(
      children: [
        SingleChildScrollView(
          child: Consumer<OnlineClassProvider>(
            builder: (context, value, child) => Column(
              children: [
                onlineFilter(context),
                const SizedBox(height: 8,),
                // onlineCard(imgSrc: 'yoga.png', title:  'Yoga', totalVideo: 12, context: context),
                // onlineCard(imgSrc: 'strength.png', title: 'Strength', totalVideo: 23, context: context),
                // onlineCard(imgSrc: 'cardio.png', title: 'Cardio', totalVideo: 8, context: context),
                // onlineCard(imgSrc: 'streching.png', title: 'Streching', totalVideo: 22, context: context),
                for(OnlineClassCategoryModel i in provider.listOnlineCategory)
                  onlineCard(
                    onlineClassCategoryModel: i,
                    context: context,
                  )
                
              ],
            ),
          ),
        ),
        Consumer<OnlineClassProvider>(
          builder: (context, value, child) {
            return (value.isLoading) ? const CircularLoading() : const SizedBox();
          },
        )
      ],
    );
  }

  /// Widget Tombol Filter and text 'Kategori Aktivitas'
  Widget onlineFilter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Kategori Aktivitas', style: kSubtitle1,),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OnlineFilterScreen(),));
              },
              icon: const Icon(
                Icons.tune,
                color: Color(0xFF000000),
              ),
              label: const Text(
                'Filter',
                style: TextStyle(
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

///Widget card yang menampung jenis online class
  Widget onlineCard({
    required OnlineClassCategoryModel onlineClassCategoryModel,
    required BuildContext context
  }){
    return AspectRatio(
      aspectRatio: 328/192,
      child: GestureDetector(
        onTap: () async {
          OnlineClassProvider provider = Provider.of<OnlineClassProvider>(context, listen: false);
          JSONModel<OnlineClassCategoryModel> json = await provider.getSingleOrDetailOnlineClassCategory(onlineClassCategoryModel.id);
          if(json.statusCode == 200 && mounted){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => SpecifiedOnlineClassScreen(
                  onlineClassCategoryModel: json.data!,
                ),
              )
            );
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Unexpected error'))
            );
          }
          
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            image: DecorationImage(image: NetworkImage(onlineClassCategoryModel.picture), fit: BoxFit.cover)
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A4B5F).withOpacity(0.0),
                      const Color(0xFF1A4B5F).withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(onlineClassCategoryModel.name, style: kHeading6.apply(color: Colors.white),),
                    const SizedBox(height: 12,),
                    Text('${onlineClassCategoryModel.onlineClassCount} Video', style: kSubtitle1.apply(color: Colors.white),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}