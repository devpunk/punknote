import UIKit

class VCreateCellDurationSlider:UIView
{
    private weak var viewBar:VCreateCellDurationSliderBar!
    private weak var layoutBarWidth:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor(white:0.7, alpha:1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        layer.borderWidth = kBorderWidth
        layer.borderColor = UIColor(white:0, alpha:0.5).cgColor
        
        let viewBar:VCreateCellDurationSliderBar = VCreateCellDurationSliderBar()
        self.viewBar = viewBar
        
        addSubview(viewBar)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:self)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar,
            toView:self,
            multiplier:0.5)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
