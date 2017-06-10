import UIKit

class MShareContentScale:MShareContentProtocol
{
    private let kCellHeight:CGFloat = 70
    
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
            return VShareCellScale.reusableIdentifier
        }
    }
}
