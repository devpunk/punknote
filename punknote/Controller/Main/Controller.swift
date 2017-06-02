import UIKit

class Controller<T:UIView>:UIViewController
{
    init()
    {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        guard
            
            let viewMain:ViewMain.Type = T as? ViewMain.Type
        else
        {
            return
        }
        let view:T = T(controller:self)
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    override var prefersStatusBarHidden:Bool
    {
        return false
    }
}
