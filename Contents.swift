import UIKit
import Darwin

/* ------ CURSO INICIAL DE PROGRAMACION CON SWIFT ---------- */

/* Generales importantes */
var myBool: Bool = true
var greeting: String = "Hello, playground" // var o let(const)
print("Menciona a myRandomNumber: \(myRandomNumber)", terminator: " ") // string interpolation y cambiando el terminador que viene por default que es "\n"
let nameChars: [Character] = ["J","o","s","e"]
let nameString = String(nameChars) // Con este metodo creamos un String y junta los caracteres

var myRandomNumber: Int = 0 // Permite numeros positivos y negativos (Ojo, tanto Int como UInt (sin especificarle cuantos bits) es lo mismo que Int64, ver si realmente se necesitan 64 bits para el dato que queremos usar ya que un numero de 64 bits es demasiado grande y probablemente desperdicio de memoria)
let cannotBeNegative: UInt = 10 // UInt no permite numeros negativos (-)
let other2Num: Int8 = Int8.min // Va de -128 a 128 (porque es la mitad de 256), ver si se necesita tanto este rango o puede usarse el UInt que no permite numeros negativos (osea que va de 0 a 255)
let minValue: UInt8 = UInt8.min // 2^0-1
let maxValue: UInt8 = UInt8.max // 2^8-1 (8 bits)

let myFloatNum: Float = 10.1 // Numeros decimales de 32 bits, menos precisión, numero de hasta 6 decimales (el resto de decimales si existen, los redondea)
let myDoubleNum: Double = 5.50 // Numeros decimales de 64 bits, mas precisión, numero de hasta 16 decimales

let oneMillion =  1_000_000 // Swift ignora el "_" al momento de ejecutarse asi que no ocupa memoria pero es mas facil leer un millon asi que sin tener ningun tipo de separador como 1000000

/* Casting */
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandOne = twoThousand + UInt16(one) // casting: transformación a otro tipo de dato
let pi: Float = 3.1416
let integerPi = Int(pi) // Te transforma el dato a un integer, osea, le borra los decimales. Hace lo mismo que el metodo [round()]

/* Custom types */
typealias AudioSample = UInt16
let audioDataReceived: AudioSample = 10_000

/* Tuplas: */
// Es la combinación de un Array y un Objeto/Mapa. Puede verse tambien como un Objeto/Mapa pero que no solo se limita a pares de key: value
let http404Error: (Int16, String) = (404, "Pagina no encontrada") // 1ra forma de tipar la tupla (se crea con indices numericos)
let http500Error: (statusCode: Int16, statusMessage: String, extra: String) = (500, "Server Error", "AnotherThing") // 2da forma de tipar la tupla (se crea con los indices nombrados que elijamos)
let http200Status = (statusCode: 200, statusMessage: "OK", extra: "Nothing") // 3ra forma de usar PERO NO DE TIPAR la tupla creandolo con indices nombrados
print("Error number: \(http404Error.0)")
print("Status message: \(http500Error.statusMessage)")
print("Another status message: \(http200Status.statusMessage)")
let (statusCode, statusMessage)  = http404Error // Creo una definición para cada elemento interno de la tupla
print(statusCode)
print(statusMessage)
let (justStatusCode, _) = http404Error // Omitir uno de los elementos usando "_"
print(justStatusCode)
(1, "Juan") < (2, "Ricardo") // true porque compara indices de uno en uno (1 es mayor que 2)
(3, "Juan") < (3, "Ricardo") // true porque en el indice 0 son iguales pero en el indice 1 que son String, este inicia con "J" y el otro con "R", "J" es antes que "R" en el alfabeto


/* Numeros mas allá de los decimales */
let decimalInteger = 17
let binaryInteger = 0b10001 // Numero 17 en binario
let octalInteger = 0o21 // Numero 17 en octal
let hexadecimalInteger = 0x11 // Numero 17 en hexadecimal
let exponentDouble = 1.22e1

