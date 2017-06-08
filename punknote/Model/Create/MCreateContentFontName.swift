import UIKit

class MCreateContentFontName:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 140
    
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
