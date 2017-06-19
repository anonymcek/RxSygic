import UIKit
import RxSwift

class RxNavigation: NSObject {
    static let shared = RxNavigation()
    
    var speedLimit = Variable<SYSpeedLimit>(SYSpeedLimit())
    var directionInfo = Variable<SYInstruction>(SYInstruction())
    var signpostInfo = Variable<[SYSignpost]>([SYSignpost]())
    var positionInfo = Variable<SYPositionInfo>(SYPositionInfo())
    
    var currentRadar = Variable<SYRadar>(SYRadar())
    var currentRailwayCrossing = Variable<SYRailwayCrossing>(SYRailwayCrossing())
    var sharpCurve = Variable<SYSharpCurve>(SYSharpCurve())
    
    var waypointPassedIndex = Variable<UInt>(0)
    var onRouteInfo = Variable<SYOnRouteInfo>(SYOnRouteInfo())
    
    
    private override init() {
        super.init()
        SYNavigation.shared().delegate = self
    }
}

extension RxNavigation: SYNavigationDelegate {
    
    func navigation(_ navigation: SYNavigation, didUpdate positionInfo: SYPositionInfo?) {
        guard let positionInfo = positionInfo else { return }
        self.positionInfo.value = positionInfo
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate limit: SYSpeedLimit?) {
        guard let limit = limit else { return }
        self.speedLimit.value = limit
    }
    
    func navigation(_ navigation: SYNavigation, didUpdateDirection directionInfo: SYInstruction?) {
        guard let directionInfo = directionInfo else { return }
        self.directionInfo.value = directionInfo
    }
    
    func navigation(_ navigation: SYNavigation, didUpdateSignpost signpostInfo: [SYSignpost]?) {
        guard let signpostInfo = signpostInfo else { return }
        self.signpostInfo.value = signpostInfo
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate radarInfo: SYRadar?) {
        guard let radarInfo = radarInfo else { return }
        self.currentRadar.value = radarInfo
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate radars: [SYRadar]?, on route: SYRoute?) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didUpdatePoisOnRoute pois: [SYPoiOnRoute]?) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate railwayInfo: SYRailwayCrossing?) {
        guard let railwayInfo = railwayInfo else { return }
        self.currentRailwayCrossing.value = railwayInfo
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate sharpCurve: SYSharpCurve?) {
        guard let sharpCurve = sharpCurve else { return }
        self.sharpCurve.value = sharpCurve
    }
    
    func navigation(_ navigation: SYNavigation, didPassWaypointWith index: UInt) {
        self.waypointPassedIndex.value = index
    }
    
    func navigationManagerDidReachFinish(_ navigation: SYNavigation) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didFindBetterRoute alterRoute: SYAlternativeRoute?) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didUpdateHighwayExit highwayExit: [SYHighwayExit]?) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate route: SYRoute?) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate mode: SYTransportMode) {
        
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate info: SYOnRouteInfo?) {
        guard let onRouteInfo = info else { return }
        self.onRouteInfo.value = onRouteInfo
    }
    
    func navigation(_ navigation: SYNavigation, didUpdate lanesInfo: SYLanesInformation?) {
        
    }
}
