import XCTest

final class IntegrationTests: XCTestCase {
    func testExecutiveRunsHeads() {
        let memory = TrickMemory()
        let oracle = StrangeLoopOracle()
        let goat = GoatAttention()

        let exec = TrickExecutive(heads: [goat], memory: memory, oracle: oracle, loopHz: 100)
        exec.start()
        Thread.sleep(forTimeInterval: 0.05)
        exec.stop()

        let count: Int = memory.read("exploit.Exploit-1.ticks") ?? 0
        XCTAssertGreaterThan(count, 0)
    }
}