/* Optionals: */
// En Swift no existe [null], solo existe la ausencia de valor y esta se llama [nil]. Es muy parecido al null safety de Flutter, usa ? y ??.
// El principal problema con los datos nil es que cuando se retornan son tratados como [Optional(datoCualquiera)] en lugar de [datoCualquiera], osea, son dos tipos de datos distintos
/* Unwrap: */
// Existen 2 unwraps; los optionals con "?" y el forzado con "!". Tambien existe el unwrapping implicito "!" al momento de tipar datos
var possibleAge: String = "26"
possibleAge = "paco"
let convertedAge: Int8? = Int8(possibleAge) // Si no es un Int8, será nill ya que es un tipo de dato opcional
if convertedAge != nil {
    print(convertedAge!) // Simbolo [!] se usa para dos cosas 1. Le dices al código que estas seguro que ya hay un valor allí y que confie en ti (El otro uso está explicado mas abajo)
}
if let convertedAgeWithoutNil = convertedAge { // Sirve para convertir un valor optional a un NO optional
    // Si [convertedAgeWithoutNil] se setea, al NO ser optional, quiere decir que en [convertedAge] si había un valor (osea que no era [nil])
    // convertedAge != nil --> El if de arriba funciona para lo mismo que esto
    print(convertedAgeWithoutNil)
}
let possibleString: String? = "holis" // Simbolo [!] 2. Cuando se usa para tipar un dato; Le dices que seguro esa variable nunca va a ser nula
// let surelyAString: String = possibleString! // Esto no debe hacerse ya que fuerza el código sin verificación que NO sea nulo
let assumedString: String! = "Otro string"
let implicitString: String = assumedString // Esto si puede hacerse ya que [assumedString] es implicito que NO será nulo

/* Funciones */
func canThrowError() throws { // Si una función por lo que sea puede fallar, hay que marcarla con "throws"
    // codigo que puede causar un error
}

/* Try-catch */
do {
    try canThrowError()
    // Si llega aquí, no ha habido error
} catch {
    // Ha habido un error
}

/* Asserts (debug, solo desarrollo) y precondiciones (validas en producción) */
// Se corren en tiempo de ejecución para asegurarse que cumplen con los requisitos que buscamos, si no, el codigo se detiene.
var age = -5
// assert(age>=0, "La edad de una persona no puede ser negativa")
// precondition(age>=0, "La edad de una persona no puede ser negativa")

/* Rangos */
// Existen rangos abiertos, semi-abiertos y cerrados
for index in 1...5 { // Rango cerrado de valores de 1 a 5 el cual puede iterarse
  print(index)
}
for index in 1..<5 { // Rango semi-abierto osea no incluyente que va del 1 al 4 (sin tomar el ultimo valor del rango)
  print(index)
}
let names = ["Jose", "Daniel", "Juan"]
for name in names[1...] { // Rango abierto; que empiece en 1 y siga adelante hasta que acabe
  print(name)
}
for name in names[...2] { // Rango abierto; que empiece desde el principio y llegue hasta 2
  print(name)
}
for (index, item) in names.enumerated() { // [.enumerated] para tener el valor y el indice
  print("Index: \(index), Item: \(item)")
}

/* Colecciones (arrays, conjuntos, diccionarios) */
/* Arrays */
var someInts: [Int8] = [] // Tambien podría inicializarse vacío usando - var someInts = [Int8]()
someInts = [] // Resetear el array
someInts.append(10) // Tambien puede añadirse un elemento nuevo con - someInts += [1,2,3]
someInts += [1,2,3]
print("Array: \(someInts)")
print("Array count: \(someInts.count)")
print("Partial array: \(someInts[0...2])")

/* Conjuntos */ // en un conjunto no hay orden en los elementos que lo componen y (en esto es parecido a un Set) no puede tener elementos duplicados. Funcionan con teoria de conjuntos (union, interseccion, - y +)
var letters: Set<Character> = []
letters.count
letters.insert("a")
letters.insert("b")
letters
letters.remove("b")

/* Diccionarios */ // Estructura de mapa - key: value
var airports = [String: String]()
airports = [:] // Vaciar el diccionario/mapa
airports["SKBO"] = "El Dorado"
airports["SKRG"] = "Jose Maria Cordova"
print("Aeropuerto: \(airports["SKRG"] ?? "Este aerupuerto no existe")")
for airportKey in airports.keys {
  print(airportKey)
}
for (key, value) in airports {
  print("\(key): \(value)")
}

