import Foundation

class AnalyticsInjector {

    fileprivate func provideAnalyticsEventsProvider() -> AnalyticsEventsProvider {
        return AnalyticsEventsProvider()
    }

    fileprivate func provideSegmentProvider() -> SegmentProvider {
        return SegmentProvider(segmentSDK: SegmentSDK.shared)
    }

    fileprivate func provideAnalyticsProviderFactory() -> AnalyticsProviderFactory {
        return AnalyticsProviderFactory(segmentProvider: provideSegmentProvider())
    }

    fileprivate func provideAnalyticsRemoteDataSource() -> AnalyticsRemoteDataSource {
        return AnalyticsRemoteDataSource(analyticsEventsProvider: provideAnalyticsEventsProvider(), analyticsProviderFactory: provideAnalyticsProviderFactory())
    }

    fileprivate func provideAnalyticsRepository() -> AnalyticsRepository {
        return AnalyticsRepository(analyticsRemoteDataSource: provideAnalyticsRemoteDataSource())
    }

    func provideAnalyticsUseCase() -> AnalyticsUseCase {
        return AnalyticsUseCase(analyticsRepository: provideAnalyticsRepository())
    }

    func provideSegmentIdentifier() -> SegmentIdentifier {
        return SegmentIdentifier(segmentSDK: SegmentSDK.shared)
    }
}
