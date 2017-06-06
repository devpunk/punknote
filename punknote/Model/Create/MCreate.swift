import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    var frames:[MCreateFrame]
    var selectedFrame:Int
    
    init()
    {
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        let contentCard:MCreateContentCard = MCreateContentCard()
        
        frames = []
        selectedFrame = 0
        content = [
            contentTimeline,
            contentCard]
        
        addFrame()
    }
    
    //MARK: public
    
    func addFrame()
    {
        let newFrame:MCreateFrame = MCreateFrame()
        frames.append(newFrame)
    }
    
    func selectedFrameModel() -> MCreateFrame
    {
        let item:MCreateFrame = frames[selectedFrame]
        
        return item
    }
}
