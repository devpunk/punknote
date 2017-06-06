import Foundation

class MCreateFont
{
    let fonts:[MCreateFontName]
    private let kResourceName:String = "ResourceFonts"
    private let kResourceExtension:String = "plist"
    private let kKeyName:String = "name"
    private let kKeyFont:String = "font"
    
    init()
    {
        var fonts:[MCreateFontName] = []
        
        guard
            
            let resourceFont:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let fontArray:NSArray = NSArray(
                contentsOf:resourceFont),
            let fontList:[Any] = fontArray as? [Any]
            
        else
        {
            self.fonts = fonts
            
            return
        }
        
        for font:Any in fontList
        {
            guard
            
                let fontMap:[String:String] = font as? [String:String],
                let itemFont:String = fontMap[kKeyFont],
                let itemName:String = fontMap[kKeyName]
            
            else
            {
                continue
            }
            
            let item:MCreateFontName = mcare
        }
        
        self.fonts = fonts
    }
}
