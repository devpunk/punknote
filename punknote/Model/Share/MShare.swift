import UIKit

class MShare
{
    static let width:CGFloat = 320
    static let height:CGFloat = 240
    let content:[MShareContentProtocol]
    
    private class func factoryContent() -> [MShareContentProtocol]
    {
        let contentScale:MShareContentScale = MShareContentScale()
        let contentGif:MShareContentGif = MShareContentGif()
        let contentPng:MShareContentPng = MShareContentPng()
        
        let content:[MShareContentProtocol] = [
            contentScale,
            contentGif,
            contentPng]
        
        return content
    }
    
    init()
    {
        content = MShare.factoryContent()
    }
}
