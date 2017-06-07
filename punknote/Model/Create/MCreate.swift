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
        let contentBackground:MCreateContentBackground = MCreateContentBackground()
        
        let backgroundPurpleOrange:MCreateBackgroundPurpleOrange = MCreateBackgroundPurpleOrange()
        let backgroundPurpleGreen:MCreateBackgroundPurpleGreen = MCreateBackgroundPurpleGreen()
        let backgroundOrangeGreen:MCreateBackgroundOrangeGreen = MCreateBackgroundOrangeGreen()
        
        selectedFrame = 0
        selectedBackground = 0
        frames = []
        
        content = [
            contentTimeline,
            contentCard,
            contentBackground]
        
        backgrounds = [
            backgroundPurpleOrange,
            backgroundPurpleGreen,
            backgroundOrangeGreen]
      
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
