import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final int val;

  CategoryItem(this.title , this.color, this.val);

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black.withOpacity(.4), Colors.black.withOpacity(.2),],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.maxFinite,

            child: Padding(padding: EdgeInsets.only(left: 90),
              child: SizedBox(
                height: 40,
                width: 60,
                child: Lottie.asset(
                  'assets/air.json',
                ),
              ),
            ),
          ),

          Text(val.toString(),style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold),),
          Text(title,style: TextStyle(color: Colors.white, fontSize: 15,)),
        ],
      ),

    );
  }
}
