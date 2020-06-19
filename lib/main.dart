
import 'package:flutter/material.dart';
import 'package:flutterhivdemo/person.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main()  
{
  runApp(MaterialApp(home: MyHiveDemo(),));
}

class MyHiveDemo extends StatefulWidget {
  @override
  _MYState createState() => _MYState();
}

class _MYState extends State<MyHiveDemo>
{
  var userId = 'PrakashJat042';
  Box box;
  @override
  Widget build(BuildContext context)
  {
    return Container();
  }

  @override
  void initState() {
    print('initState');
    initializeHive();
    super.initState();
  }

  Future<void> initializeHive() async {


    final directory = await getExternalStorageDirectory();

    Hive
      ..init(directory.path)
      ..registerAdapter(PersonAdapter());



   bool isLogin = await loginUserStatus();
    if(isLogin)
    {
      storeAllUserDetails();
    }else{
      box.put('userId', 'PrakashJat042');
      DateTime dateTime= new DateTime.now();
      box.put('loginTime', dateTime);
      storeAllUserDetails();

    }





  }

  Future<bool> loginUserStatus()async
  {
    box = await Hive.openBox('loginBox');
    var loginUserId = box.get('userId')?? null;
    if(loginUserId!=null)
      {
         var lastLoginTime = box.get('loginTime')?? null;

         if(lastLoginTime!=null)
           {
             DateTime dateTime= new DateTime.now();
             var storeTime = lastLoginTime as DateTime;

            if( dateTime.difference(storeTime).inDays==0)
              {

                return true;
              }

           }
      }


    return false;


  }



  void storeAllUserDetails()async
  {
    var person = Person( userid:'11',username:'Prakash Chandra Jat',age:29);
    var person1 = Person( userid:'12',username:'Name Detail',age:30);
    var person2 = Person( userid:'13',username:'3 Name Detail',age:31);

    var list = List<Person>();
    list.add(person);
    list.add(person1);
    list.add(person2);
    box.put('person1', list);

    var listGet = box.get('person1');

    for( var person in listGet)
      {
       print(person);
      }
  }
}



