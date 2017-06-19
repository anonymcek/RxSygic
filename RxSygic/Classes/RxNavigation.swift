import UIKit
import RxSwift
import SygicNavi

public class RxNavigation: NSObject {
    static public let shared = RxNavigation()
    
    public var speedLimit = Variable<SYSpeedLimit>(SYSpeedLimit())
    public var directionInfo = Variable<SYInstruction>(SYInstruction())
    public var signpostInfo = Variable<[SYSignpost]>([SYSignpost]())
    public var positionInfo = Variable<SYPositionInfo>(SYPositionInfo())
    
    public var currentRadar = Variable<SYRadar>(SYRadar())
    public var currentRailwayCrossing = Variable<SYRailwayCrossing>(SYRailwayCrossing())
    public var sharpCurve = Variable<SYSharpCurve>(SYSharpCurve())
    
    public var waypointPassedIndex = Variable<UInt>(0)
    public var onRouteInfo = Variable<SYOnRouteInfo>(SYOnRouteInfo())
    
    
    private override init() {
        super.init()
        SYNavigation.shared().delegate = self
    }
}

extension RxNavigation: SYNavigationDelegate {
    
    public func navigation(_ navigation: SYNavigation, didUpdate positionInfo: SYPositionInfo?) {
        guard let positionInfo = positionInfo else { return }
        self.positionInfo.value = positionInfo
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate limit: SYSpeedLimit?) {
        guard let limit = limit else { return }
        self.speedLimit.value = limit
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdateDirection directionInfo: SYInstruction?) {
        guard let directionInfo = directionInfo else { return }
        self.directionInfo.value = directionInfo
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdateSignpost signpostInfo: [SYSignpost]?) {
        guard let signpostInfo = signpostInfo else { return }
        self.signpostInfo.value = signpostInfo
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate radarInfo: SYRadar?) {
        guard let radarInfo = radarInfo else { return }
        self.currentRadar.value = radarInfo
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate radars: [SYRadar]?, on route: SYRoute?) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdatePoisOnRoute pois: [SYPoiOnRoute]?) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate railwayInfo: SYRailwayCrossing?) {
        guard let railwayInfo = railwayInfo else { return }
        self.currentRailwayCrossing.value = railwayInfo
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate sharpCurve: SYSharpCurve?) {
        guard let sharpCurve = sharpCurve else { return }
        self.sharpCurve.value = sharpCurve
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
    
    public func navigation(_ navigation: SYNavigation, didUpdate route: SYRoute?) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate mode: SYTransportMode) {
        
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate info: SYOnRouteInfo?) {
        guard let onRouteInfo = info else { return }
        self.onRouteInfo.value = onRouteInfo
    }
    
    public func navigation(_ navigation: SYNavigation, didUpdate lanesInfo: SYLanesInformation?) {
        
    }
}
