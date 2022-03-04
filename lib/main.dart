import 'package:field_sales_management/screens/login_screen.dart';
import 'package:field_sales_management/screens/main/tasks_screen.dart';
import 'package:field_sales_management/screens/main/chat_screen.dart';
import 'package:field_sales_management/screens/main/orders_screen.dart';
import 'package:field_sales_management/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main/price_offers_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<AuthService>(
    create: (BuildContext context) => AuthService(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthService authProvider = Provider.of<AuthService>(context);

    return MaterialApp(
        theme: ThemeData.from(
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xFF6750A4),
                onPrimary: Color(0xFF071540),
                secondary: Color(0XFF625B71),
                onSecondary: Color(0XFFFFFFFF),
                tertiary: Color(0xFF7D5260),
                onTertiary: Color(0xFFFFFFFF),
                error: Color(0XFFB3261E),
                onError: Color(0XFFFFFFFF),
                background: Color(0XFFFFFBFE),
                onBackground: Color(0XFF1C1B1F),
                primaryContainer: Color(0xFFEADDFF),
                onPrimaryContainer: Color(0xFF21005D),
                secondaryContainer: Color(0xFFE8DEF8),
                onSecondaryContainer: Color(0xFF1D192B),
                tertiaryContainer: Color(0xFFFFD8E4),
                onTertiaryContainer: Color(0xFF31111D),
                errorContainer: Color(0xFFF9DEDC),
                onErrorContainer: Color(0xFF410E0B),
                surface: Color(0XFFFFFBFE),
                onSurface: Color(0XFF1C1B1F),
                surfaceVariant: Color(0xFFE7E0EC),
                onSurfaceVariant: Color(0xFF49454F),
                outline: Color(0xFF79747E))),
        darkTheme: ThemeData.from(
            colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0XFFD0BCFF),
                onPrimary: Color(0XFF381E72),
                secondary: Color(0XFFCCC2DC),
                onSecondary: Color(0XFF332D41),
                tertiary: Color(0xFFEFB8C8),
                onTertiary: Color(0xFF492532),
                error: Color(0XFFF2B8B5),
                onError: Color(0XFF601410),
                background: Color(0XFF1C1B1F),
                onBackground: Color(0XFFE6E1E5),
                primaryContainer: Color(0xFF4F378B),
                onPrimaryContainer: Color(0xFFEADDFF),
                secondaryContainer: Color(0xFF4A4458),
                onSecondaryContainer: Color(0xFFE8DEF8),
                tertiaryContainer: Color(0xFF633B48),
                onTertiaryContainer: Color(0xFFFFD8E4),
                errorContainer: Color(0xFF8C1D18),
                onErrorContainer: Color(0xFFF9DEDC),
                surface: Color(0XFF1C1B1F),
                onSurface: Color(0XFFE6E1E5),
                surfaceVariant: Color(0xFF49454F),
                onSurfaceVariant: Color(0xFFCAC4D0),
                outline: Color(0xFF938F99))),
        themeMode: authProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
        title: "My First App",
        home: Provider.of<AuthService>(context).loggedIn
            ? const MainPage(title: "Main")
            : const LoginScreen());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _Mainscreenstate();
}

class _Mainscreenstate extends State<MainPage> {
  int currentIndex = 0;
  static const screens = [
    PriceOffersScreen(),
    OrdersScreen(),
    TasksScreen(),
    ChatScreen()
  ];

  @override
  Widget build(BuildContext context) {
    AuthService authProvider = Provider.of<AuthService>(context);
    Color selected = authProvider.darkMode
        ? const Color(0xFF071540)
        : const Color.fromARGB(255, 49, 31, 107);

    Color unselected = authProvider.darkMode
        ? const Color(0xFFE5E6EB)
        : const Color(0XFF5E5775);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: selected,
          unselectedItemColor: unselected,
          elevation: 12,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.price_check), label: "Teklif"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping), label: "Sipariş"),
            BottomNavigationBarItem(
                icon: Icon(Icons.pending_actions), label: "Görevlendirmeler"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Sohbet")
          ]),
    );
  }
}
