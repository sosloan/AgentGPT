import Foundation

public struct ArbitrageHead: TrickHead {
    public let name: String

    public init(index: Int) {
        self.name = "Arbitrage-\(index)"
    }

    public func tick(context: TrickContext) {
        let key = "arbitrage.\(name).spreads"
        let spreads: Int = context.memory.read(key) ?? 0
        context.memory.write(key, value: spreads + 1)
    }
}
