import 'package:flutter/material.dart';

// final darktheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.black,
//   scaffoldBackgroundColor: Colors.amber,
//   appBarTheme: const AppBarTheme(
//     color: Colors.black38
//   ),

//   cardColor: Colors.black38, 
//   // colorScheme: ColorScheme(background: Colors.red, brightness: null, primary: null),
// );


final darktheme = ThemeData(
          brightness: Brightness.dark,
          // primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.grey.shade900.withOpacity(1),
          appBarTheme:
              AppBarTheme(color: Colors.grey.shade700.withOpacity(0.5)),

          // cardColor: Colors.grey.shade700.withOpacity(0.5),

          cardTheme: CardTheme(
            color: Colors.grey.shade700.withOpacity(0.5),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey.shade600.withOpacity(.3),
            selectedItemColor: Colors.lightGreenAccent.shade100,
            unselectedItemColor: Colors.grey.shade100,
            selectedIconTheme: const IconThemeData(size: 25),
            unselectedIconTheme: const IconThemeData(size: 20),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            
            // mouseCursor: MaterialStateMouseCursor.clickable
            // landscapeLayout: BottomNavigationBarLandscapeLayout.linear
            // colorScheme: ColorScheme(background: Colors.red, brightness: null, primary: null),
          ),
        );