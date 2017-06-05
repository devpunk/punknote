import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    var frames:[MCreateFrame]
    var selectedFrame:Int
    
    init()
    {
        let startingFrame:MCreateFrame = MCreateFrame()
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        
        frames = [startingFrame]
        selectedFrame = 0
        content = [
            contentTimeline]
    }
}
