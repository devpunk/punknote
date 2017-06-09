import UIKit

class VHomeBar:UIView
{
    private weak var controller:CHome!
    private let kContentTop:CGFloat = 20
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let imageIcon:UIImageView = UIImageView()
        imageIcon.isUserInteractionEnabled = false
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.contentMode = UIViewContentMode.center
        imageIcon.clipsToBounds = true
        imageIcon.image = #imageLiteral(resourceName: "assetGenericSmallIcon")
        
        addSubview(imageIcon)
        
        NSLayoutConstraint.topToTop(
            view:imageIcon,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:imageIcon,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:imageIcon,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
