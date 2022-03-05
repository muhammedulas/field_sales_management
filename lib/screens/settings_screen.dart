import 'package:field_sales_management/components/app_bar.dart';
import 'package:field_sales_management/screens/settings/reset_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import '../services/auth_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // --------Methods---------
  void switchTheme() {
    Provider.of<AuthService>(context, listen: false).setTheme();
  }

// --------Methods---------
  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    return ChangeNotifierProvider<AuthService>(
      create: (context) => AuthService(),
      child: Scaffold(
        appBar: globalAppbar("Ayarlar"),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // User card
              BigUserCard(
                cardColor: Colors.red,
                userName: "Kullanıcı Adı",
                userProfilePic: const AssetImage("assets/avatar.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Düzenle",
                  subtitle: "Kullanıcı Bilgilerini Düzenlemek İçin Tıkla",
                  onTap: () {},
                ),
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: 'Dil',
                    subtitle: "Görüntüleme Dilinizi Seçin",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.indigo,
                    ),
                    title: 'Karanlık Mod',
                    subtitle: authService.darkMode ? "Açık" : "Kapalı",
                    trailing: Switch.adaptive(
                      value: authService.darkMode,
                      onChanged: (value) {
                        Provider.of<AuthService>(context, listen: false)
                            .setTheme();
                      },
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.amber,
                    ),
                    title: 'Hakkında',
                    subtitle: "Uygulama Hakkında",
                  ),
                ],
              ),
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Hesap",
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ),
                      );
                    },
                    icons: Icons.password,
                    iconStyle: IconStyle(
                      withBackground: true,
                      backgroundColor: Colors.redAccent,
                    ),
                    title: "Şifre Değiştir",
                  ),
                  SettingsItem(
                    onTap: () {
                      Provider.of<AuthService>(context, listen: false).logout();
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        SystemNavigator.pop();
                      }
                    },
                    icons: Icons.exit_to_app_rounded,
                    iconStyle: IconStyle(
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: "Çıkış Yap",
                    titleStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
