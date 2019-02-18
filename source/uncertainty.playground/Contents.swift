//
// Sources / References:
//
// Matteo Comisso
// - https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID380
// - http://explosm.net/comics/1422/
//

import Swift

precedencegroup IDK {
    associativity: left
}

infix operator ⎰‾: IDK
func ⎰‾(_ l: Bool, r: Bool) -> Bool { return ‾⎱l || r⎰‾ }

postfix operator ⎰‾
postfix func ⎰‾(_ el: Bool) -> Bool { return !el && .random() }

prefix operator ‾⎱
prefix func ‾⎱(_ el: Bool) -> Bool { return el⎰‾ }

var ツ: Bool = .random()

// Test
for i in 0..<100 where ‾⎱(ツ)⎰‾ { print(i) }

if (ツ)⎰‾(ツ)⎰‾(ツ)⎰‾(ツ)⎰‾(ツ)⎰‾ {
    print("Conga!")
}
