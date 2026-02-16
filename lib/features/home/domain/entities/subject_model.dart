
import 'package:flutter/material.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';

class QuestionModel {
  final String question;
  final List<String> options;
  final String answer;

  QuestionModel({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class SubjectModel {
  final String name;
  final int questionsCount;
  final IconData icon;
  final Color color;
  final List<QuestionModel> questions;

  SubjectModel({
    required this.name,
    required this.questionsCount,
    required this.icon,
    required this.color,
    required this.questions,
  });
}

List<SubjectModel> subjects = [
  // 1. Science Quiz (10 Questions)
  SubjectModel(
    name: "Science",
    questionsCount: 10,
    icon: Icons.science_outlined,
    color: AppColors.orangeColor,
    questions: [
      QuestionModel(question: "What is the chemical symbol for water?", options: ["H2O", "CO2", "O2", "NaCl"], answer: "H2O"),
      QuestionModel(question: "Which planet is known as the Red Planet?", options: ["Earth", "Mars", "Jupiter", "Venus"], answer: "Mars"),
      QuestionModel(question: "What gas do humans need to breathe?", options: ["Nitrogen", "Oxygen", "Hydrogen", "Carbon Dioxide"], answer: "Oxygen"),
      QuestionModel(question: "What is the unit of force?", options: ["Joule", "Watt", "Newton", "Volt"], answer: "Newton"),
      QuestionModel(question: "Where is the smallest bone in the human body?", options: ["Hand", "Ear", "Foot", "Nose"], answer: "Ear"),
      QuestionModel(question: "What is the hardest natural substance on Earth?", options: ["Gold", "Iron", "Diamond", "Copper"], answer: "Diamond"),
      QuestionModel(question: "How many colors are in a rainbow?", options: ["5", "6", "7", "8"], answer: "7"),
      QuestionModel(question: "What is the speed of light approximately?", options: ["300k km/s", "150k km/s", "500k km/s", "100k km/s"], answer: "300k km/s"),
      QuestionModel(question: "Which organ pumps blood through the body?", options: ["Lungs", "Liver", "Heart", "Stomach"], answer: "Heart"),
      QuestionModel(question: "Which is faster: Sound or Light?", options: ["Sound", "Light", "Both equal", "Depends on medium"], answer: "Light"),
    ],
  ),

  // 2. Math Quiz (5 Questions)
  SubjectModel(
    name: "Math",
    questionsCount: 5,
    icon: Icons.calculate_outlined,
    color: AppColors.blueColor,
    questions: [
      QuestionModel(question: "What is 7 multiplied by 8?", options: ["54", "56", "62", "48"], answer: "56"),
      QuestionModel(question: "What is the square root of 81?", options: ["7", "8", "9", "10"], answer: "9"),
      QuestionModel(question: "A triangle with all equal sides is called?", options: ["Isosceles", "Equilateral", "Scalene", "Right-angled"], answer: "Equilateral"),
      QuestionModel(question: "What is the only even prime number?", options: ["0", "2", "4", "6"], answer: "2"),
      QuestionModel(question: "What is the approximate value of pi (π)?", options: ["3.14", "2.14", "3.41", "4.13"], answer: "3.14"),
    ],
  ),

  // 3. History Quiz (6 Questions)
  SubjectModel(
    name: "History",
    questionsCount: 6,
    icon: Icons.history_edu_outlined,
    color: AppColors.brownColor,
    questions: [
      QuestionModel(question: "Who built the Great Pyramid of Giza?", options: ["Khafre", "Menkaure", "Khufu", "Ramesses"], answer: "Khufu"),
      QuestionModel(question: "When did World War I begin?", options: ["1914", "1918", "1939", "1945"], answer: "1914"),
      QuestionModel(question: "Who discovered America in 1492?", options: ["Magellan", "Vasco da Gama", "Christopher Columbus", "Ibn Battuta"], answer: "Christopher Columbus"),
      QuestionModel(question: "Where was the Sumerian civilization located?", options: ["Egypt", "Iraq", "Syria", "Greece"], answer: "Iraq"),
      QuestionModel(question: "In which year did the Umayyad Caliphate fall?", options: ["750 AD", "850 AD", "650 AD", "950 AD"], answer: "750 AD"),
      QuestionModel(question: "Who was the leader in the Battle of Hattin?", options: ["Khalid ibn al-Walid", "Saladin", "Qutuz", "Omar Mukhtar"], answer: "Saladin"),
    ],
  ),

  // 4. Geography Quiz (10 Questions)
  SubjectModel(
    name: "Geography",
    questionsCount: 10,
    icon: Icons.public_outlined,
    color: AppColors.greenColor,
    questions: [
      QuestionModel(question: "What is the largest continent?", options: ["Africa", "Asia", "Europe", "North America"], answer: "Asia"),
      QuestionModel(question: "What is the longest river in the world?", options: ["Amazon", "Nile", "Mississippi", "Danube"], answer: "Nile"),
      QuestionModel(question: "What is the capital of Japan?", options: ["Seoul", "Beijing", "Tokyo", "Bangkok"], answer: "Tokyo"),
      QuestionModel(question: "Where are the Andes Mountains located?", options: ["Africa", "Asia", "South America", "Europe"], answer: "South America"),
      QuestionModel(question: "What is the smallest country in the world?", options: ["Monaco", "Vatican City", "Malta", "San Marino"], answer: "Vatican City"),
      QuestionModel(question: "Which ocean is the largest?", options: ["Atlantic", "Indian", "Pacific", "Arctic"], answer: "Pacific"),
      QuestionModel(question: "What is the capital of Egypt?", options: ["Alexandria", "Cairo", "Giza", "Aswan"], answer: "Cairo"),
      QuestionModel(question: "Which country is called 'Country of a Million Martyrs'?", options: ["Egypt", "Palestine", "Algeria", "Tunisia"], answer: "Algeria"),
      QuestionModel(question: "Where is the Statue of Liberty?", options: ["London", "Paris", "New York", "Rome"], answer: "New York"),
      QuestionModel(question: "What is the highest mountain in the world?", options: ["Kilimanjaro", "Everest", "Atlas", "Mont Blanc"], answer: "Everest"),
    ],
  ),

  // 5. English Quiz (5 Questions)
  SubjectModel(
    name: "English",
    questionsCount: 5,
    icon: Icons.language_outlined,
    color: AppColors.purpleColor,
    questions: [
      QuestionModel(question: "What is the past tense of 'Go'?", options: ["Goes", "Went", "Gone", "Going"], answer: "Went"),
      QuestionModel(question: "Which of these is a vowel?", options: ["B", "C", "A", "D"], answer: "A"),
      QuestionModel(question: "What is the opposite of 'Happy'?", options: ["Sad", "Glad", "Angry", "Fast"], answer: "Sad"),
      QuestionModel(question: "What is the plural of 'Child'?", options: ["Childs", "Children", "Childrens", "Childes"], answer: "Children"),
      QuestionModel(question: "Complete: I ___ a student.", options: ["is", "am", "are", "be"], answer: "am"),
    ],
  ),
];