import UIKit

class CShare:Controller<VShare>
{
    let model:MHomeItem
    
    init(model:MHomeItem)
    {
        self.model = model
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
