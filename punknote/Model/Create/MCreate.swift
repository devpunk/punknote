import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    var frames:[MCreateFrame]
    var selectedFrame:Int
    
    init()
    {
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        
        frames = []
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
