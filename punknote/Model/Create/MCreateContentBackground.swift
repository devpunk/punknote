import UIKit

class MCreateContentBackground:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 60
    
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
