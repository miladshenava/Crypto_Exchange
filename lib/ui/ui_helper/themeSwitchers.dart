import 'package:flutter/material.dart';
import 'package:crypto_exchange_flutter/provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';



class themeSwitchers extends StatelessWidget {
  const themeSwitchers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final themeProviderr = Provider.of<themeprovider>(context);
   var iconSwitchers = Icon( themeProviderr.isDarkeMode ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill);
    return IconButton(onPressed: (){
      themeProviderr.toggleTheme();
    }, icon:iconSwitchers);
  }
}
