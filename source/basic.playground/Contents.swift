//
// Sources / References:
//
// Joe Groff
// - https://twitter.com/jckarter/status/1093180314526965760
// - https://gist.github.com/jckarter/f56f6244aef46bfe25ccf34d2750412b#file-basic-swift-L15
//

infix operator ⎵

var program: [Int: () -> ()] = [:]

func ⎵(lineNumber: Int, code: @autoclosure @escaping () -> ()) {
    program[lineNumber] = code
}

var currentLine = 0

var run: Void {
    if program.isEmpty { return }
    let lines = program.keys.sorted()
    currentLine = lines.first!
    while true {
        let line = currentLine
        currentLine += 1
        program[line]!()
        guard let nextLine = lines.first(where: { $0 >= currentLine }) else { return }
        currentLine = nextLine
    }
}

func goto(_ line: Int) {
    currentLine = line
}

10⎵print("hello world")
20⎵goto(10)
run
