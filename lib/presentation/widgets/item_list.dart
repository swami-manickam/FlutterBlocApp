import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/components/cart_item.dart';
import 'package:flutter_sample_bloc_pattern/components/custom/bounce.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';
import 'package:flutter_sample_bloc_pattern/utils/data.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: AnimationLimiter(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: cartItems.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final item = cartItems[index];
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 300),

                /// this scale, fade and bounce create the effect we see when we visit cart
                child: ScaleAnimation(
                    child: FadeInAnimation(
                  child: BounceWidget(
                    delay: Duration(milliseconds: index * 200),
                    child: CartItemCard(item: item),
                  ),
                )));
          },
        ),
      ),
    );
  }
}
