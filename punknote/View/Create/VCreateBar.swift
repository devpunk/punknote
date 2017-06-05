import UIKit

class VCreateBar:UIView
{
    private weak var controller:CCreate!
    private let kBorderHeight:CGFloat = 1
    private let kContentTop:CGFloat = 20
    private let kCancelWidth:CGFloat = 90
    private let kDoneWidth:CGFloat = 100
    
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
        labelTitle.font = UIFont.bold(size:18)
        labelTitle.textColor = UIColor.punkPurple
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
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(buttonCancel)
        
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
