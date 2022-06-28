import 'package:flutter/material.dart';
import 'package:krss/util/style.dart';
import 'package:flutter_svg/svg.dart';

class DefaultButton extends StatelessWidget {

  final String text;
  final VoidCallback press;


  const DefaultButton({Key? key, required this.text, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Container(
      width: _width*0.3,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: kPrimaryColor,
      ),
      child: InkWell(
        onTap: press,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSurffixIcon extends StatelessWidget {


  final String svgIcon;

  CustomSurffixIcon(this.svgIcon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: 15,
      ),
    );
  }
}