import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class ProfileMenuItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onclick;
  final bool divide;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onclick,
    required this.divide,
  });

  @override
  State<ProfileMenuItem> createState() => _ProfileMenuItemState();
}

class _ProfileMenuItemState extends State<ProfileMenuItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => widget.onclick!(),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: AppColors.black,
                ),
                Container(
                  width: size.width * 0.55,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomLabel(
                        label: widget.title,
                        textColor: AppColors.black,
                        textAlign: TextAlign.start,
                      ),
                      CustomLabel(
                        label: widget.subTitle,
                        textColor: AppColors.lightGray,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.chevron_right,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Container(
              child: widget.divide
                  ? const Divider(
                      color: AppColors.lightGray,
                      thickness: 0.5,
                      indent: 20,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
