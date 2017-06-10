import UIKit

class MShareScaleX1:MShareScaleProtocol
{
    private let kScale:CGFloat = 1
    
    var title:String
    {
        get
        {
            return NSLocalizedString("MShareScaleX1_title", comment:"")
        }
    }
    
    var scale:CGFloat
    {
        get
        {
            return kScale
        }
    }
}
