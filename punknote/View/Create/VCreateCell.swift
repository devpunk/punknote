import UIKit

class VCreateCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
