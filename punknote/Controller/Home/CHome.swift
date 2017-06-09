import UIKit

class CHome:Controller<VHome>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        MSession.sharedInstance.loadSession()
    }
}
