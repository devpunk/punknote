import UIKit

class CCreate:Controller<VCreate>
{
    let model:MCreate
    private(set) weak var modelHomeItem:MHomeItem?
    
    init(modelHomeItem:MHomeItem?)
    {
        self.modelHomeItem = modelHomeItem
        
        if let modelHomeItem:MHomeItem = modelHomeItem
        {
            model = MCreate(modelHomeItem:modelHomeItem)
        }
        else
        {
            model = MCreate()
        }
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.viewParent.panRecognizer.isEnabled = false
    }
    
    //MARK: private
    
    private func saveNote()
    {
        model.save(controller:self)
    }
    
    //MARK: public
    
    func refreshFrame()
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        guard
        
            let view:VCreate = self.view as? VCreate
        
        else
        {
            return
        }
        
        view.collectionView.reloadData()
    }
    
    func cancel()
    {
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    func done()
    {
        guard
        
            let view:VCreate = self.view as? VCreate
        
        else
        {
            return
        }
        
        view.startLoading()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.saveNote()
        }
    }
    
    func addFrame()
    {
        model.addFrame()
    }
    
    func noteSaved()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.cancel()
        }
    }
}
