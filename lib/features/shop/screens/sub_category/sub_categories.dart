import 'package:shopease/common/widgets/appbar/appbar.dart';
import 'package:shopease/common/widgets/images/rounded_images.dart';
import 'package:shopease/common/widgets/products/product_cards/product_card_horizantal.dart';
import 'package:shopease/common/widgets/texts/section_heading.dart';
import 'package:shopease/utils/constants/image_strings.dart';
import 'package:shopease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("Sports"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Banner ---------------------------------------
              TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner3,
                applyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              //Sub Categories -------------------------------
              Column(
                children: [
                  //Heading ----------------------
                  TSectionHeading(
                    title: "Sports Shirts",
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) =>
                              SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => TProductCardHorizantal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
