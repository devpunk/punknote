import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    let selected:MCreateSelected
    var frames:[MCreateFrame]
    var selectedFrame:Int
    
    init()
    {
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        
        frames = []
        selected = MCreateSelected()
        selectedFrame = 0
        content = [
            contentTimeline]
        
        addFrame()
    }
    
    //MARK: public
    
    func addFrame()
    {
        let newFrame:MCreateFrame = MCreateFrame()
        frames.append(newFrame)
    }
}
