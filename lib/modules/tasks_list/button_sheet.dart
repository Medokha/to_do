import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/provider_add_task.dart';
import 'package:todo/shared/styles/colors.dart';

class buttonsheet extends StatelessWidget {
  var titelcontroler = TextEditingController();
  var descriptionlcontroler = TextEditingController();
  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<provideraddtask>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add New Task",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 30),),
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
                      label: Text('titel',style: TextStyle(fontSize: 20),),
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
                    maxLines: 3,
                    controller: descriptionlcontroler,
                    validator: (text){
                      if(text==''){
                        return'Pleas Enter Description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text('description',style: TextStyle(fontSize: 20),),
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
                if(formkey.currentState!.validate()){
                  print("__________");
                }
              },
              child: Text('Add Task ',
                style: Theme.of(context).textTheme.subtitle1?.
                copyWith(fontSize: 15,color: Colors.white),))
        ],
      ),

    );
  }
}
