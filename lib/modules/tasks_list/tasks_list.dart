import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/taskes.dart';
import 'package:todo/provider/provider_currentdate.dart';
import 'package:todo/provider/provider_settings.dart';
import 'package:todo/shared/network/local/firebse_utils.dart';
import 'package:todo/shared/styles/colors.dart';
import 'add_item.dart';
class taskslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<providercurrentdate>(context);
    var proset =Provider.of<providersettings>(context);

    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: pro.currentdate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              pro.changedate(date);
            },
            leftMargin: 20,
            monthColor:proset.dropdownvalue2==ThemeMode.light? Colors.black : Colors.white,
            dayColor: primarycolor,
            activeDayColor:proset.dropdownvalue2==ThemeMode.light?  Colors.black :green,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          StreamBuilder<QuerySnapshot<taskedate>>(
            stream: gettaskFirebaseFirestore(pro.currentdate),
              builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Center(child: Text("Something Went Wronge"));
              }
              var taskes = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
              if(taskes.isEmpty){
                return Center(child: Text("No Data"));
              }
              return Expanded(
                    child: ListView.builder(
                      itemCount:taskes.length,
                        itemBuilder: (context,index){
                      return additem(taskes[index]);
                    }),
                  );
              })
        ],
      ),

    );
  }
}
