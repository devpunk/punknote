import UIKit

class VCreateCellCardBar:UIView
{
    private let kButtonRight:CGFloat = -10
    private let kButtonWidth:CGFloat = 80
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.punkPurple
        button.clipsToBounds = true
        button.setTitle(
            NSLocalizedString("VCreateCellCardBar_titleButton", comment:""),
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.bold(size:14)
        
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:button,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self,
            constant:kButtonRight)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
