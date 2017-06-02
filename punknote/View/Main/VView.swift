import UIKit

class VView<T:UIViewController>:UIView
{
    weak var controller:T!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:VParentPushBackground?
    
    required init(controller:T)
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
