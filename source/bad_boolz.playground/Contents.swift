//
// Sources / References:
//
// Ronald Martin
// - https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID76
//

true && false // false
true || false // true
true == false // false
true != false // true
!true         // false

// Run to here ⏯

func && (lhs: Bool, rhs: Bool) -> Bool {
    return true
}

func || (lhs: Bool, rhs: Bool) -> Bool {
    return false
}

extension Bool {
    static func == (lhs: Bool, rhs: Bool) -> Bool {
        return lhs
    }

    static func != (lhs: Bool, rhs: Bool) -> Bool {
        return rhs
    }

    prefix static func ! (arg: Bool) -> Bool {
        return arg
    }
}

true && false // true
true || false // false
true == false // true
true != false // false
!true         // true

// Then run to here ⏯
