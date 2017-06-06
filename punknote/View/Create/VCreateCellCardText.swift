import UIKit

class VCreateCellCardText:UITextView
{
    init()
    {
        super.init(frame:CGRect.zero, textContainer:nil)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(model:MCreate)
    {
        let selectedFrame:MCreateFrame = model.selectedFrameModel()
        text = selectedFrame.text
    }
}
