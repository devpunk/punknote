import UIKit

class View<T:ViewProtocol>:UIView
{
    weak var viewModel:T.viewModel!
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func viewDidLoad(viewModel:T)
    {
    }
}
