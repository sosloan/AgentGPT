import Foundation

public protocol MarketDataFeed {
    func latestPrices() -> [String: Double]
    func metrics() -> [String: Double]
}

public final class DummyMarketDataFeed: MarketDataFeed {
    public init() {}

    public func latestPrices() -> [String: Double] {
        [:]
    }

    public func metrics() -> [String: Double] {
        ["volatility": 0.0, "momentum": 0.0]
    }
}
