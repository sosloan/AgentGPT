import Foundation

public struct ExploreHead: TrickHead {
    public let name: String

    public init(index: Int) {
        self.name = "Explore-\(index)"
    }

    public func tick(context: TrickContext) {
        let key = "explore.\(name).paths"
        let paths: Int = context.memory.read(key) ?? 0
        context.memory.write(key, value: paths + 1)
    }
}
