import RxSwift
import SygicNavi

public struct SearchQueryResult {
    public let query: String
    public let results: [SYSearchResult]
}

public class RxSearch {
    
    public static let shared = RxSearch()
    private let searchProvider = SYSearch()
    
    public var isSearching = Variable<Bool>(false)
    
    public func search(with query:String) -> Observable<SearchQueryResult> {
        return Observable.create({ [unowned self] observer in
            if query.isEmpty {
                observer.onNext(SearchQueryResult(query: query, results: [SYSearchResult]()))
                observer.onCompleted()
                return Disposables.create()
            }
            var searchPosition = SYGeoCoordinate()
            
            if let position = SYPositioning.shared().lastKnownLocation?.coordinate {
                searchPosition = position
            }
            self.isSearching.value = true
            let request = SYSearchRequest(query: query, atLocation: searchPosition)
            request.connectivity = .auto
            self.searchProvider.start(request) { [unowned self] (results: [SYSearchResult]) in
                self.isSearching.value = false
                observer.onNext(SearchQueryResult(query: query, results: results))
                observer.onCompleted()
            }
            return Disposables.create()
        }).shareReplay(1)
    }
    
    public func search(with searchResult: SYSearchResult) -> Observable<SYSearchResultDetail> {
        return Observable.create({ [unowned self] observer in
            if let coordinate = searchResult.coordinate  {
                let searchRequest = SYSearchResultDetailRequest(result: searchResult, atLocation: coordinate)
                self.searchProvider.start(searchRequest, withCompletion: { resultDetail in
                    if let resultDetail = resultDetail {
                        observer.onNext(resultDetail)
                    }
                    observer.onCompleted()
                })
            } else {
                observer.onCompleted()
            }
            return Disposables.create()
        })
    }
    
    public func search(with poiGroup: SYPoiGroup) -> Observable<[SYPlace]> {
        return Observable.create({ observer in
            var searchPosition = SYGeoCoordinate()
            if let position = SYPositioning.shared().lastKnownLocation?.coordinate {
                searchPosition = position
            }
            let placeRequest = SYPlaceRequest(location: searchPosition, searchRadius: 20000, poiGroupfilter: poiGroup)
            SYPlaces.shared().start(placeRequest, withCompletion: { (places) in
                observer.onNext(places)
                observer.onCompleted()
            })
            
            return Disposables.create()
        })
    }
}
