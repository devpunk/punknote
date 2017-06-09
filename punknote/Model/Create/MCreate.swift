import Foundation

class MCreate
{
    let content:[MCreateContentProtocol]
    let font:MCreateFont
    let backgrounds:[MCreateBackgroundProtocol]
    var frames:[MCreateFrame]
    var selectedFrame:Int
    var selectedBackground:Int
    
    private class func factoryContent() -> [MCreateContentProtocol]
    {
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        let contentCard:MCreateContentCard = MCreateContentCard()
        let contentDuration:MCreateContentDuration = MCreateContentDuration()
        let contentFontName:MCreateContentFontName = MCreateContentFontName()
        let contentFontSize:MCreateContentFontSize = MCreateContentFontSize()
        let contentBackground:MCreateContentBackground = MCreateContentBackground()
        
        let content:[MCreateContentProtocol] = [
            contentTimeline,
            contentCard,
            contentDuration,
            contentFontName,
            contentFontSize,
            contentBackground]
        
        return content
    }
    
    private class func factoryBackground() -> [MCreateBackgroundProtocol]
    {
        let backgroundSweetDreams:MCreateBackgroundSweetDreams = MCreateBackgroundSweetDreams()
        let backgroundSevenSeas:MCreateBackgroundSevenSeas = MCreateBackgroundSevenSeas()
        let backgroundPurpleOrange:MCreateBackgroundPurpleOrange = MCreateBackgroundPurpleOrange()
        let backgroundPurpleGreen:MCreateBackgroundPurpleGreen = MCreateBackgroundPurpleGreen()
        let backgroundGreenOrange:MCreateBackgroundGreenOrange = MCreateBackgroundGreenOrange()
        let backgroundYellowGreen:MCreateBackgroundYellowGreen = MCreateBackgroundYellowGreen()
        let backgroundYellowOrange:MCreateBackgroundYellowOrange = MCreateBackgroundYellowOrange()
        let backgroundBlueNight:MCreateBackgroundBlueNight = MCreateBackgroundBlueNight()
        let backgroundShades:MCreateBackgroundShades = MCreateBackgroundShades()
        
        let background:[MCreateBackgroundProtocol] = [
            backgroundSweetDreams,
            backgroundSevenSeas,
            backgroundPurpleOrange,
            backgroundPurpleGreen,
            backgroundGreenOrange,
            backgroundYellowGreen,
            backgroundYellowOrange,
            backgroundBlueNight,
            backgroundShades]
        
        return background
    }
    
    init()
    {
        selectedFrame = 0
        selectedBackground = 0
        frames = []
        content = MCreate.factoryContent()
        backgrounds = MCreate.factoryBackground()
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
