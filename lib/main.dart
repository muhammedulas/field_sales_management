import 'package:field_sales_management/login.dart';
import 'package:field_sales_management/pages/tasks_page.dart';
import 'package:field_sales_management/pages/chat_page.dart';
import 'package:field_sales_management/pages/orders_page.dart';
import 'package:field_sales_management/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/price_offers_page.dart';

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
    ThemeMode theme = authProvider.theme;

    return MaterialApp(
        theme: ThemeData.from(
            colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          onPrimary: Color(0XFF5E5775),
          secondary: Colors.blue,
          onSecondary: Color.fromARGB(255, 98, 86, 138),
          error: Colors.amber,
          onError: Colors.amber,
          background: Color(0xFFF7F8FB),
          onBackground: Color(0XFF5E5775),
          surface: Color(0XFFFFFEFF),
          onSurface: Color(0XFF5E5775),
        )),
        darkTheme: ThemeData.from(
            colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFAF3CFF),
          onPrimary: Color(0xFFE5E6EB),
          secondary: Color(0xFFAC68F4),
          onSecondary: Color(0xFFE5E6EB),
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xFF2B3865),
          onBackground: Color(0xFFE5E6EB),
          surface: Color(0xFF071540),
          onSurface: Color(0xFFE5E6EB),
        )),
        themeMode: theme,
        title: "My First App",
        home: Provider.of<AuthService>(context).loggedIn
            ? const MainPage(title: "Main")
            : const LoginPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  static const pages = [
    PriceOffersPage(),
    OrdersPage(),
    TasksPage(),
    ChatPage()
  ];

  @override
  Widget build(BuildContext context) {
    AuthService authProvider = Provider.of<AuthService>(context);
    Color selected = authProvider.theme == ThemeMode.dark
        ? const Color(0xFF071540)
        : const Color.fromARGB(255, 49, 31, 107);

    Color unselected = authProvider.theme == ThemeMode.dark
        ? const Color(0xFFE5E6EB)
        : const Color(0XFF5E5775);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
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
