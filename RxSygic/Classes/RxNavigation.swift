import UIKit
import RxSwift
import SygicNavi

public class RxNavigation: NSObject {
    static public let shared = RxNavigation()
    
    public var speedLimit = Variable<SYSpeedLimit>(SYSpeedLimit())
    public var directionInfo = Variable<SYInstruction>(SYInstruction())
    fileprivate var signpostInfo = Variable<[SYSignpost]>([SYSignpost]())
    public var positionInfo = Variable<SYPositionInfo>(SYPositionInfo())
    public var signpostDirectionInfo: Observable<(signpostInfo: [SYSignpost], directionInfo: SYInstruction)>
    
    public var currentRadar = Variable<SYRadar>(SYRadar())
    public var currentRailwayCrossing = Variable<SYRailwayCrossing>(SYRailwayCrossing())
    public var sharpCurve = Variable<SYSharpCurve>(SYSharpCurve())
    
    public var waypointPassedIndex = Variable<UInt>(0)
    public var onRouteInfo = Variable<SYOnRouteInfo>(SYOnRouteInfo())
    
    
    private override init() {
        signpostDirectionInfo = Observable.combineLatest(signpostInfo.asObservable(), directionInfo.asObservable()) {
            singpostInfo, directionInfo in
            return (signpostInfo: singpostInfo, directionInfo: directionInfo)
        }
        
        super.init()
        SYNavigation.shared().delegate = self
    }
}

extension RxNavigation: SYNavigationDelegate {
    
    public func navigation(_ navigation: SYNavigation, didUpdate positionInfo: SYPositionInfo?) {
        self.positionInfo.value = positionInfo ?? SYPositionInfo()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate limit: SYSpeedLimit?) {
        speedLimit.value = limit ?? SYSpeedLimit()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdateDirection directionInfo: SYInstruction?) {
        self.directionInfo.value = directionInfo ?? SYInstruction()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdateSignpost signpostInfo: [SYSignpost]?) {
        self.signpostInfo.value = signpostInfo ?? [SYSignpost]()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate radarInfo: SYRadar?) {
        currentRadar.value = radarInfo ?? SYRadar()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate radars: [SYRadar]?, on route: SYRoute?) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdatePoisOnRoute pois: [SYPoiOnRoute]?) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate railwayInfo: SYRailwayCrossing?) {
        currentRailwayCrossing.value = railwayInfo ?? SYRailwayCrossing()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate sharpCurve: SYSharpCurve?) {
        self.sharpCurve.value = sharpCurve ?? SYSharpCurve()
    }
    
    public func navigation(_ navigation: SYNavigation, didPassWaypointWith index: UInt) {
        self.waypointPassedIndex.value = index
    }
    
    public func navigationManagerDidReachFinish(_ navigation: SYNavigation) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didFindBetterRoute alterRoute: SYAlternativeRoute?) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdateHighwayExit highwayExit: [SYHighwayExit]?) {
        
    }
    
//    public func navigation(_ navigation: SYNavigation, didUpdate route: SYRoute?) {
//        
//    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate mode: SYTransportMode) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate info: SYOnRouteInfo?) {
        onRouteInfo.value = info ?? SYOnRouteInfo()
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate lanesInfo: SYLanesInformation?) {
        
    }
}
