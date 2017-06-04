import UIKit

class VCreate:View
{
    private let kBarHeight:CGFloat = 70
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
            
            let controllerCreate:CCreate = controller as? CCreate
        
        else
        {
            return
        }
        
        let viewBar:VCreateBar = VCreateBar(controller:controllerCreate)
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
