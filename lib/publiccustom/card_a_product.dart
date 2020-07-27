import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      this.isbestbuy = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topLeft,
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
                        text: price == 0
                            ? "Liên hệ"
                            : NumberFormat.currency(customPattern: '#,##0').format(price).replaceAll('.00', " đ"),
                        style: TextStyle(color: Colors.red)),
                  ]),
                ),
              ],
            ),
          ),
        ),
        ishot
            ? Transform.rotate(angle: 90/180*3.1412,child: Container(
          child: CustomPaint(
            painter: new FlagProductPainter(),
            child: Container(
              child: Text("Hot"),
              height: 35,
              width: 35,
            ),
          ),
        ),)
            : Container(),
      ],
    );
  }
}

class FlagProductPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    print("Run here");
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    var width=size.width;
    var height = size.height;
    final  path = new Path()
      ..moveTo(0, size.height)
      ..lineTo(width, size.height)
      ..lineTo(width/1.5,size.height- height/5)
      ..lineTo(width, size.height- 2*height/5)
      ..lineTo(0,size.height- 2*height/5)
    ;
    canvas.drawPath(path, paint);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
