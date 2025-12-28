import XCTest

final class CoreTests: XCTestCase {
    func testMemoryStoresValues() {
        let memory = TrickMemory()
        memory.write("alpha", value: 42)

        let value: Int? = memory.read("alpha")
        XCTAssertEqual(value, 42)
    }
}
