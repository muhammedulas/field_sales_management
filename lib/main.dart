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
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.black),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
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
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          unselectedItemColor: Colors.blueAccent.shade100,
          selectedItemColor: Colors.blue,
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
