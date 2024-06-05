// ignore_for_file: unused_field, unused_element

class _DemoFactory extends _DemoFactorySuperClass {
  static String demoString = "tamil";
  int number = 10;
  _DemoFactory() : number = 100; //without this constructor factory constructor can't be executed
  _DemoFactory.namedConstructor();

  factory _DemoFactory.factoryConstructor() {

    //super(20);//not possible to call super class constructor
    //number =500;//can't access instance fields
    //demoFunction();//can't access instance functions

    demoString = "selvan"; //can access static fields
    demoStaticFunction(); //can access static functions
    return _DemoFactory(); //return statement is mandatory
  }

  void demoFunction() {}

  static void demoStaticFunction() {}
}

class _DemoFactorySuperClass {
  int? integer;

  _DemoFactorySuperClass({this.integer});
}

class _DemoFactorySubClass extends _DemoFactory {
  _DemoFactorySubClass() : super.namedConstructor(); //possible
//_DemoFactorySubClass.gettingFactoryConstructor():super.factoryConstructor();//not possible
}
