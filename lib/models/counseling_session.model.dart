class CounselingSession {
  String counselorName;
  String counselorProfession;
  String? counselorImage;
  String date;
  String time;
  bool upcoming;

  CounselingSession({
    required this.counselorName,
    required this.counselorProfession,
    this.counselorImage,
    required this.date,
    required this.time,
    required this.upcoming,
  });

  static List<CounselingSession> getCounselingSession() {
    return [
      CounselingSession(
          counselorName: 'Sahana V',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/sahana_v.png',
          date: '31st March ‘22',
          time: '7:30 PM - 8:30 PM',
          upcoming: true),
      CounselingSession(
          counselorName: 'Miya',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/miya.png',
          date: '24th March ‘22',
          time: '7:00 PM - 8:00 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Silvana',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/silvanna.png',
          date: '17th March ‘22',
          time: '7:00 PM - 8:30 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Sahana V',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/sahana_v.png',
          date: '31st March ‘22',
          time: '7:30 PM - 8:30 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Miya',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/miya.png',
          date: '24th March ‘22',
          time: '7:00 PM - 8:00 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Silvana',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/silvanna.png',
          date: '17th March ‘22',
          time: '7:00 PM - 8:30 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Sahana V',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/sahana_v.png',
          date: '31st March ‘22',
          time: '7:30 PM - 8:30 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Miya',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/miya.png',
          date: '24th March ‘22',
          time: '7:00 PM - 8:00 PM',
          upcoming: false),
      CounselingSession(
          counselorName: 'Silvana',
          counselorProfession: 'Msc in Clinical Psychology',
          counselorImage: 'assets/images/silvanna.png',
          date: '17th March ‘22',
          time: '7:00 PM - 8:30 PM',
          upcoming: false),
    ];
  }

  static CounselingSession getUpcomingCounselingSession() {
    return CounselingSession(
        counselorName: 'Sahana V',
        counselorProfession: 'Msc in Clinical Psychology',
        date: '31st March ‘22',
        time: '7:30 PM - 8:30 PM',
        upcoming: true);
  }
}
