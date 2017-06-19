import RxSwift

class RxPositioning: NSObject, SYPositioningDelegate {
    static let shared = RxPositioning()
    
    var position = Variable<SYPosition>(SYPosition())
    
    private override init() {
        super.init()
        
        SYPositioning.shared().delegate = self
        SYPositioning.shared().startUpdatingPosition()
    }
    
    func positioning(_ positioning: SYPositioning, didUpdate position: SYPosition) {
        self.position.value = position
    }
}
