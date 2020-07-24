import Foundation
import Apollo

class ApolloClientBuilder {
    
    private let apiURL: URL
    let configuration = URLSessionConfiguration.default
    
    init() {
        self.apiURL = BuildConfig.justoApiUrl.asURL()
    }
    
    func addAuthorizationHeader(authorization: String) -> ApolloClientBuilder {
        let AUTHORIZATION = "Authorization"
        if (!authorization.isEmpty) {
            configuration.httpAdditionalHeaders = [AUTHORIZATION: "\(authorization)"]
        } else {
            configuration.httpAdditionalHeaders = [:]
        }
        return self
    }
    
    func build() -> ApolloClient {
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: apiURL, session: URLSession(configuration: configuration)))
    }
    
    func buildDefault() -> ApolloClient {
        return ApolloClient(url: apiURL)
    }
}

extension ApolloClientBuilder {
    
    func createApolloClientWith(token: String) -> ApolloClient {
        return addAuthorizationHeader(authorization: token).build()
    }
}
