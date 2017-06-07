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
        
        let backgroundSweetDreams:MCreateBackgroundSweetDreams = MCreateBackgroundSweetDreams()
        let backgroundSevenSeas:MCreateBackgroundSevenSeas = MCreateBackgroundSevenSeas()
        
        let backgroundPurpleOrange:MCreateBackgroundPurpleOrange = MCreateBackgroundPurpleOrange()
        let backgroundOrangePurple:MCreateBackgroundOrangePurple = MCreateBackgroundOrangePurple()
        let backgroundPurpleGreen:MCreateBackgroundPurpleGreen = MCreateBackgroundPurpleGreen()
        let backgroundGreenPurple:MCreateBackgroundGreenPurple = MCreateBackgroundGreenPurple()
        let backgroundOrangeGreen:MCreateBackgroundOrangeGreen = MCreateBackgroundOrangeGreen()
        let backgroundGreenOrange:MCreateBackgroundGreenOrange = MCreateBackgroundGreenOrange()
        let backgroundYellowGreen:MCreateBackgroundYellowGreen = MCreateBackgroundYellowGreen()
        let backgroundGreenYellow:MCreateBackgroundGreenYellow = MCreateBackgroundGreenYellow()
        let backgroundYellowOrange:MCreateBackgroundYellowOrange = MCreateBackgroundYellowOrange()
        let backgroundOrangeYellow:MCreateBackgroundOrangeYellow = MCreateBackgroundOrangeYellow()
        
        let backgroundBlueNight:MCreateBackgroundBlueNight = MCreateBackgroundBlueNight()
        let backgroundShades:MCreateBackgroundShades = MCreateBackgroundShades()
        
        selectedFrame = 0
        selectedBackground = 0
        frames = []
        
        content = [
            contentTimeline,
            contentCard,
            contentBackground]
        
        backgrounds = [
            backgroundSweetDreams,
            backgroundSevenSeas,
            backgroundPurpleOrange,
            backgroundOrangePurple,
            backgroundPurpleGreen,
            backgroundGreenPurple,
            backgroundOrangeGreen,
            backgroundGreenOrange,
            backgroundYellowGreen,
            backgroundGreenYellow,
            backgroundYellowOrange,
            backgroundOrangeYellow,
            backgroundBlueNight,
            backgroundShades]
      
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
