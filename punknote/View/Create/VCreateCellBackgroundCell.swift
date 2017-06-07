import UIKit

class VCreateCellBackgroundCell:UICollectionViewCell
{
    private weak var background:UIView?
    private weak var imageIndicator:UIImageView!
    private let kCornerRadius:CGFloat = 4
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        layer.cornerRadius = kCornerRadius
        layer.borderColor = UIColor.black.cgColor
        
        let imageIndicator:UIImageView = UIImageView()
        imageIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageIndicator.clipsToBounds = true
        imageIndicator.isUserInteractionEnabled = false
        imageIndicator.contentMode = UIViewContentMode.bottomRight
        self.imageIndicator = imageIndicator
        
        addSubview(imageIndicator)
        
        NSLayoutConstraint.equals(
            view:imageIndicator,
            toView:self)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            layer.borderWidth = 2
            imageIndicator.image = #imageLiteral(resourceName: "assetGenericCreateSelectedOn")
        }
        else
        {
            layer.borderWidth = 0
            imageIndicator.image = #imageLiteral(resourceName: "assetGenericCreateSelectedOff")
        }
    }
    
    //MARK: public
    
    func config(model:MCreateBackgroundProtocol)
    {
        self.background?.removeFromSuperview()
        
        let background:UIView = model.view()
        self.background = background
        
        insertSubview(background, at:0)
        
        NSLayoutConstraint.equals(
            view:background,
            toView:self)
        
        hover()
    }
}
