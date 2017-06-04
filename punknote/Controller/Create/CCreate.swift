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
}
