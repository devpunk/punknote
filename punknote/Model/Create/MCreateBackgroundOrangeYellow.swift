import UIKit

class MCreateBackgroundOrangeYellow:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkOrange,
            colorTopRight:UIColor.punkYellow)
        
        return gradient
    }
}
