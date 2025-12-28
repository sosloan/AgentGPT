import Foundation

public struct TradeOrder: Codable {
    public let symbol: String
    public let side: String
    public let quantity: Double
    public let priceLimit: Double?
}

public protocol OrderExecutor {
    func submit(_ order: TradeOrder)
}

public final class NullOrderExecutor: OrderExecutor {
    public init() {}

    public func submit(_ order: TradeOrder) {
        Logging.info("Order queued", metadata: [
            "symbol": order.symbol,
            "side": order.side,
            "qty": "\(order.quantity)"
        ])
    }
}
