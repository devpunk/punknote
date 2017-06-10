import UIKit

class MShareContentPng:MShareContentProtocol
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
