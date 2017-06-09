import UIKit

class CHome:Controller<VHome>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        MSession.sharedInstance.loadSession()
    }
    
    //MARK: public
    
    func newNote()
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        let controller:CCreate = CCreate()
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
}
