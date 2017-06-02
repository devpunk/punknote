import UIKit

class View:UIView
{
    private(set) weak var viewModel:UIViewController!
    
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
