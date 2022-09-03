import 'package:flutter/material.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/ui/widgets/loading/skeleton/skeleton_tools.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: LineSkeleton(
            height: 54,
          ),
        );
      },
      padding: EdgeInsets.symmetric(
        horizontal: UIHelper.paddingMedium,
        vertical: UIHelper.paddingMedium,
      ),
    );
  }
}
