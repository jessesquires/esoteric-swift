//
// Sources / References:
//
// Tom Quist
// - https://twitter.com/tomqueue/status/1096141844696698884
//

let pointer = UnsafeMutablePointer<Never>.allocate(capacity: 0)
let some = [pointer.pointee]
let lyrics = """
    \(some.first!) gonna give you up
    \(some.first!) gonna let you down
    \(some.first!) gonna run around and desert you
    \(some.first!) gonna make you cry
    \(some.first!) gonna say goodbye
    \(some.first!) gonna tell a lie and hurt you
    """
print(lyrics)
