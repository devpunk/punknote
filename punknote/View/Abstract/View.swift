import UIKit

class View<T:DefinitionProtocol>:UIView
{
    weak var viewModel:T.ViewModel!
    
    init(viewModel:T.ViewModel)
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
