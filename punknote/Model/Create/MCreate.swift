import Foundation

class MCreate
{
    var frames:[MCreateFrame]
    var selectedFrame:Int
    
    init()
    {
        let startingFrame:MCreateFrame = MCreateFrame()
        frames = [startingFrame]
        selectedFrame = 0
    }
}
