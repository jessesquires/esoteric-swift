//
// Sources / References:
//
// - https://twitter.com/pteasima/status/978325590397906944
// - https://www.pointfree.co
// - https://github.com/apple/swift-evolution/blob/master/proposals/0215-conform-never-to-hashable-and-equatable.md
//

enum Never { }

func absurd<A>(_ never: Never) -> A {
    switch never { }
}
