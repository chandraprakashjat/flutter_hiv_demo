part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  Person read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      userid: fields[0] as String,
      username: fields[1] as String,
      age: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userid)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.age);
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;


}