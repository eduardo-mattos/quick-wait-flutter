import 'package:flutter/cupertino.dart';

import '../../../../design_system/buttons/rounded_elevated_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          size: Size
              .infinite, //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: HeaderPainter(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 105,
                height: 105,
                child: Image.asset(
                  "assets/images/default_user_icon.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 28,
                child: RoundedElevatedButton(
                  onPressed: () => null,
                  title: "Desconhecido",
                ),
              )
            ],
          ),
        ));
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0009254058, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.9957673);
    path_0.cubicTo(size.width, size.height * 0.9957673, size.width * 0.5237150, size.height * 0.8013184,
        size.width * -0.0009254058, size.height * 0.9957673);
    path_0.cubicTo(size.width * -0.2162345, size.height * 1.075571, size.width * -0.0009254058, 0, size.width * -0.0009254058, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff12A1A7).withOpacity(0.5);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
