import 'dart:ui';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const Color _defaucolor = Color(0);
class CircleTitleButton extends MaterialButton{
  CircleTitleButton({this.child,this.title,this.notification,this.colorbutton=_defaucolor,this.ontap,this.das=30,this.stroke}){
    child==null?child=Container():{};
    notification==null?notification=Container():{};
    title==null?title=Container():{};
  }
  GestureTapCallback ontap;
   Widget child,notification,title;
  final Color colorbutton;
  double stroke=1.0;
  int das;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: ontap,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topRight,
        children: <Widget>[
          Column(
            children: <Widget>[
              DashedCircle(
                dashes: das,
                strokeWidth: stroke,
                color: colorbutton,
                child:  Padding(
                  padding:  EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorbutton,
                    ),
                    child:child,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: title,
                ),
              ),
            ],
          ),
          Positioned(
            top: 2,
            right: -5,
            child: notification,
          ),
        ],
      ),
    );
  }
}