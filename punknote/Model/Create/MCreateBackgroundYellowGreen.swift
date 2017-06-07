import UIKit

class MCreateBackgroundYellowGreen:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.yellow,
            colorTopRight:UIColor.punkGreen)
        
        return gradient
    }
}
