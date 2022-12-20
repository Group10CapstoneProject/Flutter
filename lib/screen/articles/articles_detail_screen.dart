import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/provider/articles_provider.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ArticlesDetailScreen extends StatefulWidget {
  const ArticlesDetailScreen({super.key, required this.articlesModel});

  final ArticlesModel articlesModel;

  @override
  State<ArticlesDetailScreen> createState() => _ArticlesDetailScreenState();
}

class _ArticlesDetailScreenState extends State<ArticlesDetailScreen> {

  @override
  void initState() {
    ArticleProvider provider = Provider.of<ArticleProvider>(context, listen: false);
    provider.articlesModel = widget.articlesModel;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await provider.getSingleOrDetailArticle(provider.articlesModel!.id);
    });
  }

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
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.ios_share))
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Consumer<ArticleProvider>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ///Article Image
                    AspectRatio(
                      aspectRatio: 360/162,
                      child: Image(image: NetworkImage(value.articlesModel!.picture!), fit: BoxFit.cover,),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ///Title
                          Text(
                            value.articlesModel!.title.toString(), 
                            style: kHeading6.copyWith(fontWeight: semiBold),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8,),

                          ///UpdatedAt
                          Text(
                            Utils.dateTimeFormat3(DateTime.parse(value.articlesModel!.updatedAt!)), 
                            style: kBody2.apply(color: whiteDarkest),
                          ),
                          const SizedBox(height: 8,),

                          ///Content
                          (value.articlesModel!.content != null) 
                            ? Text(value.articlesModel!.content.toString(), style: kBody2,)
                            : const SizedBox(),
                        ],
                      ),
                    )
                  ],
                );
              }
            ),
          ),

          Consumer<ArticleProvider>(
            builder: (context, value, child) {
              return (value.isLoading) ? const CircularLoading() : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}