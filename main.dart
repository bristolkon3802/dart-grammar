enum Team { red, blue }

//Mixin => 생성자가 없는 클래스. 클래스에 프로퍼티들을 추가하거나 할 때 사용
mixin Strong {
  final double strenghtLevel = 1500.99;
}
mixin QuickRunner {
  void runQuick() {
    print("ruuuuuuuuuuuuuu");
  }
}
mixin Tall {
  final double height = 1.99;
}

class PlayerOne with Strong, QuickRunner, Tall {
  final Team team;
  PlayerOne({
    required this.team,
  });
}

class PlayerTwo with Strong, Tall {
  final Team team;
  PlayerTwo({
    required this.team,
  });
}

//추상화 클래스 => 특정 메소드를 구현하도록 강제
abstract class Humans {
  final String name;
  final int age;
  Humans({
    required this.name,
    required this.age,
  });
  void sayHello() {
    print("Hi my name is $name and age $age");
  }
}

class Players extends Humans {
  final Team team;
  Players({
    required this.team,
    required String name,
    required int age,
  }) : super(name: name, age: age);

  @override
  void sayHello() {
    super.sayHello();
    print('and I play for ${team}');
  }
}

abstract class Human {
  void walk();
}

enum XPLevel { beginner, medium, pro }

class Player extends Human {
  String name;
  Team team;
  XPLevel xp;
  int age;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  Player.createBluePlayer({required String name, required int xp})
      : this.name = name,
        this.xp = XPLevel.pro,
        this.team = Team.blue,
        this.age = 22;

  Player.createRedPlayer(String name, int xp)
      : this.name = name,
        this.xp = XPLevel.medium,
        this.team = Team.red,
        this.age = 22;

  void walk() {
    print("Im walking");
  }

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var bing = Player(name: "star", xp: XPLevel.medium, team: Team.red, age: 22)
    ..name = "bing"
    ..xp = XPLevel.beginner
    ..team = Team.red
    ..age = 21
    ..sayHello()
    ..walk();

  void player = Players(team: Team.blue, name: "bingstar", age: 21)..sayHello();

  var player_ = PlayerOne(team: Team.red);
}
