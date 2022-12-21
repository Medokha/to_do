import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/provider_settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/taskes.dart';
import '../provider/provider_add_task.dart';
import '../shared/components/components.dart';
import '../shared/network/local/firebse_utils.dart';
import '../shared/styles/colors.dart';

class updatescreen extends StatefulWidget {
  taskedate task;
  updatescreen(this.task);

  @override
  State<updatescreen> createState() => _updatescreenState();
}

class _updatescreenState extends State<updatescreen> {
  var titelcontroler = TextEditingController();
  var descriptionlcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<provideraddtask>(context);
    var proset =Provider.of<providersettings>(context);
    return Container(
      color:  proset.dropdownvalue2==ThemeMode.light?Colors.white:darkc,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Edite Task",style: Theme.of(context).textTheme.subtitle1?.
            copyWith(fontSize: 20,
                color: proset.dropdownvalue2==ThemeMode.light?black:green),),
            SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            Form(
                // key: formkey,
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
                          label: Text('${AppLocalizations.of(context)!.titel}: ${widget.task.titel}',style: TextStyle(fontSize: 20,
                              color: proset.dropdownvalue2==ThemeMode.light?black:Colors.white),),
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
                          label: Text('${AppLocalizations.of(context)!.description}: ${widget.task.description}',style: TextStyle(fontSize: 20,
                              color: proset.dropdownvalue2==ThemeMode.light?black:Colors.white),),
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
                style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20)),
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
                  if(titelcontroler.text==''){
                    titelcontroler.text= widget.task.titel;
                  }
                  if(descriptionlcontroler.text==''){
                    descriptionlcontroler.text= widget.task.description;
                  }
                  widget.task.titel=titelcontroler.text;
                      widget.task.description= descriptionlcontroler.text;
                      widget.task.date= DateUtils.dateOnly(pro.selecttime).microsecondsSinceEpoch;


                  showloading(context, 'Looding ... ');
                  updatedataFirebase(widget.task.id,widget.task).then((value) {
                    hidelooding((context));
                    showmassage(context,'Task Change','OK',(){
                    Navigator.pop(context);
                    Navigator.pop(context);
                    },ngmassage: 'Cancel',ngtaction: (){
                    //shoud be delete from data base
                    Navigator.pop(context);
                    Navigator.pop(context);
                    });
                  }).catchError((error){
                    print(error);
                  });
                },
                child: Text('Save Change ',
                  style: Theme.of(context).textTheme.subtitle1?.
                  copyWith(fontSize: 15,color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
