import Foundation

public final class StrangeLoopOracle: MetaOracle {
    private let decay: Double
    private var smoothed: [MarketRegime: Double] = [:]

    public init(decay: Double = 0.8) {
        self.decay = decay
    }

    public func regime(for metrics: [String: Double]) -> MarketRegime {
        let next = classify(metrics: metrics)
        smoothed[next] = (smoothed[next] ?? 0) * decay + 1.0
        let weighting = RegimeWeighting(weights: smoothed)
        return weighting.bestRegime(default: next)
    }

    private func classify(metrics: [String: Double]) -> MarketRegime {
        guard let volatility = metrics["volatility"] else {
            return .neutral
        }

        if volatility > 1.5 {
            return .chaotic
        }

        let momentum = metrics["momentum"] ?? 0
        if momentum > 0 {
            return .bull
        } else if momentum < 0 {
            return .bear
        }

        return .neutral
    }
}
