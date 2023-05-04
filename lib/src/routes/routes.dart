import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/list_builder_page.dart';

Map<String,WidgetBuilder> getApplicationRoutes() {
  return <String,WidgetBuilder> {

        '/'        :(context) => const HomePage(),
        'alert'    :(context) => const AlertPage(),
        'avatar'   :(context) => const AvatarPage(), 
        'card'     :(context) => const CardPage(),
        'container':(context) => const AnimatedContainerPage(),
        'input'    :(context) => const InputPage(),
        'slider'   :(context) => const SliderPage(),
        'list'     :(context) => const ListBuilderPage(),
        
      };
}

