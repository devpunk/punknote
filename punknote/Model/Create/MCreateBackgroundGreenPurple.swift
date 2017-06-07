import UIKit

class MCreateBackgroundGreenPurple:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkGreen,
            colorTopRight:UIColor.punkPurple)
        
        return gradient
    }
}
