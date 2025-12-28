import Foundation

public enum Logging {
    public static func info(_ message: String, metadata: [String: String] = [:]) {
        emit(level: "INFO", message: message, metadata: metadata)
    }

    public static func warn(_ message: String, metadata: [String: String] = [:]) {
        emit(level: "WARN", message: message, metadata: metadata)
    }

    public static func error(_ message: String, metadata: [String: String] = [:]) {
        emit(level: "ERROR", message: message, metadata: metadata)
    }

    private static func emit(level: String, message: String, metadata: [String: String]) {
        let meta = metadata.isEmpty ? "" : " " + metadata.map { "\($0)=\($1)" }.joined(separator: " ")
        print("[\(level)] \(message)\(meta)")
    }
}
