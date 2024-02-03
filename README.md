# Dart

### vscode dart 환경설정 - https://dart-ko.dev/get-dart

- SDK는 디폴트로 C:\tools\dart-sdk에 설치됩니다.
  - PowerShell 관리자 권한으로 열기
  - choco install dart-sdk
  - choco upgrade dart-sdk
  - vscode > 관리 > 명령팔레트 > Dark: New Project

### 문법

```
void main() {
  //타입을 모른다면 dynamic 을 사용. 모든 타입 사용가능. 하지만 조심스럽게 사용해야함.
  dynamic name;
  if (name is String) {
    name.isNotEmpty;
  }

  //final 변수는 타입을 변경할 수 없음, dart 에서 final 은 javascript 나 typescript의 const 비슷함
  final sum = 15;
  sum.isNaN;

  //late 는 초기에 데이터 없이 변수를 선언할 수 있음
  late final String pname;
  pname = "빙";
  pname.isNotEmpty;

  //null safety => 어떤 변수, 혹은 데이터가 null이 될수 있음을 명시
  String? bing = "별";
  bing = null;
  bing?.isNotEmpty;

  //dart 의 const 는 javascript나 typescript와 다름
  //dart 에서 const 는 compile-time constant 를 만듬
  //final 이나 var 은 어떤 값인지 모르고, 그 값이 API로 부터 온다거나 사용자가 화면에 입력해야 하는 값이라면 사용
  //const 변수들은 컴파일 때 평가 됨. 중요함. 컴파일 때 평가 함.
  //const 는 컴파일하고 앱스토어에 올릴 때 그 값을 알고 있다면 사용.
  const max_allowed_price = 120;
  max_allowed_price.isNaN;

  //자료형
  String tring = "bingstar";
  bool ool = true;
  int nt = 12;
  double ouble = 69.99;
  num um = 12;
  um = 1.1;

  //list 는 if, for을 지원함
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];

  //변수 사용
  var my_name = "Bingstar";
  var age = 40;
  var greeting = "Hello everyone, my name is $my_name and I\'m ${age + 2}";

  //콜렉션 사용
  var oldFriends = ['bing', 'star'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) "❤️ $friend",
  ];

  //Map
  /_ Map<List<int>>, bool> player = {[1,2,3]:true}; _/
  /_ List<Map<string, object>> player = {'name':'bing', 'age':10}; _/
  var player = {
    'name': 'bing',
    'xp': 19.99,
    'superpower': false,
  };

  //Set 에 속한 모든 아이템들은 유니크 함
  //요소가 항상 하나식만 있어야 되면 Set을 사용하는게 유리
  Set<int> numbers_1 = {1, 2, 3, 4};
  numbers_1.add(1);
  numbers_1.add(2);
  numbers_1.add(5);
  //Function
  print(sayhello("bingstar", 40));
  print(plus(1, 2));

  //?? => 만약 좌항이 null이면 우항을 return 함
  //??= => 만약 값이 null 이면 값을 할당 함
  name ??= "bing";
  name = null;
  name ??= "star";
  print(name);

  capitalizeName("bingstar");
  capitalizeName(null);

  //alias => 만약 구조화된 data의 형태를 지정하고 싶다면 class를 만들어서 사용
  print(reverseListOFNumbers([1, 2, 3]));
  print(sayHi({"name": "bingstar"}));
}

// => 바로 return
//String sayhello(String name) => "Hello $name nice to meet you";
String sayhello(String name, int age, [String? country = "kor"]) {
  return "Hello $name, you are $age, and you come from $country";
}

String plus(num a, num b) {
  var sum = a + b;
  return "합은 $sum 입니다.";
}

/_ String capitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return "ANON";
} _/

String capitalizeName(String? name) =>
  //name != null ? name.toUpperCase() : "ANON";
  name?.toUpperCase() ?? "ANON";

typedef ListOfTnts = List<int>;
ListOfTnts reverseListOFNumbers(List<int> list) {
  var reversed = list.reversed;
  return reversed.toList();
}

typedef UserInfo = Map<String, String>;
  String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
  }
```

```
enum Team { red, blue }
enum XPLevel { beginner, medium, pro }

class Player {
  String name;
  Team team;
  XPLevel xp;
  int age;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'],
        age = playerJson['age'];

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

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var bing = Player(name: "star", xp: XPLevel.medium, team: Team.red, age: 22)
    ..name = "las"
    ..xp = XPLevel.beginner
    ..team = Team.red
    ..age = 21
    ..sayHello();

  var apiData = [
    {
      "name": "bing",
      "team": Team.blue,
      "xp": XPLevel.pro,
      "age": 20,
    },
  ];
  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}

```
