import UIKit

class View:UIView
{
    private(set) weak var viewModel:UIViewController!
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:VPushBackground?
    
    required init(viewModel:UIViewController)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.viewModel = viewModel
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
