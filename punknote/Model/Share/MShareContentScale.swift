import UIKit

class MShareContentScale:MShareContentProtocol
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
            return VCreateCellTimeline.reusableIdentifier
        }
    }
}
