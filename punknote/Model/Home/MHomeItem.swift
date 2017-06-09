import Foundation

class MHomeItem
{
    let note:DNote
    let background:MCreateBackgroundProtocol
    
    init(
        note:DNote,
        background:MCreateBackgroundProtocol)
    {
        self.note = note
        self.background = background
    }
}
