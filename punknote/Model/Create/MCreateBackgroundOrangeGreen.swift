import UIKit

class MCreateBackgroundOrangeGreen:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkOrange,
            colorTopRight:UIColor.punkGreen)
        
        return gradient
    }
}
