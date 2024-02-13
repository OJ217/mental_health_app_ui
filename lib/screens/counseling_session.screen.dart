import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app_ui/models/counseling_session.model.dart';

class CounselingSessionScreen extends StatefulWidget {
  const CounselingSessionScreen({super.key});

  @override
  State<CounselingSessionScreen> createState() =>
      _CounselingSessionScreenState();
}

class _CounselingSessionScreenState extends State<CounselingSessionScreen> {
  List<CounselingSession> counselingSessions = [];
  late CounselingSession upcomingCounselingSession;

  @override
  void initState() {
    super.initState();
    counselingSessions = CounselingSession.getCounselingSession();
    upcomingCounselingSession =
        CounselingSession.getUpcomingCounselingSession();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 12.0,
          ),
          _buildUpcomingSessionCard(),
          const SizedBox(
            height: 28.0,
          ),
          _buildCounselingSessionListHeader(),
          const SizedBox(
            height: 20.0,
          ),
          _buildCounselingSessionCardsList(),
          const SizedBox(
            height: 26.0,
          ),
        ],
      ),
    );
  }

  ListView _buildCounselingSessionCardsList() {
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: counselingSessions.length,
        itemBuilder: (context, index) => Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color: counselingSessions[index].upcoming
                      ? const Color(0xFFFEF3E7)
                      : const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(counselingSessions[index].counselorImage!),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            counselingSessions[index].counselorName,
                            style: GoogleFonts.rubik(
                                color: const Color(0xFF573926),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            counselingSessions[index].counselorProfession,
                            style: GoogleFonts.rubik(
                                color: const Color(0xFF573926),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Divider(
                    thickness: 1.0,
                    color: const Color(0xFFD9D8D8).withOpacity(0.3),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/date-grey.svg'),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            counselingSessions[index].date,
                            style: GoogleFonts.rubik(
                                color: const Color(0xFF707070),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/time-grey.svg'),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            counselingSessions[index].time,
                            style: GoogleFonts.rubik(
                                color: const Color(0xFF707070),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFFE8235),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 16.0)),
                          child: Text(
                            counselingSessions[index].upcoming
                                ? 'Reschedule'
                                : 'Re-book',
                            style: GoogleFonts.epilogue(
                                color: const Color(0xFFFBFBFB),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(
                        width: 36.0,
                      ),
                      Text(
                        counselingSessions[index].upcoming
                            ? 'Join Now'
                            : 'View Profile',
                        style: GoogleFonts.epilogue(
                            color: const Color(0xFFFE8235),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 12.0,
            ));
  }

  Row _buildCounselingSessionListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'All Session',
              style: GoogleFonts.epilogue(
                  color: const Color(0xFF371B34),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 6.0,
            ),
            SvgPicture.asset('assets/icons/chevron-down.svg')
          ],
        ),
        SvgPicture.asset('assets/icons/sort.svg')
      ],
    );
  }

  Container _buildUpcomingSessionCard() {
    return Container(
      height: 152.0,
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20.0, vertical: 24.0),
      decoration: BoxDecoration(
          color: const Color(0xFFFEF3E7),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Session',
                style: GoogleFonts.epilogue(
                    color: const Color(0xFF573926),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                '${upcomingCounselingSession.counselorName} ${upcomingCounselingSession.counselorProfession}',
                style: GoogleFonts.rubik(
                    color: const Color(0xFF573926),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                upcomingCounselingSession.time,
                style: GoogleFonts.rubik(
                    color: const Color(0xFF573926),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Join Now',
                style: GoogleFonts.epilogue(
                    color: const Color(0xFFFE8235),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 6.0,
              ),
              SvgPicture.asset('assets/icons/play.svg')
            ],
          )
        ],
      ),
    );
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
}
