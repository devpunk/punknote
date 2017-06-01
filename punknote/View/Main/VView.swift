import UIKit

class VView:UIView
{
    weak var controller:UIViewController!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:VParentPushBackground?
    
    required init(controller:UIViewController)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
