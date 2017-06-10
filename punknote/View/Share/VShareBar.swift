import UIKit

class VShareBar:UIView
{
    private weak var controller:CShare!
    
    init(controller:CShare)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
