
import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/screen/articles/articles_detail_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';

class ArticleListitem extends StatelessWidget {
  const ArticleListitem({super.key, required this.articlesModel});

  final ArticlesModel articlesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlesDetailScreen(articlesModel: articlesModel),));
      },
      child: Container(
        height: 106,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: whiteDark))),
        child: Row(
          children: [
            ///Article image
            ///Menampung gambar artikel
            Container(
              width: 92,
              height: 82,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(articlesModel.picture!),
                      fit: BoxFit.cover)),
            ),
    
            ///Menampung title list artikel dan tanggal artikel
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  articlesModel.title.toString(),
                  style: kSubtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(Utils.dateTimeFormat3(DateTime.parse(articlesModel.updatedAt!)),
                    style: kCaption.apply(
                      color: whiteDarkest,
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}