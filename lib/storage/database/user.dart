class User {
  late final int id;
  late final String name;
  late final int age;
  late final int salary;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.salary,
  });

  User.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"],
        age = result["age"],
        salary = result["salary"];
  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'salary': salary
    };
  }
}
