import UIKit

class MCreateContentFontSize:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 90
    
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
            return VCreateCellFontSize.reusableIdentifier
        }
    }
}
