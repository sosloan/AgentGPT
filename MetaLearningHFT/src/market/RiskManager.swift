import Foundation

public struct RiskLimits: Codable {
    public let maxPosition: Double
    public let maxNotional: Double

    public init(maxPosition: Double, maxNotional: Double) {
        self.maxPosition = maxPosition
        self.maxNotional = maxNotional
    }
}

public final class RiskManager {
    private let limits: RiskLimits

    public init(limits: RiskLimits) {
        self.limits = limits
    }

    public func validate(order: TradeOrder, currentNotional: Double) -> Bool {
        let projected = currentNotional + (order.priceLimit ?? 0) * order.quantity
        return abs(order.quantity) <= limits.maxPosition && projected <= limits.maxNotional
    }
}
