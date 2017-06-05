import UIKit

class VCreateBar:UIView
{
    private weak var controller:CCreate!
    private let kBorderHeight:CGFloat = 1
    private let kContentTop:CGFloat = 20
    private let kCancelWidth:CGFloat = 90
    private let kDoneWidth:CGFloat = 80
    
    init(controller:CCreate)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.regular(size:16)
        labelTitle.textColor = UIColor.black
        labelTitle.isUserInteractionEnabled = false
        labelTitle.text = NSLocalizedString("VCreateBar_labelTitle", comment:"")
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitle(
            NSLocalizedString("VCreateBar_buttonCancel", comment:""),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor.punkOrange,
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor.black,
            for:UIControlState.highlighted)
        buttonCancel.titleLabel!.font = UIFont.bold(size:16)
        
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.setTitle(
            NSLocalizedString("VCreateBar_buttonDone", comment:""),
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.punkPurple,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.black,
            for:UIControlState.highlighted)
        buttonDone.titleLabel!.font = UIFont.bold(size:16)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(buttonCancel)
        addSubview(buttonDone)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:buttonCancel,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kCancelWidth)
        
        NSLayoutConstraint.topToTop(
            view:buttonDone,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonDone,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonDone,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kDoneWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
