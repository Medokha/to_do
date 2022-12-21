

import 'package:flutter/material.dart';

showloading(BuildContext context,String massage){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context)=>AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 5,
              ),
              Text(massage),
            ],
          ),
        ),
      ));
}
hidelooding(BuildContext context){
  Navigator.pop(context);
}
void showmassage(BuildContext context,
    String massage,String pstmassage,VoidCallback pstaction,
    {String? ngmassage,VoidCallback? ngtaction,}){
  showDialog(context: context, builder: (context){
    List<Widget> actions =[
      TextButton(onPressed:pstaction , child: Text(pstmassage)),
    ];
    if(ngmassage != null){
      actions.add(TextButton(onPressed:ngtaction , child: Text(ngmassage)));
    }
    return AlertDialog(
      title: Text(massage),
      actions: actions,
    );
  });
}