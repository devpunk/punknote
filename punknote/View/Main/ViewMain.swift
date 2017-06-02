import UIKit

class ViewMain<T:Controller<UIView>>:UIView
{
    required init(controller:T)
    {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
