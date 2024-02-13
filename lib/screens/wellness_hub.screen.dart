import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app_ui/models/topic_thread.model.dart';

class WellnessHubScreen extends StatefulWidget {
  const WellnessHubScreen({super.key});

  @override
  State<WellnessHubScreen> createState() => _WellnessHubScreenState();
}

class _WellnessHubScreenState extends State<WellnessHubScreen> {
  List<String> topics = [];
  int selectedTopicIndex = 0;
  List<TopicThread> topicThreads = [];

  @override
  void initState() {
    super.initState();
    topicThreads = TopicThread.getTopicThreads();
    topics = ['Trending', 'Relationship', 'Self-care', 'Work-life balance'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 12.0,
            ),
            _buildHeader(),
            const SizedBox(
              height: 20.0,
            ),
            _buildTopicList(),
            const SizedBox(
              height: 20.0,
            ),
            _buildThreadList(),
            const SizedBox(
              height: 26.0,
            ),
          ]),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Container _buildFloatingActionButton() {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color(0xFFF6CFAD).withOpacity(0.66),
              offset: const Offset(0.0, 4.0),
              blurRadius: 12.0,
              spreadRadius: 0.0)
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        backgroundColor: const Color(0xFFFE8235),
        child: SvgPicture.asset('assets/icons/pen.svg'),
      ),
    );
  }

  ListView _buildThreadList() {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: topicThreads.length,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemBuilder: (context, index) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage(topicThreads[index].authorImage),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          topicThreads[index].authorName,
                          style: GoogleFonts.rubik(
                              color: const Color(0xFF573926),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '• ${topicThreads[index].timeAgo}',
                          style: GoogleFonts.rubik(
                              color: const Color(0xFF707070),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      topicThreads[index].threadText,
                      style: GoogleFonts.rubik(
                          color: const Color(0xFF573926),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(topicThreads[index].liked
                                    ? 'assets/icons/like-orange.svg'
                                    : 'assets/icons/like-grey.svg'),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(topicThreads[index].likes.toString())
                              ],
                            ),
                            const SizedBox(
                              width: 28.0,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/comment.svg'),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(topicThreads[index]
                                    .threadReplies
                                    .toString())
                              ],
                            )
                          ],
                        ),
                        SvgPicture.asset('assets/icons/share.svg')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Divider(
            thickness: 1.0,
            color: const Color(0xFFD9D8D8).withOpacity(0.3),
          )
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16.0,
      ),
    );
  }

  SizedBox _buildTopicList() {
    return SizedBox(
      height: 38.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          itemCount: topics.length,
          itemBuilder: (context, index) => TextButton(
              onPressed: () {
                setState(() {
                  selectedTopicIndex = index;
                });
              },
              style: TextButton.styleFrom(
                  foregroundColor: index == selectedTopicIndex
                      ? Colors.orange.shade300
                      : Colors.grey,
                  backgroundColor: Color(
                      index == selectedTopicIndex ? 0xFFFE8235 : 0xFFF4F2F1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 16.0)),
              child: Text(
                topics[index],
                style: GoogleFonts.epilogue(
                    color: Color(
                        index == selectedTopicIndex ? 0xFFFBFBFB : 0xFF8A8A8A),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              )),
          separatorBuilder: (context, index) => const SizedBox(
                width: 12.0,
              )),
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Wellness Hub',
        style: GoogleFonts.epilogue(
            color: const Color(0xFF371B34),
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
