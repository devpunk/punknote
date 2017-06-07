import UIKit

class MCreateBackgroundYellowOrange:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.yellow,
            colorTopRight:UIColor.punkOrange)
        
        return gradient
    }
}
