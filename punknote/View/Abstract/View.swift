import UIKit

class View<T:ViewModel>:UIView
{
    weak var viewModel:T!
    
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
        self.viewModel = viewModel
    }
}
