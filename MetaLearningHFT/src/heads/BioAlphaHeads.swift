import Foundation

public struct BioAlphaHead: TrickHead {
    public let name: String

    public init(index: Int) {
        self.name = "BioAlpha-\(index)"
    }

    public func tick(context: TrickContext) {
        let key = "bioalpha.\(name).signals"
        let signals: Int = context.memory.read(key) ?? 0
        context.memory.write(key, value: signals + 1)
    }
}
