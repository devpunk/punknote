import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    let font:MCreateFont
    let backgrounds:[MCreateBackgroundProtocol]
    var frames:[MCreateFrame]
    var selectedFrame:Int
    var selectedBackground:Int
    
    init()
    {
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        let contentCard:MCreateContentCard = MCreateContentCard()
        
        let backgroundPurpleOrange:MCreateBackgroundPurpleOrange = MCreateBackgroundPurpleOrange()
        let backgroundPurpleGreen:MCreateBackgroundPurpleGreen = MCreateBackgroundPurpleGreen()
        
        selectedFrame = 0
        selectedBackground = 0
        frames = []
        content = [
            contentTimeline,
            contentCard]
        backgrounds = [
            backgroundPurpleOrange,
            backgroundPurpleGreen]
      
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
    
    func selectedBackgroundModel() -> MCreateBackgroundProtocol
    {
        let background:MCreateBackgroundProtocol = backgrounds[selectedBackground]
        
        return background
    }
}
