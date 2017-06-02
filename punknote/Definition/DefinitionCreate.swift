import UIKit

class DefinitionCreate:DefinitionProtocol
{
    var model:Any
    {
        get
        {
            return NSNull()
        }
    }
    
    var view: UIView.Type
    {
        get
        {
            return VCreate.self
        }
    }
    
    required init()
    {
        
    }
}
