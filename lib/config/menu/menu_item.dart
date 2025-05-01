// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progres indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
   MenuItem(
    title: 'Snackbars Y Dialogos',
    subtitle: 'Snackbars',
    link: '/snackbar',
    icon: Icons.message,
  ),
    MenuItem(
    title: 'Animated Container',
    subtitle: 'Containers',
    link: '/container',
    icon: Icons.crop_square,
  ),
    MenuItem(
    title: 'Checkbox, Radio buttons y mas',
    subtitle: 'Controles de UI',
    link: '/controles',
    icon: Icons.check_box,
  ),
     MenuItem(
    title: 'APP Tutorial',
    subtitle: 'Un pequeño tutorial',
    link: '/apptutorial',
    icon: Icons.tour,
  ),

];
