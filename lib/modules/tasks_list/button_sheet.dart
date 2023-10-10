import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/taskes.dart';
import 'package:todo/provider/provider_add_task.dart';
import 'package:todo/provider/provider_settings.dart';
import 'package:todo/shared/network/local/firebse_utils.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/components/components.dart';

class buttonsheet extends StatefulWidget {
  @override
  State<buttonsheet> createState() => _buttonsheetState();
}

class _buttonsheetState extends State<buttonsheet> {
  var titelcontroler = TextEditingController();

  var descriptionlcontroler = TextEditingController();

  GlobalKey<FormState> formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<provideraddtask>(context);
    var proset =Provider.of<providersettings>(context);

    return Container(
      color:proset.dropdownvalue2==ThemeMode.light?Colors.white:darkc,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add New Task",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 30,
              color: proset.dropdownvalue2==ThemeMode.light?primarycolor:green),),
            SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            Form(
              key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titelcontroler,
                      validator: (text){
                        if(text==''){
                          return'Pleas Enter Titel';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.titel,style: TextStyle(fontSize: 20,
                            color:proset.dropdownvalue2==ThemeMode.light?black:Colors.white ),),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primarycolor,
                          )
                        )
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.01,
                    ),
                    TextFormField(
                      maxLines: 2,
                      controller: descriptionlcontroler,
                      validator: (text){
                        if(text==''){
                          return'Pleas Enter Description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text(AppLocalizations.of(context)!.description,style: TextStyle(fontSize: 20,
                              color:proset.dropdownvalue2==ThemeMode.light?black:Colors.white),),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primarycolor,
                              )
                          )
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            Text("Select Date ",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20,
                    color:proset.dropdownvalue2==ThemeMode.light?black:Colors.white)),
            SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            InkWell(
              onTap: (){
                pro.showpiker(context);
              },
              child: Text("${pro.selecttime.year}/${pro.selecttime.month}/${pro.selecttime.day}",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 15,),
                textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            ElevatedButton(
                onPressed: (){
                  if(formkey.currentState!.validate()){
                    taskedate task =taskedate(titel: titelcontroler.text,
                        description: descriptionlcontroler.text,
                        date: DateUtils.dateOnly(pro.selecttime).microsecondsSinceEpoch);
                    showloading(context,'Looding...');
                    addtaskFirebaseFirestore(task).then((value) => {
                      hidelooding((context)),
                      showmassage(context,'Task Added','OK',(){
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },ngmassage: 'Cancel',ngtaction: (){
                        //shoud be delete from data base
                        // .
                        // .
                        // .
                        // .
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }),
                    }).catchError((error){
                      print(error);
                      });
                  }
                },
                child: Text('Add Task ',
                  style: Theme.of(context).textTheme.subtitle1?.
                  copyWith(fontSize: 15,color: Colors.white),))
          ],
        ),
      ),

    );
  }
}
