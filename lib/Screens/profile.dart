import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../Theme/theme.dart'; // Импортируем тему

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEmailVerified = false; // Флаг для проверки подтверждения почты
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Аватар
          CircleAvatar(
            radius: 50,
            backgroundImage: const AssetImage(
                'assets/IMG_20210104_114234.jpg'), // Замените на реальный путь к аватару
          ),
          const SizedBox(height: 20),
          // Почта
          Text(
            'example@email.com', // Замените на реальную почту пользователя
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          // Кнопка подтверждения почты (отображается, если почта не подтверждена)
          if (!isEmailVerified)
            ElevatedButton(
              onPressed: () {
                // Обработка отправки запроса подтверждения почты
                // Например, можно показать диалог с сообщением о том, что письмо отправлено
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Подтверждение почты'),
                    content: const Text(
                        'Письмо с подтверждением отправлено на ваш адрес.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DoDidDoneTheme
                    .lightTheme.colorScheme.primary, // Основной цвет из темы
              ),
              child: const Text('Подтвердить почту'),
            ),
          const SizedBox(height: 20),
          // Кнопка выхода из профиля
          ElevatedButton(
            onPressed: () {
              // Обработка выхода из профиля
              // Например, можно перейти на страницу входа
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DoDidDoneTheme
                  .lightTheme.colorScheme.surface, // Цвет фона из темы
            ),
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
