import Foundation

public final class GoatAttention: TrickHead {
    public let name = "GoatAttention"

    private let exploitHeads: [TrickHead]
    private let exploreHeads: [TrickHead]
    private let arbitrageHeads: [TrickHead]
    private let bioAlphaHeads: [TrickHead]

    public init(
        exploitHeads: [TrickHead] = (1...12).map { ExploitHead(index: $0) },
        exploreHeads: [TrickHead] = (13...24).map { ExploreHead(index: $0) },
        arbitrageHeads: [TrickHead] = (25...34).map { ArbitrageHead(index: $0) },
        bioAlphaHeads: [TrickHead] = (35...36).map { BioAlphaHead(index: $0) }
    ) {
        self.exploitHeads = exploitHeads
        self.exploreHeads = exploreHeads
        self.arbitrageHeads = arbitrageHeads
        self.bioAlphaHeads = bioAlphaHeads
    }

    public func tick(context: TrickContext) {
        allHeads.forEach { $0.tick(context: context) }
    }

    private var allHeads: [TrickHead] {
        exploitHeads + exploreHeads + arbitrageHeads + bioAlphaHeads
    }
}
