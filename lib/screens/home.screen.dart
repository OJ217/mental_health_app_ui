import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app_ui/models/feeling_checkup.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FeelingCheckup> feelings = [];

  @override
  void initState() {
    super.initState();
    feelings = FeelingCheckup.getFeelings();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 12.0,
        ),
        _buildHeader(),
        const SizedBox(
          height: 26.0,
        ),
        _buildFeelingCheckupList(),
        const SizedBox(
          height: 26.0,
        ),
        _buildSessionCard(),
        const SizedBox(
          height: 26.0,
        ),
        _buildResourcesSection(),
        const SizedBox(
          height: 26.0,
        ),
        _buildPlanCard(),
        const SizedBox(
          height: 26.0,
        ),
      ],
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: RichText(
          text: TextSpan(
              style: GoogleFonts.epilogue(
                  textStyle: const TextStyle(
                      color: Color(0xFF371B34), fontSize: 26.0, height: 1.28)),
              children: [
            TextSpan(
                text: 'Good Afternoon,\n',
                style: GoogleFonts.epilogue(fontWeight: FontWeight.w500)),
            TextSpan(
                text: 'James!',
                style: GoogleFonts.epilogue(fontWeight: FontWeight.w700))
          ])),
    );
  }

  Column _buildFeelingCheckupList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'How are you feeling today ?',
            style: GoogleFonts.epilogue(
                color: const Color(0xFF371B34),
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
            height: 84.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: feelings.length,
              itemBuilder: (context, index) => SizedBox(
                height: 84.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 62.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: feelings[index].bgColor,
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Center(
                        child: SvgPicture.asset(
                          feelings[index].iconPath,
                        ),
                      ),
                    ),
                    Text(
                      feelings[index].title,
                      style: const TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 24.0,
              ),
            ))
      ],
    );
  }

  Padding _buildSessionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        height: 152.0,
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        decoration: BoxDecoration(
            color: const Color(0xFFFEF3E7),
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1 on 1 Sessions',
                style: GoogleFonts.epilogue(
                    color: const Color(0xFF573926),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                'Let’s open up to the things that\nmatter the most',
                style: GoogleFonts.rubik(
                    color: const Color(0xFF573926),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Book Now',
                    style: GoogleFonts.epilogue(
                        color: const Color(0xFFFE8235),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  SvgPicture.asset('assets/icons/date-orange.svg')
                ],
              )
            ],
          ),
          Positioned(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset('assets/svg/session-meetup.svg'))),
        ]),
      ),
    );
  }

  Padding _buildResourcesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 62.0,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F3F1),
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Row(children: [
                    SvgPicture.asset('assets/icons/journal.svg'),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Journal',
                      style: GoogleFonts.epilogue(
                          color: const Color(0xFF573926),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  height: 62.0,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F3F1),
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Row(children: [
                    SvgPicture.asset('assets/icons/library.svg'),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Library',
                      style: GoogleFonts.epilogue(
                          color: const Color(0xFF573926),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6F6),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Stack(
              children: [
                Text(
                  '“It is better to conquer yourself than\nto win a thousand battles”',
                  style: GoogleFonts.epilogue(
                      color: const Color(0xFF707070),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Positioned(
                    right: 0.0,
                    top: 8.0,
                    child: SvgPicture.asset('assets/icons/quote.svg'))
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildPlanCard() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          height: 152.0,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          decoration: BoxDecoration(
              color: const Color(0xFF55A06F),
              borderRadius: BorderRadius.circular(20.0)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plan Expired',
                    style: GoogleFonts.epilogue(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Get back chat access and\nsession credits',
                    style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Buy More',
                        style: GoogleFonts.epilogue(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      SvgPicture.asset('assets/icons/arrow-left.svg')
                    ],
                  )
                ],
              ),
              Positioned(
                  child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/svg/lotus.svg'),
              ))
            ],
          ),
        ));
  }
}
