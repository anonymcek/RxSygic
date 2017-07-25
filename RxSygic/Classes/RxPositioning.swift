import RxSwift
import SygicNavi

public class RxPositioning: NSObject, SYPositioningDelegate {
    static public let shared = RxPositioning()
    
    public var position = Variable<SYPosition>(SYPositioning.shared().lastKnownLocation ?? SYPosition())
    
    private override init() {
        super.init()
        
        SYPositioning.shared().delegate = self
        SYPositioning.shared().startUpdatingPosition()
    }
    
    public func positioning(_ positioning: SYPositioning, didUpdate position: SYPosition) {
        self.position.value = position
    }
}
