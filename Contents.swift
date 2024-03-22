import UIKit

// 1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay: Int {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func ifWorkDay(in day: WeekDay) {
    if (0...4).contains(day.rawValue) {
        print("დღეს სამუშაო დღეა")
    } else {
        print("დღეს დასვნენების დღა")
    }
}
ifWorkDay(in: .Sunday)
print("\n")

// 2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad: Int {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    var subscriptionFee: Int {
        switch self {
        case GialaSquad.TsigroviManto:
            799
        case GialaSquad.MoshishvlebuliMkerdi:
            499
        case GialaSquad.TuGapatio:
            299
        }
    }
    
    static func printPrice(for subscribtion: GialaSquad) {
        switch subscribtion {
        case .TsigroviManto:
            print("Price of TsigroviManto is ₾\(GialaSquad.TsigroviManto.subscriptionFee)")
        case .MoshishvlebuliMkerdi:
            print("Price of MoshishvlebuliMkerdi is ₾\(GialaSquad.MoshishvlebuliMkerdi.subscriptionFee)")
        case .TuGapatio:
            print("Price of TuGapatio is ₾\(GialaSquad.TuGapatio.subscriptionFee)")
        }
    }
}

GialaSquad.printPrice(for: GialaSquad.MoshishvlebuliMkerdi)
print("\n")

// 3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(Celsius: Double)
    case Cloudy(Celsius: Double)
    case Rainy(Celsius: Double)
    case Snowy(Celsius: Double)
}

func clothingRecommendation(for weather: Weather) -> String {
    switch weather {
    case .Sunny(let Celsius):
        Celsius > 25 ? "ჩაიცვით ძალიან თხლად, გარეთ მზიანი ამინდია და ცხელა" : "ჩაიცვით გრილად, გარეთ მზიანი ამინდია და საშუალო ტემპერატურაა"
    case .Cloudy(let Celsius):
        Celsius > 20 ? "ჩაიცვით გრილად, გარეთ თბილა მაგრამ მოღრუბლული ამინდია" : "ჩაიცვით თბილად, გარეთ გრილა და მოღრუბლილი ამინდია"
    case .Rainy(let Celsius):
        Celsius > 20 ? "ჩაიცვით თხლად და წვიმის შესაბამისად, გარეთ ცოტა თბილა მაგრამ ჟუჟუნებს" : "ჩაიცვით თბილად და წვიმის შესაბამისად, ცივი წვიმაა"
    case .Snowy(let Celsius):
        Celsius > 0 ? "ჩაიცვით ძალიან თბილად, გარეთ ყინავს და თოვს! უ-ლა-ლაა" : "ჩაიცვით თბილად, გარეთ თოვს, არ ყინავს მაგრამ ცივა!"
    }
}

print(clothingRecommendation(for: Weather.Sunny(Celsius: 15)))
print("\n")

// 4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    let album: String
    let releaseYear: Int16
}

var KanyeObjects: [Kanye] = [
    Kanye(album: "The College Dropout", releaseYear: 2004),
    Kanye(album: "Late Registration", releaseYear: 2005),
    Kanye(album: "Graduation", releaseYear: 2007),
    Kanye(album: "808s & Heartbreak", releaseYear: 2008),
    Kanye(album: "My Beautiful Dark Twisted Fantasy", releaseYear: 2010),
    Kanye(album: "Watch the Throne", releaseYear: 2011),
    Kanye(album: "Yeezus", releaseYear: 2013),
    Kanye(album: "The Life of Pablo", releaseYear: 2016),
    Kanye(album: "Ye", releaseYear: 2018),
    Kanye(album: "Jesus Is King", releaseYear: 2019),
    Kanye(album: "Vultures 1", releaseYear: 2024)
]

func albumsAfterYear(from year: Int16, KanyeAlbums: [Kanye]) {
    for iteration in 0...KanyeAlbums.count - 1 {
        if year < KanyeAlbums[iteration].releaseYear {
            print(KanyeAlbums[iteration])
        }
    }
}

albumsAfterYear(from: 2011, KanyeAlbums: KanyeObjects)
print("\n")

// 5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct CachedData {
    let initClosure: () -> String
    lazy var cachedMessage: String = {
        return self.initClosure()
    }()
    var wrappedValue: String {
        mutating get { return cachedMessage }
    }
    
    init(wrappedValue initClosure: @escaping @autoclosure () -> String) {
        self.initClosure = initClosure
    }
}

struct injectingMessage {
    @CachedData var message: String = "lazy ინიციალიზებულია"
}

var lazyInit = injectingMessage()
print(lazyInit.message)
