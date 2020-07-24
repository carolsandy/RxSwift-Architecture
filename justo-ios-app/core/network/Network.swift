import Foundation
import Apollo

class Network {

    static let shared = Network()
    
    private(set) lazy var apolloClientBuilder = ApolloClientBuilder()
    private(set) lazy var apolloClient = ApolloClientBuilder().buildDefault()
}
