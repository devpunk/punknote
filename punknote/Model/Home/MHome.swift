import Foundation

class MHome
{
    private(set) var items:[MHomeItem]
    private weak var controller:CHome?
    
    init()
    {
        items = []
    }
    
    //MARK: private
    
    private func asyncReload()
    {
        DManager.sharedInstance?.fetchData(
            entityName:DNote.entityName)
        { [weak self] (data) in
            
            guard
            
                let notes:[DNote] = data as? [DNote]
            
            else
            {
                self?.notesLoaded()
                
                return
            }
            
            self?.parseNotes(notes:notes)
        }
    }
    
    private func parseNotes(notes:[DNote])
    {
        var items:[MHomeItem] = []
        
        for note:DNote in notes
        {
            let item:MHomeItem = MHomeItem(note:note)
            items.append(item)
        }
        
        self.items = items
        
        notesLoaded()
    }
    
    private func notesLoaded()
    {
        controller?.notesLoaded()
    }
    
    //MARK: public
    
    func reload(controller:CHome)
    {
        self.controller = controller
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncReload()
        }
    }
}
