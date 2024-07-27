import 'package:flutter/material.dart';
import 'package:zc_dodiddone/Theme/theme.dart'; // Импортируем тему

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
    const ProfileScreen(), // Профиль
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Профиль'));
  }
}

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Выполнено'));
  }
}
