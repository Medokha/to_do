import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/settings/settings.dart';
import 'package:todo/modules/tasks_list/button_sheet.dart';
import 'package:todo/modules/tasks_list/tasks_list.dart';
import 'package:todo/provider/myprovider_layout.dart';
import 'package:todo/shared/styles/my_theme.dart';

class homelayout extends StatelessWidget {
  static const String routeName ='homelayout';
  List<String> name =['To Do List','Settings'];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<providerlayout>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*.2,
        title: Text('${pro.curentindex==0? name[0] : name[1]}',
        style: Theme.of(context).textTheme.headline1,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 3
          )
        ),
        onPressed: () {
          showtaskbottonsheet(context);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex:pro.curentindex ,
          onTap: (index){
            pro.changetab(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
          ],

        ),
      ),
      body: tabs[pro.curentindex],
    );
  }
  void showtaskbottonsheet(BuildContext context){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: buttonsheet(),
        ));
}
  List<Widget> tabs =[taskslist(),settings()];
}
