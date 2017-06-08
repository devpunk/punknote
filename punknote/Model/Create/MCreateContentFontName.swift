import UIKit

class MCreateContentFontName:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 120
    
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
            return VCreateCellFontName.reusableIdentifier
        }
    }
}
