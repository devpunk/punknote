import UIKit

class MCreateBackgroundOrangePurple:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkOrange,
            colorTopRight:UIColor.punkPurple)
        
        return gradient
    }
}
