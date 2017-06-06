import UIKit

class VCreateCellCardBar:UIView
{
    private let kButtonHorizontalMargin:CGFloat = 7
    private let kButtonWidth:CGFloat = 90
    private let kButtonVerticalMargin:CGFloat = 7
    private let kButtonCornerRadius:CGFloat = 9
    private let kButtonBorderWidth:CGFloat = 1
    private let kHeight:CGFloat = 40
    private let kBorderHeight:CGFloat = 1
    
    init()
    {
        let rect:CGRect = CGRect(x:0, y:0, width:0, height:kHeight)
        
        super.init(frame:rect)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let blur:VBlur = VBlur.light()
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.backgroundColor = UIColor.white
        buttonDone.clipsToBounds = true
        buttonDone.setTitle(
            NSLocalizedString("VCreateCellCardBar_titleButtonDone", comment:""),
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.punkPurple,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.punkPurple.withAlphaComponent(0.2),
            for:UIControlState.highlighted)
        buttonDone.titleLabel!.font = UIFont.bold(size:13)
        buttonDone.layer.cornerRadius = kButtonCornerRadius
        buttonDone.layer.borderColor = UIColor.punkPurple.cgColor
        buttonDone.layer.borderWidth = kButtonBorderWidth
        buttonDone.addTarget(
            self,
            action:#selector(actionButtonDone(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonClear:UIButton = UIButton()
        buttonClear.translatesAutoresizingMaskIntoConstraints = false
        buttonClear.backgroundColor = UIColor.white
        buttonClear.clipsToBounds = true
        buttonClear.setTitle(
            NSLocalizedString("VCreateCellCardBar_titleButtonClear", comment:""),
            for:UIControlState.normal)
        buttonClear.setTitleColor(
            UIColor.punkPurple,
            for:UIControlState.normal)
        buttonClear.setTitleColor(
            UIColor.punkPurple.withAlphaComponent(0.2),
            for:UIControlState.highlighted)
        buttonClear.titleLabel!.font = UIFont.bold(size:13)
        buttonClear.layer.cornerRadius = kButtonCornerRadius
        buttonClear.layer.borderColor = UIColor.punkPurple.cgColor
        buttonClear.layer.borderWidth = kButtonBorderWidth
        buttonClear.addTarget(
            self,
            action:#selector(actionButtonClear(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(border)
        addSubview(buttonClear)
        addSubview(buttonDone)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonDone,
            toView:self,
            margin:kButtonVerticalMargin)
        NSLayoutConstraint.rightToRight(
            view:buttonDone,
            toView:self,
            constant:-kButtonHorizontalMargin)
        NSLayoutConstraint.width(
            view:buttonDone,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonClear,
            toView:self,
            margin:kButtonVerticalMargin)
        NSLayoutConstraint.leftToLeft(
            view:buttonClear,
            toView:self,
            constant:kButtonHorizontalMargin)
        NSLayoutConstraint.width(
            view:buttonClear,
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
    
    func actionButtonDone(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
    }
    
    func actionButtonClear(sender button:UIButton)
    {
        
    }
}
