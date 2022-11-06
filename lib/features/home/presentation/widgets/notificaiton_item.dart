import 'package:flutter/material.dart';
import 'package:pomodore/core/utils/size_config.dart';

import '../../../../core/constant/constant.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: SizeConfig.heightMultiplier * 15,
        decoration: BoxDecoration(
          color: AppConstant.secondaryColor.withOpacity(.08),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Container(
              height: SizeConfig.widthMultiplier * 20,
              width: SizeConfig.widthMultiplier * 20,
              decoration: BoxDecoration(
                color: color.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
