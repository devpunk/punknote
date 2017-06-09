import UIKit

class VHomeBar:UIView
{
    private weak var controller:CHome!
    private let kIconTop:CGFloat = 20
    private let kBorderHeight:CGFloat = 1
    private let kCornerRadius:CGFloat = 5
    private let kNewWidth:CGFloat = 60
    private let kNewHeight:CGFloat = 26
    private let kNewRight:CGFloat = -10
    private let kNewTop:CGFloat = 29
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let blur:VBlur = VBlur.light()
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        
        let imageIcon:UIImageView = UIImageView()
        imageIcon.isUserInteractionEnabled = false
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.contentMode = UIViewContentMode.center
        imageIcon.clipsToBounds = true
        imageIcon.image = #imageLiteral(resourceName: "assetGenericSmallIcon")
        
        let buttonNew:UIButton = UIButton()
        buttonNew.translatesAutoresizingMaskIntoConstraints = false
        buttonNew.clipsToBounds = true
        buttonNew.backgroundColor = UIColor.punkPurple
        buttonNew.layer.cornerRadius = kCornerRadius
        buttonNew.setTitle(
            NSLocalizedString("VHomeBar_buttonNew", comment:""),
            for:UIControlState.normal)
        buttonNew.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonNew.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonNew.titleLabel!.font = UIFont.bold(size:13)
        buttonNew.addTarget(
            self,
            action:#selector(actionNew(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(imageIcon)
        addSubview(border)
        addSubview(buttonNew)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:imageIcon,
            toView:self,
            constant:kIconTop)
        NSLayoutConstraint.bottomToBottom(
            view:imageIcon,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:imageIcon,
            toView:self)
        
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
            view:buttonNew,
            toView:self,
            constant:kNewTop)
        NSLayoutConstraint.height(
            view:buttonNew,
            constant:kNewHeight)
        NSLayoutConstraint.rightToRight(
            view:buttonNew,
            toView:self,
            constant:kNewRight)
        NSLayoutConstraint.width(
            view:buttonNew,
            constant:kNewWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionNew(sender button:UIButton)
    {
        controller.newNote()
    }
}
