import UIKit

class VCreateCellCardText:UITextView, UITextViewDelegate
{
    private let drawingOptions:NSStringDrawingOptions
    private let insetsHorizontal3:CGFloat
    private let kInsetsHorizontal:CGFloat = 30
    
    init()
    {
        let color:UIColor = UIColor.white
        insetsHorizontal3 = kInsetsHorizontal + kInsetsHorizontal + kInsetsHorizontal
        drawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesLineFragmentOrigin,
            NSStringDrawingOptions.usesFontLeading])
        
        super.init(frame:CGRect.zero, textContainer:nil)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        textColor = color
        tintColor = color
        textAlignment = NSTextAlignment.center
        delegate = self
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        updateInsets()
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func updateInsets()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let usableWidth:CGFloat = width - insetsHorizontal3
        let usableHeight:CGFloat = height
        let usableSize:CGSize = CGSize(width:usableWidth, height:usableHeight)
        let boundingRect:CGRect = attributedText.boundingRect(
            with:usableSize,
            options:drawingOptions,
            context:nil)
        let textHeight:CGFloat = ceil(boundingRect.maxY)
        var insetsTop:CGFloat = (usableHeight - textHeight) / 2.0
        
        if insetsTop < 0
        {
            insetsTop = 0
        }
        
        textContainerInset = UIEdgeInsets(
            top:insetsTop,
            left:kInsetsHorizontal,
            bottom:0,
            right:kInsetsHorizontal)
    }
    
    //MARK: public
    
    func config(model:MCreate)
    {
        let selectedFrame:MCreateFrame = model.selectedFrameModel()
        text = selectedFrame.text
        font = model.font.selectedFontObject()
        updateInsets()
    }
    
    //MARK: textView delegate
    
    func textViewDidChange(_ textView:UITextView)
    {
        updateInsets()
    }
}
