import UIKit

class VHome:View
{
    private weak var spinner:VSpinner!
    private let kBarHeight:CGFloat = 64
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
            
            let controller:CHome = controller as? CHome
        
        else
        {
            return
        }
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        let viewBar:VHomeBar = VHomeBar(controller:controller)
        
        addSubview(spinner)
        addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        
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
    
    deinit
    {
        spinner.stopAnimating()
    }
}
