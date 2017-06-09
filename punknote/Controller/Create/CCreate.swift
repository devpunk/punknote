import UIKit

class CCreate:Controller<VCreate>
{
    let model:MCreate
    
    override init()
    {
        model = MCreate()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func saveNote()
    {
        
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
}
