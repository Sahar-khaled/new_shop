import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];


static Category fromSnapShot(DocumentSnapshot snapshot){
  Category category = Category(name: snapshot['name'], imageUrl:snapshot['imageUrl'] );
  return category;
}











  // static List<Category> categories = [
  //   Category(
  //       name: 'vegetables',
  //       imageUrl:
  //           'https://media.istockphoto.com/photos/arabic-and-middle-eastern-dinner-table-hummus-tabbouleh-salad-salad-picture-id1175505781?k=20&m=1175505781&s=612x612&w=0&h=STomby2lCtcvpl_hxK6RhknQQWrkvpkHcoDLD4zttFk='),
  //   Category(
  //       name: 'pasta',
  //       imageUrl:
  //           'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-bucatinipasta-028-ls-1607552701.jpg?crop=0.667xw:1.00xh;0.245xw,0&resize=640:*'),
  //   Category(
  //       name: 'fruits',
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1519996529931-28324d5a630e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
  //   Category(
  //       name: 'drinks',
  //       imageUrl:
  //           'https://www.listchallenges.com/f/lists/785edee0-1dde-49d1-94bc-c23f86d0660e.jpg'),
  //   Category(
  //       name: 'candy',
  //       imageUrl:
  //           'https://images.theconversation.com/files/270326/original/file-20190423-15221-1hw5opp.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip'),
  //   Category(
  //       name: 'sweets',
  //       imageUrl:
  //           'https://www.popsci.com/uploads/2019/03/18/GHDDTIRYTR22T6DYZG6GGWUZCQ-1024x683.jpg'),
  // ];
}
