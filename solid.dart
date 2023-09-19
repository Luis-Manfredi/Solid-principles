void main() {
  // Principle 2
  var worker = Developer();
  var designer = Designer();

  print(worker.doWork());
  print(designer.doWork());

  // Principle 5
  PasswordReminder(MyDatabaseConnection());
}

// Principios SOLID

// Single Responsability:
// Cada clase o metodo debe tener una sola funcionalidad, 
// y lo debe hacer bien. Una clase o funcion no debe hacer
// muchas cosas. Esto quiere decir que cada clase debe ser
// especializada.

class AuthLogin {
  void doLogin(String email, String password) {
    EncryptPassword.encryptPassword();
    // Do Login
  }
}

class EncryptPassword {
  static encryptPassword() {
    // Do something
    print('password encrypted');
  }
}


// Open Closed Principle: 
// una clase debe estar abierta para su extensión, pero cerrada para su modificación

abstract class Worker {
  const Worker();
  String doWork();
}

class Developer extends Worker {
  @override
  String doWork() {
    return 'Estoy programando';
  }
}

class Designer extends Worker {
  @override
  String doWork() {
    return 'Estoy diseñando';
  }
}


// Liskov Substitution:
// Las clases hijos deben ser sustituibles por la clase
// padre sin romper el comportamiento del código.

abstract class Plane {}

abstract class RealPlane {
  void startEngines();
}

class FighterPlane extends RealPlane {
  @override
  void startEngines() {
    print('Engines started');
  }
}

class PaperPlane extends Plane {}


// Interface Segregation:
// Este principio establece que se deben crear interfaces
// con métodos mínimos. Dicho de otro modo, no se debe forzar a
// una clase de depender de funciones que no necesite.

abstract class Work {
  void work();
}

abstract class Sleep {
  void sleep();
}

class Human implements Work, Sleep {
  @override
  void sleep() {
    print('I work a lot...');
  }

  @override
  void work() {
    print('I must sleep 8 hours at least');
  }
}

class Robot implements Work {
  @override
  void work() {
    print('I never stop working');
  }
}


// Dependency Inversion:
// Las entidades deben depender de abstracciones, no de
// concreciones, es decir, los modulos de alto nivel no deben
// depender de los modulos de bajo nivel, sino de clases abstractas

abstract class DBConnectionInterface {
  connect();
}

class MyDatabaseConnection implements DBConnectionInterface {
  @override
  connect() {
    print('connected');
    // connect with the database
    // Seguir este principio nos permite hacer cambios en la 
    // base de datos libremente sin tocar el código que maneja
    // la recuperación de contraseña 
  }
}

class PasswordReminder {
  // Definimos una interfaz, para que la clase actual reciba
  // una implementación de dicha interfaz. Ejemplo: 
  // PasswordReminder(MyDatabaseConnection());
  DBConnectionInterface dbConnection;
  PasswordReminder(this.dbConnection);
}
