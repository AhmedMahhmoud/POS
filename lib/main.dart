import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_sys/Providers/CategoryProv/category.dart';
import 'package:pos_sys/features/login/Presentation/Provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'features/login/Presentation/Screen/login_screen.dart';
import 'features/tables/Presentation/Provider/table_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.intialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 807),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => di.sl<LoginProvider>(),
            ),
            ChangeNotifierProvider(
              create: (context) => di.sl<TableProvider>(),
            ),
            ChangeNotifierProvider(
              create: (context) => CategoryProv(),
            )
          ],
          child: MaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            ),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Almarai-Regular',
              primarySwatch: Colors.red,
            ),
            home: LoginPage(),
          ),
        );
      },
    );
  }
}
