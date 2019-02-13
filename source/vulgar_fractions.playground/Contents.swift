//
// Sources / References:
//
// Nate Cook
// - https://twitter.com/nnnnnnnn/status/1093576188075958273
// - https://gist.github.com/natecook1000/9ecc976aaac9a035bddf
//

import Foundation

// (c) 2014 Nate Cook, licensed under the MIT License
/**
 Returns a tuple with the closest compound fraction possible with Unicode's built-in "vulgar fractions".
 See here: http://www.unicode.org/charts/PDF/U2150.pdf
 :param: number The floating point number to convert.
 :returns: A tuple (String, Double): the string representation of the closest possible vulgar fraction and the value of that string
 */
func vulgarFraction(_ number: Double) -> (String, Double) {
    let fractions: [(String, Double)] = [("", 1), ("\u{215E}", 7/8),
                                         ("\u{215A}", 5/6), ("\u{2158}", 4/5), ("\u{00BE}", 3/4), ("\u{2154}", 2/3),
                                         ("\u{215D}", 5/8), ("\u{2157}", 3/5), ("\u{00BD}", 1/2), ("\u{2156}", 2/5),
                                         ("\u{215C}", 3/8), ("\u{2153}", 1/3), ("\u{00BC}", 1/4), ("\u{2155}", 1/5),
                                         ("\u{2159}", 1/6), ("\u{2150}", 1/7), ("\u{215B}", 1/8), ("\u{2151}", 1/9),
                                         ("\u{2152}", 1/10), ("", 0)]
    let whole = Int(number)
    let sign = whole < 0 ? -1 : 1
    let fraction = number - Double(whole)

    for i in 1..<fractions.count {
        if abs(fraction) > (fractions[i].1 + fractions[i - 1].1) / 2 {
            if fractions[i - 1].1 == 1.0 {
                return ("\(whole + sign)", Double(whole + sign))
            } else {
                return ("\(whole) \(fractions[i - 1].0)", Double(whole) + Double(sign) * fractions[i - 1].1)
            }
        }
    }
    return ("\(whole)", Double(whole))
}

assert(vulgarFraction(9.995).0 == "10")
assert(vulgarFraction(10.005).0 == "10")
for _ in 1...10 {
    let original = Double(arc4random()) / (Double(UINT32_MAX) / 200) - 100
    let fractionized = vulgarFraction(original)
    print("Original: \(original), vulgar: \(fractionized.0), \"rounded\": \(fractionized.1)")
}

/*
 Example output:
 Original: 18.8113113210563, vulgar: 18 ⅘, "rounded": 18.8
 Original: -40.2175984206185, vulgar: -40 ⅕, "rounded": -40.2
 Original: -91.6608832291469, vulgar: -91 ⅔, "rounded": -91.6666666666667
 Original: 32.2099847561237, vulgar: 32 ⅕, "rounded": 32.2
 Original: -88.1942554349532, vulgar: -88 ⅕, "rounded": -88.2
 Original: -4.5555724074495, vulgar: -4 ⅗, "rounded": -4.6
 Original: -74.8327193723136, vulgar: -74 ⅚, "rounded": -74.8333333333333
 Original: -93.2909318230327, vulgar: -93 ¼, "rounded": -93.25
 Original: 99.6175843755755, vulgar: 99 ⅝, "rounded": 99.625
 Original: -21.1565957686763, vulgar: -21 ⅙, "rounded": -21.1666666666667
 */
