
import 'package:hive/hive.dart';
part 'person.g.dart';
@HiveType(typeId: 0)
class Person
{
  @HiveField(0)
  String userid;
  @HiveField(1)
  String username;
  @HiveField(2)
  int age;

 Person({this.userid, this.username, this.age});


 @override
  String toString() {
    // TODO: implement toString
    return '$userid $username $age';
  }

}

