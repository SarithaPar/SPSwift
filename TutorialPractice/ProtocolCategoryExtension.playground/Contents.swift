/*
 Protocol in Objective-C:
 
 @protocol protocolName
 @required
    // list of required methods
 @optional
    // list of optional methods
 @end
 
 @interface myClass: NSObject <MyProtocol?
 ...
 @end
 
 
 
 */


/* Objective-C -> Categories == Swift -> Extension
 */
struct Rect {
    var x = 0.0, y = 0.0
    var width = 0.0, height = 0.0
    init (x: Float, y: Float, width : Float, height: Float) {

    }
}
extension Rect {
    func initi (x: Float, y: Float, width : Float, height: Float){
//        self.type(of: init)(x:x, y:y, width: width, height: height)
    }
}
