import Foundation

class MCreateFrame
{
    var text:String
    var duration:TimeInterval
    let selected:MCreateSelected
    private let kDefaultDuration:TimeInterval = 5
    
    init()
    {
        text = NSLocalizedString("MCreateFrame_defaultText", comment:"")
        duration = kDefaultDuration
        selected = MCreateSelected()
    }
}
