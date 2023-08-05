import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/logic/controllers/movies_controller.dart';
import 'package:movie_app/utils/text_utils.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  String imageNotFound =
      'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg';
  DetailsScreen({
    super.key,
  });
  final MoviesController moviesController = Get.find<MoviesController>();
  @override
  Widget build(BuildContext context) {
    bool image = true;
    moviesController.resultDetails.backdropPath!=null?image=true:image=false;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                automaticallyImplyLeading: false,
                expandedHeight: 500.h,
                primary: false,
                flexibleSpace: Image.network(
                  image?'${TextUtils.baseUrlImage}${moviesController.resultDetails.backdropPath}':imageNotFound,
                  fit: BoxFit.fill,
                  height: 500.h,
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moviesController.resultDetails.title,
                    style: context.theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: moviesController.resultDetails.voteAverage / 2,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                      ),
                      Text(
                        '${moviesController.resultDetails.voteCount}',
                        style: context.theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 40,
                    indent: 40.w,
                    endIndent: 40.w,
                  ),
                  Text(
                    'Description',
                    style: context.theme.textTheme.labelLarge,
                  ),
                    SizedBox(height: 5.h,),
                  ReadMoreText(
                    moviesController.resultDetails.overview,
                    style: context.theme.textTheme.bodySmall,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
