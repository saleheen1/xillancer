class AccountSetupHelper {
  List<TopicClass> topics = [
    TopicClass(
        topicTitle: 'How do you professionally introduce yourself?',
        topicName: 'Introduction'),
    TopicClass(
        topicTitle: 'Let clients know about your professional experiences',
        topicName: 'Experiences'),
    TopicClass(
        topicTitle: 'What’s your educational background?',
        topicName: 'Educations'),
    TopicClass(
        topicTitle: 'Add the services and necessary skills you offer',
        topicName: 'Work & Skills'),
    TopicClass(
        topicTitle: 'Add your hourly rate and profile photo to finish',
        topicName: 'Finish Set up'),
  ];
}

class TopicClass {
  String? topicTitle;
  String? topicName;

  TopicClass({this.topicName, this.topicTitle});
}
