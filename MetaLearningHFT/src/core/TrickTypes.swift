import Foundation

public protocol TrickHead {
    var name: String { get }
    func tick(context: TrickContext)
}

public struct TrickContext {
    public let now: Date
    public let memory: TrickMemoryStore
    public let regime: MarketRegime

    public init(now: Date = .init(), memory: TrickMemoryStore, regime: MarketRegime) {
        self.now = now
        self.memory = memory
        self.regime = regime
    }
}

public protocol TrickMemoryStore: AnyObject {
    func read<T>(_ key: String) -> T?
    func write<T>(_ key: String, value: T)
}

public protocol MetaOracle {
    func regime(for metrics: [String: Double]) -> MarketRegime
}
