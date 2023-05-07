import 'package:xilancer/business_logic/core/utils/const_strings.dart';

class AccountSetupHelper {
  List<TopicClass> topics = [
    TopicClass(
        topicTitle: ConstString.howDoYouProIntroUrself,
        topicName: ConstString.introduction),
    TopicClass(
        topicTitle: ConstString.letClientKnowUrProExp,
        topicName: ConstString.experience),
    TopicClass(
        topicTitle: ConstString.whatYourEduBG,
        topicName: ConstString.educations),
    TopicClass(
        topicTitle: ConstString.addServicesAndSkills,
        topicName: ConstString.workAndSkills),
    TopicClass(
        topicTitle: ConstString.addHourlyRateAndPhoto,
        topicName: ConstString.finishSetup),
  ];
}

class TopicClass {
  String? topicTitle;
  String? topicName;

  TopicClass({this.topicName, this.topicTitle});
}
