import UIKit

class View<T:DefinitionProtocol>:UIView
{
    weak var viewModel:T.ViewModel!
    
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
    
    func viewDidLoad(viewModel:T.ViewModel)
    {
        self.viewModel = viewModel
    }
}
