import Foundation
import RxSwift
import Apollo

public final class ApolloRX {

    private let apolloClient: ApolloClient

    fileprivate init(_ apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }

    public func fetch<Query: GraphQLQuery>(query: Query,
                                           queue: DispatchQueue = DispatchQueue.main) -> Observable<Query.Data> {
        return Observable.create { observer in
            let cancellable = self.apolloClient.fetch(query: query, queue: queue) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        observer.onNext(data)
                        observer.onCompleted()
                    } else if let errors = graphQLResult.errors {
                        observer.onError(RxApolloError.graphQLErrors(errors))
                    }
                case .failure(let error):
                    observer.onError(RxApolloError.httpException(error.localizedDescription))
                }
            }
            return Disposables.create { cancellable.cancel() }
        }
    }

    public func perform<Mutation: GraphQLMutation>(mutation: Mutation,
                                                   queue: DispatchQueue = DispatchQueue.main) -> Observable<Mutation.Data> {
        return Observable.create { observer in
            let cancellable = self.apolloClient.perform(mutation: mutation, queue: queue) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        observer.onNext(data)
                        observer.onCompleted()
                    } else if let errors = graphQLResult.errors {
                        observer.onError(RxApolloError.graphQLErrors(errors))
                    }
                case .failure(let error):
                    observer.onError(RxApolloError.httpException(error.localizedDescription))
                }
            }
            return Disposables.create { cancellable.cancel() }
        }
    }
}

public enum RxApolloError: Error {
    case graphQLErrors([GraphQLError])
    case httpException(String)
}

public extension ApolloClient {
    var apolloRX: ApolloRX { return ApolloRX(self) }
}
