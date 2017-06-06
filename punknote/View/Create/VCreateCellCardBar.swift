import UIKit

class VCreateCellCardBar:UIView
{
    private let kButtonRight:CGFloat = -10
    private let kButtonWidth:CGFloat = 90
    private let kButtonVerticalMargin:CGFloat = 5
    private let kButtonCornerRadius:CGFloat = 8
    private let kHeight:CGFloat = 40
    private let kBorderHeight:CGFloat = 1
    
    init()
    {
        let rect:CGRect = CGRect(x:0, y:0, width:0, height:kHeight)
        
        super.init(frame:rect)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let blur:VBlur = VBlur.light()
        
        let border:VBorder = VBorder(color:UIColor(white:1, alpha:0.1))
        
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
        button.layer.cornerRadius = kButtonCornerRadius
        button.addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(border)
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:button,
            toView:self,
            margin:kButtonVerticalMargin)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self,
            constant:kButtonRight)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
    }
}
