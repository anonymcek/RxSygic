import UIKit
import RxSwift
import SygicNavi

public struct TrafficInfo {
    public var info: SYTrafficInfo?
    public var route: SYRoute?
}

public class RxTraffic: NSObject {
    
    public static let shared = RxTraffic()
    
    public var trafficInfo = Variable<TrafficInfo>(TrafficInfo())
    
    private override init() {
        super.init()
        SYTraffic.shared().delegate = self
    }
}

extension RxTraffic: SYTrafficDelegate {
    
    public func traffic(_ traffic: SYTraffic, didUpdateTraffic trafficInfo: SYTrafficInfo?, on route: SYRoute?) {
        self.trafficInfo.value = TrafficInfo(info: trafficInfo, route: route)
    }
}
