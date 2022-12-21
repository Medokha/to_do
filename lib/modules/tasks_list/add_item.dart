import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/taskes.dart';
import 'package:todo/modules/updatescreen.dart';
import 'package:todo/provider/provider_settings.dart';
import 'package:todo/provider/providerisdone.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/network/local/firebse_utils.dart';

class additem extends StatelessWidget {
  taskedate task;
  additem(this.task);

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<providerisdone>(context);
    var proset =Provider.of<providersettings>(context);

    return Slidable(
      startActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            SlidableAction(onPressed: (context){
              deletetaskFirebase(task.id);
            },
            backgroundColor: Colors.red,label: AppLocalizations.of(context)!.delete,
            icon: Icons.delete,),
            SlidableAction(onPressed: (context){
              showupdate(context);
            },
              backgroundColor: Colors.blueAccent,label: AppLocalizations.of(context)!.edite,
            icon: Icons.edit,),
          ]),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              height: MediaQuery.of(context).size.height*.13,
              width: 4,
              color:task.isdone==false? primarycolor :green,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.titel,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20,
                        color: task.isdone==false? primarycolor:green),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.02,
                  ),
                  Text(task.description,style: Theme.of(context).textTheme.subtitle1?.
                  copyWith(color:proset.dropdownvalue2==ThemeMode.light?black:Colors.black,fontSize: 15 ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              padding:EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color:task.isdone==false? primarycolor:Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: (){
                  updateiconFirebase(task.id);
                  pro.changedone(task.id);
                },
                  child:task.isdone==false? Icon(Icons.done,size: 30,
                     color:Colors.white):Text(AppLocalizations.of(context)!.done,
                    style: Theme.of(context).textTheme.subtitle1?.
                    copyWith(color: green,fontSize: 25),)),
            )
          ],
        ),
      ),
    );
  }
  void showupdate(BuildContext context){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context){
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: updatescreen(task),
      );
    });

  }
}
