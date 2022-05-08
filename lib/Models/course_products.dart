import 'package:flutter/material.dart';

import './course.dart';

class CourseProducts with ChangeNotifier {
  final List<Course> _items = [
    Course(
        id: "Course1",
        title: "Mathematics",
        thumbnail:
            "https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/image/rDtN98Qoishumwih/math-style-background_zJnqZ4_O_thumb.jpg",
        description: "A Good Mathematics course",
        category: "Mathematics",
        price: 20.00,
        nametutor: "Mr Agyemang",
        schoolOftutor: "SOS Hermanier Germanier School",
        grade_or_class: 'Basic 6'),
    Course(
        id: "Course2",
        title: "English Language",
        thumbnail:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Nuvola_Math_and_Inf.svg/640px-Nuvola_Math_and_Inf.svg.png",
        description: "A Good Language course",
        category: "Language",
        price: 20.00,
        nametutor: "Mr Ababio",
        schoolOftutor: "SOS Hermanier Germanier School",
        grade_or_class: 'Basic 2'),
    Course(
        id: "Course 3",
        title: "Social Studies",
        thumbnail:
            "https://cdn.xxl.thumbs.canstockphoto.com/social-studies-class-social-studies-written-on-a-chalkboard-with-a-piece-of-white-chalk-pictures_csp17918986.jpg",
        description:
            "History, Politics and Environment combined into one practical course",
        category: "Social Studies",
        price: 20.00,
        nametutor: "Mr Kwadwo",
        schoolOftutor: "SOS Hermanier Germanier School",
        grade_or_class: 'JHS 3'),
    Course(
        id: "Course 2",
        title: "Religious and Moral Education",
        thumbnail:
            "https://cdn.xxl.thumbs.canstockphoto.com/social-studies-class-social-studies-written-on-a-chalkboard-with-a-piece-of-white-chalk-pictures_csp17918986.jpg",
        description:
            "History, Politics and Environment combined into one practical course",
        category: "Social Studies",
        price: 20.00,
        nametutor: "Mr Kwadwo",
        schoolOftutor: "SOS Hermanier Germanier School",
        grade_or_class: 'Basic 4'),
    Course(
        id: "Course 3",
        title: "Integrated Science",
        thumbnail:
            "https://cdn.xxl.thumbs.canstockphoto.com/social-studies-class-social-studies-written-on-a-chalkboard-with-a-piece-of-white-chalk-pictures_csp17918986.jpg",
        description:
            "History, Politics and Environment combined into one practical course",
        category: "Social Studies",
        price: 40.00,
        nametutor: "Mr Aryee",
        schoolOftutor: "SOS Hermanier Germanier School",
        grade_or_class: 'JHS 2'),
  ];

  List<Course> get items {
    return [..._items];
  }

  Course findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
