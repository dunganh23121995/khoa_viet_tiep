import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:intl/intl.dart';
import 'package:khoaviettiep/AppTheme.dart';

class CardProduct extends StatelessWidget {
  Image image;
  GestureTapCallback ontap;
  int price, cost;
  String name;
  bool ishot, isnew, isbestbuy;
  CardProduct(
      {this.image,
      this.name = "Tên sản phẩm",
      this.price = 0,
      this.cost = 0,
      this.ontap,
      this.ishot = false,
      this.isnew = false,
      this.isbestbuy = false}){
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(2.0),
          color: Colors.white,
          child: InkWell(
            onTap: ontap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                image != null
                    ? Flexible(
                        flex: 1,
                        child: Container(
                          child: image,
                        ),
                      )
                    : Container(),
                Divider(
                  color: AppTheme.colorOrange,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    name,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w700, color: AppTheme.colorTextTitle),
                  ),
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(text: 'Giá: ', style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: price == 0 ? "Liên hệ" : NumberFormat.currency(customPattern: '#,##0').format(price).replaceAll('.00', " đ"),
                        style: TextStyle(color: Colors.red)),
                  ]),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: -8,
          child: ishot
              ? Transform.rotate(
                  angle: 90 / 180 * 3.1412,
                  child: Container(
                    child: CustomPaint(
                      painter: new FlagProductPainter(),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Hot".toUpperCase(),
                          style: TextStyle(color: Colors.red,fontSize: 8,fontWeight: FontWeight.w700),
                        ),
                        height: 10,
                        width: 32,
                      ),
                    ),
                  ),
                )
              : Container(),
        ),
        Positioned(
          top: 12,
          left: 6,
          child: isnew
              ? Transform.rotate(
                  angle: 90 / 180 * 3.1412,
                  child: Container(
                    child: CustomPaint(
                      painter: new FlagProductPainter(),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "new".toUpperCase(),
                          style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.w700),
                        ),
                        height: 10,
                        width: 32,
                      ),
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }


}

class FlagProductPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    var width = size.width;
    var height = size.height;
    final path = new Path()
      ..moveTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width / 1.25, height - height / 2)
      ..lineTo(width, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
