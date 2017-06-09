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
        let backgrounds:[MCreateBackgroundProtocol] = MCreate.factoryBackground()
        var items:[MHomeItem] = []
        
        for note:DNote in notes
        {
            let selectedBackground:Int = Int(note.selectedBackground)
            let background:MCreateBackgroundProtocol = backgrounds[selectedBackground]
            
            let item:MHomeItem = MHomeItem(
                note:note,
                background:background)
            items.append(item)
        }
        
        items.sort
        { (itemA:MHomeItem, itemB:MHomeItem) -> Bool in
            
            return itemA.note.created > itemB.note.created
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
