import 'package:flutter/material.dart';

class BottomNavBarItems{
  IconData icon;
  String label;

  BottomNavBarItems({required this.icon,required this.label});

  static List<BottomNavBarItems> items =[
    BottomNavBarItems(icon: Icons.home_filled, label: 'الرئيسية'),
    BottomNavBarItems(icon: Icons.calendar_today, label: 'الحجوزات'),
    BottomNavBarItems(icon: Icons.tips_and_updates, label: 'نصائح'),
    BottomNavBarItems(icon: Icons.person, label: 'الملف الشخصي'),
  ];

}