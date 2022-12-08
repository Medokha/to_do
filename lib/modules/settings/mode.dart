import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/provider_settings.dart';
import '../../shared/styles/colors.dart';

class mode extends StatelessWidget {
  // final List<String> modes = ['Light', 'Dark'];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<providersettings>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Text(
          AppLocalizations.of(context)!.mode,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primarycolor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: DropdownButton(
                underline: SizedBox(),
                value: pro.dropdownvalue2 == ThemeMode.light ? 'Light' : 'Dark',
                icon: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .60),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: primarycolor,
                  ),
                ),
                items: ['Light', 'Dark'].map((String item) {
                  return DropdownMenuItem(
                      value: item,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ));
                }).toList(),
                onChanged: (item) {
                  item == 'Light'
                      ? pro.changevaluemode(ThemeMode.light)
                      : pro.changevaluemode(ThemeMode.dark);
                }),
          ),
        )
      ],
    );
  }
}
