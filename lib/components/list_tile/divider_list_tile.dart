import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DividerListTile extends StatelessWidget {
  const DividerListTile({
    super.key,
    this.isShowForwordArrow = true,
    required this.title,
    required this.press,
    this.leading,
    this.minLeadingWidth,
    this.isShowDivider = true,
  });
  final bool isShowForwordArrow, isShowDivider;
  final Widget title;
  final Widget? leading;
  final double? minLeadingWidth;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: minLeadingWidth,
          leading: leading,
          onTap: press,
          title: title,
          trailing: isShowForwordArrow
              ? SvgPicture.asset(
                  "assets/icons/miniRight.svg",
                )
              : null,
        ),
        if (isShowDivider) const Divider(height: 1),
      ],
    );
  }
}

class DividerListTileWithTrilingText extends StatefulWidget {
  const DividerListTileWithTrilingText({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.trilingText,
    required this.press,
    this.isShowArrow = true,
    this.trailingWidget,
  });

  final String svgSrc, title, trilingText;
  final Widget? trailingWidget;
  final VoidCallback press;
  final bool isShowArrow;

  @override
  State<DividerListTileWithTrilingText> createState() =>
      _DividerListTileWithTrilingTextState();
}

class _DividerListTileWithTrilingTextState
    extends State<DividerListTileWithTrilingText> {
  @override
  Widget build(BuildContext context) {
    bool value = true;
    return Column(
      children: [
        ListTile(
          onTap: widget.press,
          minLeadingWidth: 24,
          leading: SvgPicture.asset(
            widget.svgSrc,
            height: 24,
            width: 24,
          ),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 14, height: 1),
          ),
          trailing: SizedBox(
            width: 120,
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.trilingText),
                ),
                widget.trailingWidget != null
                    ? widget.trailingWidget!
                    : const SizedBox(),
                widget.trailingWidget == null
                    ? SvgPicture.asset(
                        "assets/icons/miniRight.svg",
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        if (widget.isShowArrow) const Divider(height: 1),
      ],
    );
  }
}
