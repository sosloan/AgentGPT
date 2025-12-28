import Foundation

public final class Metrics {
    private var values: [String: Double] = [:]
    private let queue = DispatchQueue(label: "meta.metrics", attributes: .concurrent)

    public init() {}

    public func update(key: String, value: Double) {
        queue.async(flags: .barrier) { [weak self] in
            self?.values[key] = value
        }
    }

    public func snapshot() -> [String: Double] {
        queue.sync { values }
    }
}
