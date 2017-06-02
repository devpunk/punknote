import UIKit

class ViewMain<T:UIViewController>:UIView, ViewProtocol
{
    required init(controller: Controller<ViewMain<UIViewController>>)
    {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
