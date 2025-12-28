import Foundation

public final class TrickMemory: TrickMemoryStore {
    private let queue = DispatchQueue(label: "meta.memory", attributes: .concurrent)
    private var storage: [String: Any] = [:]

    public init() {}

    public func read<T>(_ key: String) -> T? {
        queue.sync {
            storage[key] as? T
        }
    }

    public func write<T>(_ key: String, value: T) {
        queue.async(flags: .barrier) { [weak self] in
            self?.storage[key] = value
        }
    }
}
