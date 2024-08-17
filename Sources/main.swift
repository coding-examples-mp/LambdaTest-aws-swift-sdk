import Foundation
import ArgumentParser
import AWSLambda
import Logging

@main
struct Main: AsyncParsableCommand {
    @Option(help: "the function to call")
    var functionName: String;
    
    @Option(help: "JSON-encoded parameters")
    var functionParameters: String;
    
    public func run() async throws {
        LoggingSystem.bootstrap(MyLogHandler.init)
        let data = functionParameters.data(using: .utf8)

        let client: LambdaClient
        do {
            client = try await LambdaClient()
        } catch {
            print(error)
            return
        }
        let result: InvokeOutput
        do {
            result = try await client.invoke(input: InvokeInput(
                functionName: functionName,
                logType: .tail,
                payload: data
            ))
        } catch {
            print(error)
            return
        }
        print(String(describing: String(data:result.payload!, encoding: .utf8) ?? "null"))
    }
}

public struct MyLogHandler: LogHandler {
    
    @Sendable
    public init(label: String) {
        self._logLevel = .warning
    }
    
    var _logLevel: Logger.Level
    public var metadata: Logger.Metadata = [:]
    
    public var logLevel: Logger.Level {
            // when we get asked for the log level, we check if it was globally overridden or not
        get {
            self._logLevel
        }
            // we set the log level whenever we're asked (note: this might not have an effect if globally
            // overridden)
        set {
            self._logLevel = newValue
        }
    }
    
    public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
        get {
            return self.metadata[metadataKey]
        }
        set(newValue) {
            self.metadata[metadataKey] = newValue
        }
    }
}
