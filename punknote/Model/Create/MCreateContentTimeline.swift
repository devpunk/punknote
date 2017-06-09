import UIKit

class MCreateContentTimeline:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 105
    
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
            return VCreateCellTimeline.reusableIdentifier
        }
    }
}
