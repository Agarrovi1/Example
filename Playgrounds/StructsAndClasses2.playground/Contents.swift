import UIKit

class Dog {
    var name = "dog"
    var breed = "unknown"
    var mood = "calm"
    var hungry = false
    static var count = 0
    
    init(name: String, breed: String, mood: String, hungry: Bool) {
        self.name = name
        self.breed = breed
        self.mood = mood
        self.hungry = hungry
        Dog.count += 1
    }
    
    func playFetch() {
        hungry = true
        mood = "playful"
        print("Ruff!")
    }
    
    func feed() {
        if self.hungry == true {
            hungry = false
            print("Woof!")
        } else {
            print("The dog doesn't look hungry")
        }
    }
    
    func toString() -> String {
        return "Name: \(name), Breed: \(breed), Mood: \(mood)"
    }
    
}

var dog1 = Dog(name: "dog", breed: "unknown", mood: "calm", hungry: false)
dog1.name //returns "dog"
dog1.breed //returns "unknown"
dog1.mood //returns "calm"
dog1.hungry //returns false

var dog2 = Dog(name: "Oreo", breed: "English Setter", mood: "excited", hungry: true)
dog2.name //returns "Oreo"
dog2.breed //returns "English Setter"
dog2.mood //returns 'excited'
dog2.hungry //returns true

var dog3 = Dog(name: "Rhett", breed: "English Setter", mood: "excited", hungry: false)
dog3.hungry //returns false
dog3.mood //returns "excited"
dog3.playFetch() //prints "Ruff!"
dog3.hungry //returns true
dog3.mood //returns "playful"

var dog4 = Dog(name: "Partner", breed: "Golden Retriever", mood: "thoughtful", hungry: true)
dog4.hungry //returns true
dog4.feed() //prints "Woof!"
dog4.hungry //returns false

var dog5 = Dog(name: "Rascal", breed: "Golden Retriever", mood: "feeling pawesome", hungry: true)
print(dog5.toString())
//prints:
//Name: Rascal
//Breed: Golden Retriever
//Mood: feeling pawesome

Dog.count //returns 5

//Q9
struct FreezingPoint {
    let celsius = 0
    let fahrenheit = 32
    let kelvin = 273
}
let freezing = FreezingPoint()


struct Celsius {
    var celsius = 0.0
    var fahrenheit: Double {
        return ((celsius * 1.8) + 32)
    }
    var kelvin: Double {
        return (celsius + 273.0)
    }
    
    func isBelowFreezing() -> Bool {
        if self.celsius < Double(freezing.celsius) {
            return true
        }
        return false
    }
}
var tenDegreesCelsius = Celsius(celsius: 10.0)
tenDegreesCelsius.celsius //returns 10.0
tenDegreesCelsius.kelvin //returns 283.0
tenDegreesCelsius.fahrenheit //returns 50.0

tenDegreesCelsius.isBelowFreezing()

//Q10
struct RGBColor {
    var red: Double
    var green: Double
    var blue: Double
}

let colorDictArray: [[String: Double]] = [["red": 1.0, "green": 0.0, "blue": 0.0],
                                          ["red": 0.0, "green": 1.0, "blue": 0.0],
                                          ["red": 0.0, "green": 0.0, "blue": 1.0],
                                          ["red": 0.6, "green": 0.9, "blue": 0.0],
                                          ["red": 0.2, "green": 0.2, "blue": 0.5],
                                          ["red": 0.5, "green": 0.1, "blue": 0.9],]

var colorArray: [RGBColor] = []
for a in colorDictArray {
    var r = Double()
    var g = Double()
    var b = Double()
    for (key,value) in a {
        if key == "red" {
            r = value
        } else if key == "green" {
            g = value
        } else if key == "blue" {
            b = value
        }
    }
    let newColor = RGBColor(red: r, green: g, blue: b)
    colorArray.append(newColor)
}

for a in colorArray {
    let b = a
    print(b)
}
//print(colorArray)
//i dont know how to get rid of __lldb_expr_85.

//Q11
class Movie {
    var name: String
    var year: Int
    var genre: String
    var cast: [String]
    var description: String
    
    init(name: String, year: Int, genre: String, cast: [String], description: String) {
        self.name = name
        self.year = year
        self.genre = genre
        self.cast = cast
        self.description = description
    }
    func blurb() -> String {
        return "\(name) came out in \(year). It was a(n) \(genre) starring \(cast) where \(description)"
    }
}

var winter = Movie(name: "CA: The Winter Soldier", year: 2014, genre: "Action", cast: ["Chris Evans", "Sebastian Stan", "Anthony Mackie", "Scarlet Johansson"], description: "Hero finds that the friend he thought was dead was actually alive and that the group he thought to have beaten is alive and a security organization is overrun by them")
print(winter.blurb())

//Q12
let dieHardDict: [String: Any] = ["name": "Die Hard",
                                  "year" : 1987,
                                  "genre": "action",
                                  "cast": ["Bruce Willis", "Alan Rickman"],
                                  "description": "John Mclain saves the day!"]

