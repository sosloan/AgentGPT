import Foundation

public final class TrickExecutive {
    private let queue = DispatchQueue(label: "meta.executive")
    private var timer: DispatchSourceTimer?

    private let heads: [TrickHead]
    private let memory: TrickMemoryStore
    private let oracle: MetaOracle
    private let loopHz: Double

    public init(
        heads: [TrickHead],
        memory: TrickMemoryStore = TrickMemory(),
        oracle: MetaOracle,
        loopHz: Double = 100.0
    ) {
        self.heads = heads
        self.memory = memory
        self.oracle = oracle
        self.loopHz = loopHz
    }

    public func start() {
        guard timer == nil else { return }
        let t = DispatchSource.makeTimerSource(queue: queue)
        let intervalMs = max(1, Int(1000.0 / loopHz))
        t.schedule(deadline: .now(), repeating: .milliseconds(intervalMs), leeway: .milliseconds(1))
        t.setEventHandler { [weak self] in self?.tick() }
        t.resume()
        timer = t
    }

    public func stop() {
        timer?.cancel()
        timer = nil
    }

    private func tick() {
        let metrics: [String: Double] = memory.read("metrics") ?? [:]
        let regime = oracle.regime(for: metrics)
        let context = TrickContext(now: Date(), memory: memory, regime: regime)
        heads.forEach { $0.tick(context: context) }
    }
}
