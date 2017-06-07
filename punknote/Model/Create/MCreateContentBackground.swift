import UIKit

class MCreateContentBackground:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 80
    
    var cellHeight:CGFloat
    {
        get
        {
            return kCellHeight
        }
    }
    
    var reusableIdentifier:String
    {
        get
        {
            return VCreateCellBackground.reusableIdentifier
        }
    }
}