func makeMovie(dictionary: [String:Any]) -> Movie? {
    var n = String()
    var y = Int()
    var g = String()
    var c = [String]()
    var d = String()
    if let unwrapName = dictionary["name"] as? String {
        n = unwrapName
    }
    if let unwrapYear = dictionary["year"] as? Int {
        y = unwrapYear
    }
    if let unwrapGenre = dictionary["genre"] as? String {
        g = unwrapGenre
    }
    if let unwrapCast = dictionary["cast"] as? [String] {
        c = unwrapCast
    }
    if let unwrapDescription = dictionary["description"] as? String {
        d = unwrapDescription
    }
    return Movie(name: n, year: y, genre: g, cast: c, description: d)
}

var sample = makeMovie(dictionary: dieHardDict)

//Q13
var movies: [[String:Any]] = [
    [
        "name": "Minions",
        "year": 2015,
        "genre": "animation",
        "cast": ["Sandra Bullock", "Jon Hamm", "Michael Keaton"],
        "description": "Evolving from single-celled yellow organisms at the dawn of time, Minions live to serve, but find themselves working for a continual series of unsuccessful masters, from T. Rex to Napoleon. Without a master to grovel for, the Minions fall into a deep depression. But one minion, Kevin, has a plan."
    ],
    [
        "name": "Shrek",
        "year": 2001,
        "genre": "animation",
        "cast": ["Mike Myers", "Eddie Murphy", "Cameron Diaz"],
        "description": "Once upon a time, in a far away swamp, there lived an ogre named Shrek whose precious solitude is suddenly shattered by an invasion of annoying fairy tale characters. They were all banished from their kingdom by the evil Lord Farquaad. Determined to save their home -- not to mention his -- Shrek cuts a deal with Farquaad and sets out to rescue Princess Fiona to be Farquaad\"s bride. Rescuing the Princess may be small compared to her deep, dark secret."
    ],
    [
        "name": "Zootopia",
        "year": 2016,
        "genre": "animation",
        "cast": ["Ginnifer Goodwin", "Jason Bateman", "Idris Elba"],
        "description": "From the largest elephant to the smallest shrew, the city of Zootopia is a mammal metropolis where various animals live and thrive. When Judy Hopps becomes the first rabbit to join the police force, she quickly learns how tough it is to enforce the law."
    ],
    [
        "name": "Avatar",
        "year": 2009,
        "genre": "action",
        "cast": ["Sam Worthington", "Zoe Saldana", "Sigourney Weaver"],
        "description": "On the lush alien world of Pandora live the Na\"vi, beings who appear primitive but are highly evolved. Because the planet\"s environment is poisonous, human/Na\"vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully, a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na\"vi woman. As a bond with her grows, he is drawn into a battle for the survival of her world."
    ],
    [
        "name": "The Dark Knight",
        "year": 2008,
        "genre": "action",
        "cast": ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
        "description": "With the help of allies Lt. Jim Gordon and DA Harvey Dent, Batman has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker suddenly throws the town into chaos, the caped Crusader begins to tread a fine line between heroism and vigilantism."
    ],
    [
        "name": "Transformers",
        "year": 2007,
        "genre": "action",
        "cast": ["Shia LaBeouf", "Megan Fox", "Josh Duhamel"],
        "description": "The fate of humanity is at stake when two races of robots, the good Autobots and the villainous Decepticons, bring their war to Earth. The robots have the ability to change into different mechanical objects as they seek the key to ultimate power. Only a human youth, Sam Witwicky can save the world from total destruction."
    ],
    [
        "name": "Titanic",
        "year": 1997,
        "genre": "drama",
        "cast": ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"],
        "description": "The ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912."
    ],
    [
        "name": "The Hunger Games",
        "year": 2012,
        "genre": "drama",
        "cast": ["Jennifer Lawrence", "Josh Hutcherson", "Liam Hemsworth"],
        "description": "Katniss Everdeen voluntarily takes her younger sister\"s place in the Hunger Games, a televised competition in which two teenagers from each of the twelve Districts of Panem are chosen at random to fight to the death."
    ],
    [
        "name": "American Sniper",
        "year": 2014,
        "genre": "drama",
        "cast": ["Bradley Cooper", "Sienna Miller", "Kyle Gallner"],
        "description": "Navy S.E.A.L. sniper Chris Kyle\"s pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home to his wife and kids after four tours of duty, however, Chris finds that it is the war he can\"t leave behind."
    ]
]

var arrayOfMovies: [Movie] = []
for a in movies {
    let b = makeMovie(dictionary: a)
    if let unwrap = b {
        arrayOfMovies.append(unwrap)
    }
}
//print(arrayOfMovies)
for a in arrayOfMovies {
    let b = a
    print(b)
}
arrayOfMovies[0]

//Q10
let colorsRGBified = colorDictArray.map({a -> RGBColor? in
    if let r = a["red"], let g = a["green"], let b = a["blue"] {
        return RGBColor(red: r, green: g, blue: b)
    }
    return nil
})
