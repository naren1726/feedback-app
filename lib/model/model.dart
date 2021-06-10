/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String rating;
  String feedback;

  FeedbackForm(this.rating, this.feedback);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['rating']}", "${json['feedback']}");
  }

  // Method to make GET parameters.
  Map<String, dynamic> toMap() => {'rating': rating, 'feedback': feedback};
}
