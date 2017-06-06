import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    let font:MCreateFont
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
      
        font = MCreateFont()
        addFrame()
    }
    
    //MARK: public
    
    func addFrame()
    {
        let count:Int = frames.count
        let newFrame:MCreateFrame = MCreateFrame()
        frames.append(newFrame)
        selectedFrame = count
    }
    
    func selectedFrameModel() -> MCreateFrame
    {
        let item:MCreateFrame = frames[selectedFrame]
        
        return item
    }
}
