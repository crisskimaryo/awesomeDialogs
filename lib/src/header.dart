import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:awesome_dialog/src/anims/rive_anim.dart';
import 'package:flutter/material.dart';

///Header of the [AwesomeDialog]
class AwesomeDialogHeader extends StatelessWidget {
  ///Constructor of the [AwesomeDialogHeader]
  const AwesomeDialogHeader({
    required this.dialogType,
    required this.loop,
    Key? key,
  }) : super(key: key);

  ///Defines the type of [AwesomeDialogHeader]
  final DialogType dialogType;

  ///Defines if the animation loops or not
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
      case DialogType.info:
        return AssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/info.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.INFO_REVERSED:
      case DialogType.infoReverse:
        return AssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/info_reverse.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.question:
        return AssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/question.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.WARNING:
      case DialogType.warning:
        return AssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/warning.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.ERROR:
      case DialogType.error:
        return AssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/error.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.SUCCES:
      case DialogType.success:
        return AssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/success.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.NO_HEADER:
      case DialogType.noHeader:
        return const SizedBox.shrink();
    }
  }
}

class AssetAnimation extends StatefulWidget {
  final String assetPath;
  final bool loop;
  final String? animName;

  AssetAnimation(
      {Key? key, required this.assetPath, this.loop = false, this.animName})
      : super(key: key);

  @override
  _AssetAnimationState createState() => _AssetAnimationState();
}

class _AssetAnimationState extends State<AssetAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    if (widget.loop) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset('assets/jamii.png' ?? widget.assetPath),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14159, // Rotates the asset
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
