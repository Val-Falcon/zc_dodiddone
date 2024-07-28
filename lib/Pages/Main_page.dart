import 'package:flutter/material.dart';
import 'package:zc_dodiddone/Theme/theme.dart';

import '../Screens/profile.dart';
import 'login_page.dart'; // Импортируем тему

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TasksScreen(), // Задачи
    const TodayScreen(), // Сегодня
    const ProfilePage(), // Профиль
    const CompletedScreen(), // Выполнено
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Прозрачный AppBar
        elevation: 0, // Убираем тень
        title: const Text('DoDidDone'),
        centerTitle: true,
      ),
      body: Container(
        // Добавляем Container для градиента
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
              DoDidDoneTheme.lightTheme.colorScheme.primary,
            ],
            stops: const [0.1, 0.9], // 90% primary, 10% secondary
          ),
        ),
        child: _screens[_selectedIndex], // Оборачиваем body в Container
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Тема для BottomNavigationBar
        type: BottomNavigationBarType.fixed, // Фиксированный стиль
        backgroundColor:
            DoDidDoneTheme.lightTheme.colorScheme.primary, // Цвет фона из темы
        selectedItemColor: DoDidDoneTheme.lightTheme.colorScheme
            .surface, // Основной цвет для выбранных иконок
        unselectedItemColor: Colors.grey, // Серый цвет для невыбранных иконок
        elevation: 0, // Убираем тень
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
        ],
      ),
    );
  }
}

// Заглушки для экранов
class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Задачи'));
  }
}

class TodayScreen extends StatelessWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Сегодня'));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              backgroundColor: Colors.red, // Красный цвет для кнопки выхода
            ),
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }
}

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Выполнено'));
  }
}