/* Estructuras de control */
if airports.count < 1 {
  print("Conteo IF")
}
else if airports.count < 2 {
  //
} else {
    
}


switch (airports.count) {
  case 1:
      print("Conteo SWITCH")
  default:
      break
}

/* Rangos Switch */
let moons = 62
let phrase = "Lunas en Saturno"
let naturalCount: String
switch moons {
  case 0:
      naturalCount = "No hay"
  case 1..<5:
      naturalCount = "Hay unas pocas"
  case 5..<12:
      naturalCount = "Hay bastantes"
  case 12..<100:
      naturalCount = "Hay muchas"
  case 101, 102, 103: // Evaluar varios casos en el mismo [case]
    print("moons es 101, 102 o 103")
    naturalCount = "Son 101, 102 o 103"
  default:
      naturalCount = "Ni idea cuantas hay"
}
print("\(naturalCount) \(phrase)")

/* Tuplas Switch */
let somePoint = (1,1)
switch somePoint {
  case (0,0):
    print("El punto \(somePoint) es el origen")
  case (_,0): // Me da igual cual sea el primer valor
    print("La coordenada X es 0")
  case (-2...2, -2...2): // Revisar que esté en este rango
    print("El punto \(somePoint) se halla en el rango -2 a 2")
  case (let x, 0):
    print("Sobre el eje X está el valor: \(x)")
  case (let x, let y): // Tambien puede hacerse así let (x, y)
    print("Sobre el eje X está el valor: \(x)")
    print("Sobre el eje Y está el valor: \(y)")
  case let (x, y) where x == y:
    print("Tanto X como Y son iguales")
}

/* Control transfer sentences - Sentencias de transferencia de control */
// continue (ir a la siguiente iteración)
// break (romper las iteraciones o el proceso ahí)
// fallthrough (pasar hacia adelante - es para usarlo en un Switch)
// return
// throw(errores)

/* Palabras clave */
// guard-else (reemplaza literalmente el if, si es un valor nil, SI ingresará)
var people: [String: Any] = ["name": "Juan Gabriel", "age": 31]
func testUserValidation() {
  guard let lastname = people["lastname"] else {
    // Si [lastname] es nil, ingresará a este [guard]
    print("EFECTIVAMENTE ingresamos aqui")
    return
  }
  print(lastname)
}

/* Comprobar disponibilidad en cuanto a versiones de Swift */
// se utiliza [#] para revisar disponibilidad
if #available(iOS 12, macOS 10.12, *) { // Si es esta versión o mayor
  // código para iOS 12+ y macOS 10.12+
} else {
  // Mantener el código viejo con versiones anteriores de iOS, macOS...
}


// ------------------------------------------------------------------------------------
/* ---------- CURSO DE FUNCIONES CON SWIFT ------------ */

func myFunction1(personName: String) -> String { // [-> String] es el retorno de la función
  return personName
}
myFunction1(personName: "Daniel") // parametros nombrados

func myFunction2(personName: String) { // No tiene tipado el return
  print(personName)
}

func myFunction3(array:[Int]) -> (min: Int, max: Int)? { // Devuelve una Tupla OPCIONAL con un min y un max
  return (array[0], array[1])
}

/* Etiquetas */
// Sirve para recortar el nombre de los parametros [f1] y [f2] en este caso. [f2] tiene parametro por defecto
// Tambien sirve para tener parametros por posición en lugar de parametros nombrados usando [_] como etiqueta
func myFunction4(f1 firstParamNumber: Int, f2 secondParamNumber: Int = 2, _ thirdParamNumber: Int) -> Void {
  // code using firstParamNumber, secondParamNumber and thirdParamNumber
}
myFunction4(f1: 1, f2: 5, 3)

/* Parametro "Viariadics" o "Variadico"*/
// Permite pasar un indefinido numero de parametros, se usa con [...]
func mean(_ numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}
mean(1, 2, 3, 4, 5)
mean(1.5, 2.7)

/* Parametro de entrada y salida */
// Sirve para modificar variables externas de las llaves que compete la función, se usa [inout] y [&] al momento de pasar el valor a la función
var x = 5
func addOne(_ number: inout Int) {
  return number += 1
}
addOne(&x)
print(x)

