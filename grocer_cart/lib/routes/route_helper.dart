// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
// import 'package:grocer_cart/pages/grocery/popular_grocery_detail.dart';
//
// import '../pages/home/main_page.dart';
//
// class RouteHelper{
//   static const String initial="/";
//   static const String popularGrocery="/popular-grocery";
//   static const String recommendedGrocery="/recommended-grocery";
//   static String getInitial()=>'$initial';
//   static String getPopularGrocery()=>'$popularGrocery';
//   static String getRecommendedGrocery()=>'$recommendedGrocery';
//
//
//
//
//   static List<GetPage> routes=[
//     GetPage(name: initial, page: ()=>MainPage()),
//     GetPage(name:popularGrocery, page: (){
//
//       return PopularGroceryDetail();
//     },
//       transition: Transition.fadeIn
//     ),
//     GetPage(name:recommendedGrocery, page: (){
//
//       return Recomme();
//     },
//         transition: Transition.fadeIn
//     ),
//
//   ];
// }