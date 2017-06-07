import UIKit

class MCreateBackgroundGreenYellow:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkGreen,
            colorTopRight:UIColor.punkYellow)
        
        return gradient
    }
}
