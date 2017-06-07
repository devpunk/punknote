import UIKit

class MCreateBackgroundYellowGreen:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkYellow,
            colorTopRight:UIColor.punkGreen)
        
        return gradient
    }
}
