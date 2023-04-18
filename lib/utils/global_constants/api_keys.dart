class ApiKeys {
  //Auth and Security
  static const String register = "auth/register";
  static const String loginDefault = "auth/login";
  static const String loginGoogle = "auth/google";
  static const String loginFB = "auth/facebook";
  static const String resetPassword = "user/forgotPassword";
  static const String changePassword = "auth/change-password";
  static const String verifyAccount = "auth/verifyAccount";
  //Tutor
  static const String becomeTeacher = "tutor/register";
  static const String listTutor = "tutor/more";
  static const String feedbackTutor = "user/feedbackTutor";
  static const String tutorInfo = "tutor/:tutorId";
  static const String searchTutor = "tutor/search";
  static const String addToFav = "user/manageFavoriteTutor";
  // Course
  static const String listCourse = "course?page=1&size=100";
  static const String courseDetail = "course/";
  //Scedule
  static const String ownSchedule = "schedule";
  static const String schedulesWithTutorId = "schedule";
  static const String bookedClasses =
      "booking/list/student?page=1&perPage=20&dateTimeLte=1639805436469&orderBy=meeting&sortBy=desc";
  static const String bookAClass = "booking";
  static const String cancelBooking = "booking";
  static const String updateStudentReq = "booking/student-request/:bookedId";
}
