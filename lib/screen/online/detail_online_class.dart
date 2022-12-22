import 'package:capstone_alterra_flutter/model/online_class_model.dart';
import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/screen/transaction/transaction_detail_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recase/recase.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailOnlineClass extends StatelessWidget {
  const DetailOnlineClass({
    super.key,
    required this.onlineClassModel,
  });
  final OnlineClassModel onlineClassModel;
  

  @override
  Widget build(BuildContext context) {

    String? videoId = (onlineClassModel.link != null)
        ? YoutubePlayer.convertUrlToId(onlineClassModel.link!)
        : null;
    YoutubePlayerController ytController = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
        hideThumbnail: (onlineClassModel.accessClass == true)? true : false,
        hideControls: (onlineClassModel.accessClass == true)? false : true,
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: false,
      )
    );

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        ///To hide statusbar when not in fullscreen mode
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
      },
      player: YoutubePlayer(
        controller: ytController,
        aspectRatio: 328/160,
        thumbnail: Container(
          decoration: BoxDecoration(
            color: primaryBase,
            image: (onlineClassModel.picture != null) ? 
              DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(onlineClassModel.picture!)
              ) : null
          ),
        ),
      ),
      builder: (p0context, p1player) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.ios_share)
              ),
              const SizedBox(width: 8,),
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              ///ScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
        
                      ///Video Player with Image Thumbnail
                      AspectRatio(
                        aspectRatio: 328/160,
                        child: p1player
                      ),
        
                      ///Green Divider
                      Container(
                        height: 8,
                        width: double.infinity,
                        color: primaryBase,
                      ),
        
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
        
                            ///Title
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(onlineClassModel.title, style: kHeading6,)
                            ),
                            const SizedBox(height: 16,),
        
                            ///Profile picture and Name
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryBase,
                                    image: (onlineClassModel.trainer!.picture != null)
                                        ? DecorationImage(image: NetworkImage(onlineClassModel.trainer!.picture!))
                                        : null
                                  ),
                                ),
                                const SizedBox(width: 12,),
                                Expanded(
                                  child: Text(onlineClassModel.trainer!.name.toString(), style: kCaption,)
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
        
                            ///Description
                            Text(
                              onlineClassModel.description.toString(),
                              style: kBody2
                            ),
                            const SizedBox(height: 16,),
        
                            _rowDescription(
                              leading: SvgPicture.asset('assets/online_page/gym.svg',), 
                              title: 'Peralatan', 
                              subTitle: onlineClassModel.tools.toString()
                            ),
        
                            _rowDescription(
                              leading: SvgPicture.asset('assets/online_page/target.svg',), 
                              title: 'Target Area', 
                              subTitle: onlineClassModel.targetArea.toString()
                            ),
        
                            _rowDescription(
                              leading: Icon(Icons.alarm_on, color: primaryBase,), 
                              title: 'Durasi', 
                              subTitle: '${onlineClassModel.duration} min'
                            ),
        
                            _rowDescription(
                              leading: SvgPicture.asset('assets/online_page/fire.svg',), 
                              title: 'Kesulitan', 
                              subTitle: onlineClassModel.level.sentenceCase
                            ),
        
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ///Total Harga & Button Pembayaran
              (onlineClassModel.accessClass == true) ? const SizedBox() : Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Harga', style: kBody1,),
                        Text(Utils.currencyFormat(onlineClassModel.price), style: kSubtitle1.apply(color: primaryBase),)
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailScreen(
                                transactionModel: TransactionModel.forOnlineClass(
                                  id: onlineClassModel.id.toString(), 
                                  title: onlineClassModel.title, 
                                  price: onlineClassModel.price
                                )
                              ),
                            )
                          );
                        }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(primaryBase),
                          fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 48))
                        ),
                        child: Text('LANJUTKAN KE PEMBAYARAN', style: kButton.apply(color: Colors.white),)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}






Widget _rowDescription({
  required Widget leading,
  required String title,
  required String subTitle,
}){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      border: Border.symmetric(horizontal: BorderSide(color: whiteDark))
    ),
    child: Row(
      children: [

        ///Leading Icon and title
        Expanded(
          child: Row(
            children: [
              leading,
              const SizedBox(width: 8,),
              Text(title, style: kSubtitle2,),
            ],
          ),
        ),

        ///Subtitle
        Expanded(
          child: Text(subTitle, style: kCaption.apply(color: blackLightest),),
        )
      ],
    ),
  );
}