import UIKit

class VHomeCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clear
        clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config()
    {
        
    }
}
