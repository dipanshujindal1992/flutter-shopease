import 'package:shopease/common/widgets/appbar/appbar.dart';
import 'package:shopease/common/widgets/icons/t_circular_icon.dart';
import 'package:shopease/common/widgets/layouts/grid_layout.dart';
import 'package:shopease/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopease/features/shop/screens/home/home.dart';
import 'package:shopease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
