import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class NavItem extends StatefulWidget {
  final double width;
  final IconData icon;
  final String name;
  final Function()? onTap;

  const NavItem({
    super.key,
    required this.width,
    required this.icon,
    required this.name,
    this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap!(),
      child: SizedBox(
        width: widget.width,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(widget.icon),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
