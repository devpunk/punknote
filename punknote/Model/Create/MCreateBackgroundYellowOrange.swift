import UIKit

class MCreateBackgroundYellowOrange:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkYellow,
            colorTopRight:UIColor.punkOrange)
        
        return gradient
    }
}
