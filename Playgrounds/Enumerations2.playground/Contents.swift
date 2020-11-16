import UIKit

//Lab
//Q8a
enum MetroLine {
    case purple(Int)
    case green(Int)
    case yellow(Character)
    case red(Character)
}
var theSeven = MetroLine.purple
var yellowTrain = MetroLine.yellow("N")

switch yellowTrain {
case .green(let train):
    print(train)
case .purple(let train):
    print(train)
case .yellow(let train):
    print(train)
case .red(let train):
    print(train)
}


//Q9
enum Pokemon {
    case pikachu(String)
    case eevee(String)
    case mew(String)
    case bulbasaur(String,String)
    
    func myPartnerAndItsType() {
        switch self {
        case .eevee(let type):
            print("My partner Pokemon is Eevee an its type is \(type)")
        case .mew(let type):
            print("My partner Pokemon is Mew an its type is \(type)")
        case .bulbasaur(let type1, let type2):
            print("My partner Pokemon is Bulbasaur an its types are \(type1) and \(type2)")
        case .pikachu(let type):
            print("My partner Pokemon is Pikachu an its type is \(type)")
        }
    }
}

var myPokemon = Pokemon.pikachu("electric")
myPokemon.myPartnerAndItsType()


//enum Weather {
//    case sunny(String)
//    case snowy(String,String)
//    case rainy(String)
//    case windy(String)
//}
//
//func printTheWeather(outside: Weather) {
//    switch outside {
//    case .sunny:
//        print("Its sunny")
//    case .rainy:
//        print("Its rainy")
//    case .snowy:
//        print("Its snowing and cold")
//    case .windy:
//        print("Its windy")
//    }
//}
//var todayWeather = Weather.snowy("cold", "solid")
//printTheWeather(outside: todayWeather)

//func inside enum
enum Weather {
    case sunny(String)
    case snowy(String,String)
    case rainy(String)
    case windy(String)
    
    func printTheWeather() {
        switch self {
        case .sunny:
            print("Its sunny")
        case .rainy:
            print("Its rainy")
        case .snowy:
            print("Its snowing and cold")
        case .windy:
            print("Its windy")
        }
    }
}
var todayWeather = Weather.snowy("cold", "solid")
todayWeather.printTheWeather()
