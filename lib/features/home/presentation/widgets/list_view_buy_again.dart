import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/button_widget.dart';
import 'custom_item.dart';

class ListViewBuyAgain extends StatelessWidget {
  const ListViewBuyAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => CustomItem(
        addWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            2.verticalSpace,
            Center(
              child: ButtonWidget(
                text: "Add",
                width: 50.w,
                height: 6.h,
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),);
  }
}
