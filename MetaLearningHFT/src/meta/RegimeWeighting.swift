import Foundation

public struct RegimeWeighting {
    public let weights: [MarketRegime: Double]

    public init(weights: [MarketRegime: Double]) {
        self.weights = weights
    }

    public func bestRegime(default fallback: MarketRegime = .neutral) -> MarketRegime {
        weights.max { $0.value < $1.value }?.key ?? fallback
    }
}
