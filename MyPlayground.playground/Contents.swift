import UIKit

print("hello world!")

var foo: Array<String>?

foo = ["foo", "bar", "tag"];

foo.map {element in
    print(element)
}

let result = foo?.filter({ (str) -> Bool in
    return str == "foo"
})

if let result = result {
    print("has foo \(result)")
} else {
    print("not has foo")
}

var bar = [1, 2, 3, 4, 5]

let bars = bar.map { $0 * $0 }
print(bars)

bar.filter {ele in
    if ele%2 == 0 {
        return true
    } else {
        return false
    }
}



//struct Plan: Codable {
//    var planName: String
//    var model: String
//    var seats: Int
//
////    private enum CodingKeys: String, CodingKey {
////        case planName
////        case model
////        case seats
////    }
////
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        self.planName = try container.decode(String.self, forKey: .planName)
////        self.model = try container.decode(String.self, forKey: .model)
////        self.seats = try! container.decode(Int.self, forKey: .seats)
////    }
////
////    func encode(to encoder: Encoder) throws {
////        var container = try encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(self.planName, forKey: .planName)
////        try container.encode(self.model, forKey: .model)
////        try container.encode(self.seats, forKey: .seats)
////    }
//}
//
//let json = """
//{
//    "planName": "spaceX",
//    "model": "superX",
//    "seats": 4
//}
//""".data(using: .utf8)!
//
//let decoder = JSONDecoder()
//
///* 方式一*/
//var decodResult: Plan?
//do {
//    decodResult = try decoder.decode(Plan.self, from: json)
//} catch {
//    print("error= \(error)")
//}
//if let decodResult = decodResult {
//    print(decodResult.planName)
//    print(decodResult.model)
//    print(decodResult.seats)
//}
//
///* 方式二 */
//if let decodResult = try? decoder.decode(Plan.self, from: json) {
//    print("planName = \(decodResult.planName),model = \(decodResult.model),seats = \(decodResult.seats)")
//}
//
//
//let encoder = JSONEncoder()
//encoder.outputFormatting = .prettyPrinted
//
//let encodResult = try! encoder.encode(decodResult)
//print(String(data: encodResult, encoding: .utf8)!)
//
//
//
//
//
//
//
//let plansJson = """
//{
//    "planes":
//        [
//            {
//                "planName": "spaceX",
//                "model": "superX",
//                "seats": 4
//            },
//            {
//                "planName": "spaceX",
//                "model": "superX",
//                "seats": 4
//            }
//        ]
//}
//""".data(using: .utf8)!
//
//let plans = try! decoder.decode([String: [Plan]].self, from: plansJson)
//print(plans)


let planesJson = """
{
    "aircraft": {
        "identification": "NA12345",
        "color": "Blue/White"
    },
    "route": ["KTTD", "KHIO"],
    "departure_time": {
        "proposed": "2018-04-20T14:15:00-0700",
        "actual": "2018-04-20T14:20:00-0700"
    },
    "flight_rules": "IFR",
    "remarks": null
}
""".data(using: .utf8)!


struct Aircraft: Decodable {
    var identification: String
    var color: String
}

enum FlightRules: String, Decodable {
    case visual = "IFR"
    case insrument = "BFD"
}

struct FlightPlane: Decodable {
    var aircraft: Aircraft
    
    var route: [String]
    
    private var departureDates: [String: Date]
    var proposedDepartureDate: Date? {
        return departureDates["proposed"]
    }
    var actualDepartureDate: Date? {
        return departureDates["actual"]
    }
    
    var flightRules: FlightRules
    
    var remarks: String?
    
    private enum Codingkeys: String, CodingKey {
        case aircraft
        case flightRules = "flight_rules"
        case route
        case departureDates = "departure_time"
        case remarks
    }
}

let flightPlaneDecoder = JSONDecoder()
flightPlaneDecoder.dateDecodingStrategy = .iso8601
if let flightPlaneSucceed = try? flightPlaneDecoder.decode(FlightPlane.self, from: planesJson) {
    print(flightPlaneSucceed.actualDepartureDate!)
} else {
    print("error")
}



do {
    try flightPlaneDecoder.decode(FlightPlane.self, from: planesJson)
} catch {
    print(error)
}

// optionalChaining

class People {
    var house: Resident?
}

class Resident {
    var numOfRooms = 1
}

class ThrChain {
    var person: People?
}

let rose = People()

if let house = rose.house?.numOfRooms { // house 为nil，所以走else分支
    print("rose has \(house) room")
} else {
    print("rose has no room.")
}

let jack = People()
jack.house = Resident()
if let house = jack.house?.numOfRooms { // house不为nil，打印house
    print("jack has \(house) room")
} else {
    print("jack has no room")
}

let thrChin = ThrChain()
if let thirTes = thrChin.person?.house?.numOfRooms {
    print("thirTes is \(thirTes)")
} else {
    print("thirTes is nil")
}

















