import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app_ui/screens/home.screen.dart';
import 'package:mental_health_app_ui/screens/counseling_session.screen.dart';
import 'package:mental_health_app_ui/screens/wellness_hub.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedScreenIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CounselingSessionScreen(),
    const HomeScreen(),
    const WellnessHubScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mental Health App UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.epilogueTextTheme(Theme.of(context).textTheme),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFFBFBFB),
          appBar: _buildAppBar(),
          body: screens[_selectedScreenIndex],
          bottomNavigationBar: _buildBottomNavigationBar(),
        ));
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(68.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          color: Colors.white,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 22.0,
                  backgroundColor: const Color(0xFFF09E54).withOpacity(0.5),
                  child: const CircleAvatar(
                    radius: 18.0,
                    backgroundImage:
                        AssetImage('assets/images/james_scholz.jpg'),
                  ),
                ),
                Badge(
                  backgroundColor: const Color(0xFFFE8235),
                  label: const Text(
                    '3',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500),
                  ),
                  child: SvgPicture.asset('assets/icons/notification-bell.svg'),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildBottomNavigationBar() {
    return SizedBox(
      height: 108.0,
      child: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home-outline.svg'),
              activeIcon: SvgPicture.asset('assets/icons/home-filled.svg'),
              label: ''),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/camera-outline.svg'),
            activeIcon: SvgPicture.asset('assets/icons/camera-filled.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/message-outline.svg'),
              activeIcon: SvgPicture.asset('assets/icons/message-filled.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/community-outline.svg'),
              activeIcon: SvgPicture.asset('assets/icons/community-filled.svg'),
              label: '')
        ],
        currentIndex: _selectedScreenIndex,
        onTap: (int index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
      ),
    );
  }
}
