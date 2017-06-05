import UIKit

class VCreateCellTimelineCell:UICollectionViewCell
{
    private weak var circle:UIView!
    private let kCircleMargin:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let circle:UIView = UIView()
        circle.isUserInteractionEnabled = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = UIColor.clear
        circle.layer.borderWidth = kBorderWidth
        circle.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        circle.layer.cornerRadius = (frame.size.width / 2) - kCircleMargin
        
        addSubview(circle)
        
        NSLayoutConstraint.equals(
            view:circle,
            toView:self,
            margin:kCircleMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(model:MCreateFrame)
    {
    }
}
