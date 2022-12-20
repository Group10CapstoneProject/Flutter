import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/article_listitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArticlesListScreen extends StatelessWidget {
  const ArticlesListScreen({super.key, required this.listArticle});

  final List<ArticlesModel> listArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Artikel', style: kHeading6,),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        ///Kumpulan list of ArticleListItem yang menampung data article
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              for(ArticlesModel i in listArticle)
                ArticleListitem(articlesModel: i)
            ],
          ),
        ),
      ),
    );
  }
}