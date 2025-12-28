import XCTest

final class HeadsTests: XCTestCase {
    func testGoatDispatchesHeads() {
        let memory = TrickMemory()
        let context = TrickContext(memory: memory, regime: .neutral)
        let goat = GoatAttention()

        goat.tick(context: context)

        let exploitCount: Int = memory.read("exploit.Exploit-1.ticks") ?? 0
        XCTAssertEqual(exploitCount, 1)
    }
}
