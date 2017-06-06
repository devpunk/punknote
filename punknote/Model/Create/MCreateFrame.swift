import Foundation

class MCreateFrame
{
    var title:String
    var duration:TimeInterval
    let selected:MCreateSelected
    private let kDefaultDuration:TimeInterval = 3
    
    init()
    {
        title = NSLocalizedString("MCreateFrame_defaultTitle", comment:"")
        duration = kDefaultDuration
        selected = MCreateSelected()
    }
}
