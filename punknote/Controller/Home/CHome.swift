import UIKit

class CHome:Controller<VHome>
{
    let model:MHome
    
    override init()
    {
        model = MHome()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        MSession.sharedInstance.loadSession()
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        guard
        
            let view:VHome = self.view as? VHome
        
        else
        {
            return
        }
        
        view.startLoading()
        model.reload(controller:self)
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
    
    func notesLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            guard
            
                let view:VHome = self?.view as? VHome
            
            else
            {
                return
            }
            
            view.stopLoading()
        }
    }
}
