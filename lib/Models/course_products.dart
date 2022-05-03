import 'package:flutter/material.dart';

import './course.dart';

class CourseProducts with ChangeNotifier {
  final List<Course> _items = [
    Course(
        id: "Course1",
        title: "Mathematics For Basic 6",
        thumbnail:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Nuvola_Math_and_Inf.svg/640px-Nuvola_Math_and_Inf.svg.png",
        description: "A Good Mathematics course",
        price: 20.00,
        nametutor: "Mr Agyemang",
        schoolOftutor: "SOS Hermanier Germanier School"),
    Course(
        id: "Course2",
        title: "English Language For Basic 6",
        thumbnail:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Nuvola_Math_and_Inf.svg/640px-Nuvola_Math_and_Inf.svg.png",
        description: "A Good Mathematics course",
        price: 20.00,
        nametutor: "Mr Ababio",
        schoolOftutor: "SOS Hermanier Germanier School"),
    Course(
        id: "Course 3",
        title: "Social Studies For JHS 2",
        thumbnail:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Nuvola_Math_and_Inf.svg/640px-Nuvola_Math_and_Inf.svg.png",
        description: "A Good Mathematics course",
        price: 20.00,
        nametutor: "Mr Kwadwo",
        schoolOftutor: "SOS Hermanier Germanier School"),
  ];

  List<Course> get items {
    return [..._items];
  }

  Course findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
