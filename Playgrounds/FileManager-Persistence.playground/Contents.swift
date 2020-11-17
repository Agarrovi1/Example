import UIKit

var str = "Hello, playground"

struct SlothWrapper: Codable {
    let sloth: Sloth
}

struct Sloth: Codable {
    let appendages: Int
    let speed: Int
    let name: String
}

//We're used to JSON encoding / decoding

let ourNewSlothJSON = """
{
    "sloth": {
        "appendages": 4
        "speed": 3
    }
}
"""

//we make a network call. What type does this come back as? Data

//How do we get that data to become an instance of Sloth? Decode it

//UserDefaults.standard

//the same singleton on userDefaults

//We're going to look for urls using SearchPathDirectory enum
//Instead of knowing the entire url path to get to a file in the directory, the SearchPathDirectory enum values tell our app where to look
//example (not really how this works on device)
//users/davidrifkin/documents/new-file.txt
//FileManager, go look at the directory with the value .documentationDirectory and get me something called new-file.txt
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask/*user's home directory, where user items is stored/installed*/)[0]
//documentsDirectory is an array of urls

func filePathFromDocumentsDirectory(name: String) -> URL {
    return documentsDirectory.appendingPathComponent(name)
}

let slothFile = filePathFromDocumentsDirectory(name: "sloth.plist")
//Serializing = turning your data into a format that can be saved. Wh've seen Data form the internet serialized as JSON as in the past

let nayelliSloth = Sloth(appendages: 4, speed: 10, name: "Nayeli")

let davidOnMondaySloth = Sloth(appendages: 2, speed: 1, name: "Slowpoke")
let istishnaSloth = Sloth(appendages: 6, speed: 8, name: "Istishna")
let mySloths = [nayelliSloth,davidOnMondaySloth,istishnaSloth]


func saveSlothsToDocumentsDirectory(sloths: [Sloth]) throws {
    //throws means can return an error with having to write '-> Error', the func has to eventually throw
    
    do {
        //this does not encode for a kson format. it's specifically used to encode as Data for a Property List Format
        let encodedSloths = try PropertyListEncoder().encode(sloths)
        
        //Create differenct Data objects
        
        //Now that it's serialized, let's persist it (save it)
        try encodedSloths.write(to: slothFile, options: .atomic)
    } catch {
        throw error
    }
}

//we save

do {
    try saveSlothsToDocumentsDirectory(sloths: mySloths)
} catch {
    print(error)
}


//look in your file structure and see if there's a file with the path in our URL we created
func getSavedSlothsFromDocumentDirectory() -> [Sloth]? {
    if FileManager.default.fileExists(atPath: slothFile.path) {
        //get the data
        guard let data = FileManager.default.contents(atPath: slothFile.path) else {fatalError()}
        
        //Decode the data from the fule at the URL
        do {
            let sloths = try PropertyListDecoder().decode([Sloth].self, from: data)
            return sloths
        } catch {
            print(error)
        }
    }
    return nil
}

//We could create... helpers!
//we could also do this async



