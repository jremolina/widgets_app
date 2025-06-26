import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

//listado de colores- un simple boolean

final colorListProvider = Provider((ref) => colorList);

// un simple int
final selectedindexcolorprovider = StateProvider((ref) => 0);
