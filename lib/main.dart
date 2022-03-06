import 'package:field_sales_management/screens/login_screen.dart';
import 'package:field_sales_management/screens/main/tasks_screen.dart';
import 'package:field_sales_management/screens/main/chat_screen.dart';
import 'package:field_sales_management/screens/main/orders_screen.dart';
import 'package:field_sales_management/services/auth_service.dart';
import 'package:field_sales_management/style/lib_color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main/proposals_screen.dart';

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
        theme: ThemeData.from(colorScheme: lightColorScheme),
        darkTheme: ThemeData.from(colorScheme: darkColorScheme),
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
  State<MainPage> createState() => _MainScreenstate();
}

class _MainScreenstate extends State<MainPage> {
  int currentIndex = 0;
  static const screens = [
    ProposalsScreen(),
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
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Theme.of(context).colorScheme.primary,
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
                icon: Icon(Icons.contact_phone), label: "Cari Hesaplar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.pending_actions), label: "Görevlendirmeler"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Sohbet")
          ]),
    );
  }
}
