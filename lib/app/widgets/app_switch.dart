import 'package:flutter/material.dart';
import 'package:untitled/app/constant/color_constant.dart';
import 'package:untitled/app/utills/dimension.dart';

class AppSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const AppSwitch({required this.onChanged, super.key, this.initialValue = false});

  @override
  AppSwitchState createState() => AppSwitchState();
}

class AppSwitchState extends State<AppSwitch> with SingleTickerProviderStateMixin {
  late bool isOn;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    if (isOn) {
      _controller.value = 1;
    }
  }

  void toggleSwitch() {
    setState(() {
      isOn = !isOn;
      isOn ? _controller.forward() : _controller.reverse();
    });
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: Dimens.widthSemiNormal,
        height: Dimens.heightExtraSmallMedium,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isOn ? AppColorConstant.appLightPurple : AppColorConstant.appLightGrey,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.lerp(Alignment.centerLeft, Alignment.centerRight, _animation.value)!,
              child: Container(
                margin: const EdgeInsets.all(3),
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorConstant.appWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
