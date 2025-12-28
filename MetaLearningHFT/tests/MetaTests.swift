import XCTest

final class MetaTests: XCTestCase {
    func testOracleClassifiesMomentum() {
        let oracle = StrangeLoopOracle()
        let regime = oracle.regime(for: ["volatility": 0.4, "momentum": 1.0])
        XCTAssertEqual(regime, .bull)
    }
}
