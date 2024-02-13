class TopicThread {
  String authorName;
  String authorImage;
  String threadText;
  String timeAgo;
  num likes;
  bool liked;
  num threadReplies;

  TopicThread({
    required this.authorName,
    required this.authorImage,
    required this.threadText,
    required this.timeAgo,
    required this.likes,
    required this.liked,
    required this.threadReplies,
  });

  static List<TopicThread> getTopicThreads() {
    return [
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'How do you cope with daily stressors and maintain your mental well-being?',
          timeAgo: 'just now',
          likes: 2,
          liked: true,
          threadReplies: 0),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'Share your favorite self-care activities that help lift your mood.',
          timeAgo: '3hrs ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'What strategies do you use to manage anxiety during challenging times?',
          timeAgo: '1hr ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'How do you create a positive mindset when facing tough situations?',
          timeAgo: '2min ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'Any tips for getting a good night\'s sleep and improving sleep quality?',
          timeAgo: '3hrs ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'What mindfulness techniques do you practice to stay present and focused?',
          timeAgo: 'just now',
          likes: 2,
          liked: true,
          threadReplies: 0),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'How do you navigate and overcome feelings of loneliness or isolation?',
          timeAgo: '3hrs ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'Share your go-to methods for boosting self-esteem and confidence.',
          timeAgo: '1hr ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'What\'s your experience with setting boundaries for a healthier work-life balance?',
          timeAgo: '2min ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
      TopicThread(
          authorName: 'Pigeon Car',
          authorImage: 'assets/images/james_scholz.jpg',
          threadText:
              'Any advice on managing and expressing emotions in a healthy way?',
          timeAgo: '3hrs ago',
          likes: 12,
          liked: false,
          threadReplies: 2),
    ];
  }
}
