import Foundation

class MCreateFont
{
    let fonts:[MCreateFontItem]
    private let kResourceName:String = "ResourceFonts"
    private let kResourceExtension:String = "plist"
    private let kKeyName:String = "name"
    private let kKeyFont:String = "font"
    
    init()
    {
        var fonts:[MCreateFontItem] = []
        
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
                let itemName:String = fontMap[kKeyName],
                let itemFont:String = fontMap[kKeyFont]
            
            else
            {
                continue
            }
            
            let item:MCreateFontItem = MCreateFontItem(
                displayName:itemName,
                fontName:itemFont)
            
            fonts.append(item)
        }
        
        fonts.sort
        { (itemA:MCreateFontItem, itemB:MCreateFontItem) -> Bool in
            
            let comparisonResult:ComparisonResult = itemA.displayName.compare(itemB.displayName)
            
            switch comparisonResult
            {
            case ComparisonResult.orderedAscending,
                 ComparisonResult.orderedSame:
                
                return true
                
            case ComparisonResult.orderedDescending:
                
                return false
            }
        }
        
        self.fonts = fonts
    }
}
