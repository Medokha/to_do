import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';

class additem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),

      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            height: MediaQuery.of(context).size.height*.13,
            width: 4,
            color: primarycolor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task Titel",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
                Text("Description",style: Theme.of(context).textTheme.subtitle1)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            padding:EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.done,size: 30,color: Colors.white,),
          )
        ],
      ),
    );
  }
}
