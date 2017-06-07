import UIKit

class VCreateCellBackgroundCell:UICollectionViewCell
{
    private weak var background:UIView?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(model:MCreateBackgroundProtocol)
    {
        self.background?.removeFromSuperview()
        
        let background:UIView = model.view()
        self.background = background
        
        addSubview(background)
        
        NSLayoutConstraint.equals(
            view:background,
            toView:self)
    }
}
