import UIKit

class VHome:View
{
    private weak var spinner:VSpinner!
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        addSubview(spinner)
        
        NSLayoutConstraint.equals(
            view:spinner,
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
