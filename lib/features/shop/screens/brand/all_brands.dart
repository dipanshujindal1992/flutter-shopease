import 'package:shopease/common/widgets/appbar/appbar.dart';
import 'package:shopease/common/widgets/brands/t_brand_card.dart';
import 'package:shopease/common/widgets/layouts/grid_layout.dart';
import 'package:shopease/common/widgets/texts/section_heading.dart';
import 'package:shopease/features/shop/screens/brand/brand_products.dart';
import 'package:shopease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("Brand"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading ----------------------------------
              TSectionHeading(title: "Brands"),
              SizedBox(height: TSizes.spaceBtwItems),

              //Brands-------------------------------------
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder:
                    (context, index) => TBrandCard(
                      showborder: true,
                      onTap: () => Get.to(() => BrandProducts()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
