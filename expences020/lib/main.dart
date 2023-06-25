import 'package:flutter/material.dart';
import 'widget/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 11, 224, 11));

var kColorSchemeDark =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchemeDark,
        cardTheme: const CardTheme().copyWith(
          color: kColorSchemeDark.secondaryContainer,
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorSchemeDark.primaryContainer,
              foregroundColor: kColorSchemeDark.onPrimaryContainer,
            ),
          ),
      ),
      // Esto es para darle diseño a la app
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.primary,
              foregroundColor: kColorScheme
                  .primaryContainer), //cuando ponemos este El color del texto ignorara todo lo demas
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                ),
              )),
      // themeMode: ThemeMode.system, //Esto viene por default
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    ),
  );
}
