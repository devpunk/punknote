import Foundation

class MShare
{
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
