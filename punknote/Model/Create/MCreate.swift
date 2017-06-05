import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    let selected:MCreateSelected
    var frames:[MCreateFrame]
    var selectedFrame:Int
    
    init()
    {
        let startingFrame:MCreateFrame = MCreateFrame()
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        
        frames = [startingFrame]
        selected = MCreateSelected()
        selectedFrame = 0
        content = [
            contentTimeline]
    }
}
