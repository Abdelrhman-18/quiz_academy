class ResultHistoryModel {
  final int? id;
  final int userId;
  final int score;
  final int total;
  final String subject;
  final DateTime date;

  ResultHistoryModel({
    this.id,
    required this.userId,
    required this.score,
    required this.total,
    required this.subject,
    required this.date,
  });

  factory ResultHistoryModel.fromMap(Map<String, dynamic> map) {
    return ResultHistoryModel(
      id: map['id'],
      userId: map['user_id'],
      score: map['score'],
      total: map['total'],
      subject: map['subject'],
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'score': score,
      'total': total,
      'subject': subject,
      'date': date.toIso8601String(),
    };
  }
}