/* Function Types - Funciones como tipo de dato */
// Es de tipo (Int, Int) -> Int
func addTwoInts(_ int1: Int, _ int2: Int) -> Int {
  return int1 + int2
}

// Es de tipo () -> Void
func sayHello() {
  print("Hello")
}

/* Clousures */
// Tipo especial de función mas sencilla, podría considerarse como una función anonima. Son algo parecido a los callbacks en JS
/*
 { (params) -> return type in
    // Código del clousure
 }
 */
let randomNames = ["Cristian", "Ricardo", "Freddy"]
func backward(_ s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

// Pasandole una función normal
var reversedNames = randomNames.sorted(by: backward)

// Pasandole un closure CON tipos de datos y especificandole el [return] (el cual no es necesario)
reversedNames = randomNames.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })

// Pasandole un closure SIN tipos de datos
reversedNames = randomNames.sorted(by: { s1, s2 in s1 > s2 })

// Pasandole un closure sin nombrar los parametros, solo usandolos según su posición, se usa [$]. [$0] es el primero parametro que me llega y [$1] es el segundo
reversedNames = randomNames.sorted(by: { $0 > $1 })

// Pasandole un clousure extremadamente simplificado que compare dos valores por ejemplo
reversedNames = randomNames.sorted(by: >)

/* Trailing Clousures */
func someFunctionThatTakesAClousure(clousure: () -> Void) {
  // Code using the clousure passed by parameters
}

// Este es el Trailing Clousure
someFunctionThatTakesAClousure {
  // Añadir el clousure aquí
}

// Tomando el ejemplo de [.sorted] de arriba y utilizando trailing clousures
reversedNames = names.sorted{ $0 > $1 }

/* Escaping clousures con modificador [@] */
// Como los closures se tienen que ejecutar en el momento, Swift no nos permite guardar el closure [completionHandler] en un array para ejecutarlo despues. Para poder hacer esto ultimo, tenemos que agregar el modificador [@escaping].
var completionHandlers: [() -> Void] = []

func escapingClousuresStorage(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}


/* Enumerations (enumerados) o clase vaga */
enum CompassPoint {
  case north
  case south
  case east
  case west
}

enum ShortCompassPoint: String { // El tipado [String] sirve para poder acceder al raw value que sería "north", "south", etc
  case north, south, east, west
}

// var directionToGo = CompassPoint.east // Esta es una opción de como usarlo
var directionsToGo: CompassPoint = .east // Esta es otra opción, cuando ya sabe el tipo de dato

// Para saber cuantos cases hay en un enum, hay que añadirle un tipo extra (esto se le llama protocolo: delegar funcionalidades sin tener que programarlas)
enum Beverage: CaseIterable {
  case coffee, tea, juice, redbull
}
let numberOfCases = Beverage.allCases.count
for beverage in Beverage.allCases {
  print(beverage)
}

enum Barcode {
  case upcCode(Int, Int, Int, Int) // Tipado de una tupla
  case qrCode(String) // Tipado de un string
}
var productBarcode = Barcode.upcCode(8, 85909, 51226, 3)
productBarcode = .qrCode("www.url.com")

switch productBarcode {
  case let .upcCode(numberSystem, manufacturer, product, check): // Recuperamos todos los parametros de la tupla [upcCode]
  // case .upcCode(let numberSystem, let manufacturer, let product, let check): // Podríamos recuperarlo tambien de esta manera
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
  case .qrCode: // Aca sería usar solo el case, sin recuperar el parametro que llega
  print("Holis")
}

// Enums con Raw Values
enum ASCIIControlCharacter: Character { // Cada caso debe tener un tipo [Character]
  case tab = "\t"
  case lineFeed = "\n"
  case carriageReturn = "\r"
}

enum Planet: Int { // Inicializa con el primer caso en 0, y así sucesivamente
  case mercury, venus, earth, mars, jupiter, uranus, saturn, neptune
}
let earthOrder = Planet.earth.rawValue
let possiblePlanet1 = Planet(rawValue: 3)
let possiblePlanet2 = Planet(rawValue: 48) // esto da nil, entonces es mejor asegurarse usando un if como a continuación

if let possiblePlanet3 = Planet(rawValue: 2) {
  print("El planeta \(possiblePlanet3) si existe")
}


