import UIKit

class View<T:DefinitionProtocol>:UIView
{
    init(controller:T.ViewModel)
    {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
