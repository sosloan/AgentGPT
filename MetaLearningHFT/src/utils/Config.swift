import Foundation

public struct Configuration: Codable {
    public let environment: String
    public let convexUrl: String
    public let riskLimits: RiskLimits
}

public enum ConfigLoader {
    public static func load(from url: URL) throws -> Configuration {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(Configuration.self, from: data)
    }
}
