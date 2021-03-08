//
// Sources / References:
//
// Jérôme Alves (@jegnux for @ShitSwiftDev)
// - https://twitter.com/ShitSwiftDev/status/1367838328494653450
//

import Foundation

infix operator ⠅╱╱

@dynamicMemberLookup struct HostName {
    let rawValue: String
    subscript(dynamicMember string: String) -> HostName {
        HostName(rawValue: rawValue + "." + string)
    }
}

struct Scheme {
    let rawValue: String
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}

let www = HostName(rawValue: "www")
let https = Scheme(rawValue: "https")

func ⠅╱╱ (scheme: Scheme, hostName: HostName) -> URL {
    var components = URLComponents()
    components.scheme = scheme.rawValue
    components.host = hostName.rawValue
    return components.url!
}

let url = https⠅╱╱www.apple.com

print(url)

