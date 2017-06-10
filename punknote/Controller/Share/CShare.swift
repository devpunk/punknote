import UIKit

class CShare:Controller<VShare>
{
    let model:MShare
    let modelHomeItem:MHomeItem
    private let drawingOptions:NSStringDrawingOptions
    private let marginHorizontal2:CGFloat
    private let kMarginHorizontal:CGFloat = 20
    
    init(modelHomeItem:MHomeItem)
    {
        self.modelHomeItem = modelHomeItem
        model = MShare()
        drawingOptions = NSStringDrawingOptions(
            [NSStringDrawingOptions.usesLineFragmentOrigin,
             NSStringDrawingOptions.usesFontLeading])
        marginHorizontal2 = kMarginHorizontal + kMarginHorizontal
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startLoading()
    {
        guard
        
            let view:VShare = self.view as? VShare
        
        else
        {
            return
        }
        
        view.startLoading()
    }
    
    private func frameToImage(
        attributedString:NSAttributedString) -> UIImage?
    {
        let scale:CGFloat = model.currentScale()
        let width:CGFloat = MShare.width
        let height:CGFloat = MShare.height
        let size:CGSize = CGSize(width:width, height:height)
        let imageFrame:CGRect = CGRect(origin:CGPoint.zero, size:size)
        let textUsableWidth:CGFloat = width - marginHorizontal2
        let textMaxSize:CGSize = CGSize(width:textUsableWidth, height:height)
        let textRawFrame:CGRect = attributedString.boundingRect(
            with:textMaxSize,
            options:drawingOptions,
            context:nil)
        let textWidth:CGFloat = ceil(textRawFrame.width)
        let textHeight:CGFloat = ceil(textRawFrame.height)
        let textHeightRemain:CGFloat = height - textHeight
        let textTop:CGFloat = textHeightRemain / 2.0
        let textWidthRemain:CGFloat = width - textWidth
        let textLeft:CGFloat = textWidthRemain / 2.0
        let textFrame:CGRect = CGRect(
            x:textLeft,
            y:textTop,
            width:textWidth,
            height:textHeight)
        
        UIGraphicsBeginImageContextWithOptions(size, true, scale)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            let error:String = NSLocalizedString("CShare_errorContext", comment:"")
            errorSharing(error:error)
            
            return nil
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(imageFrame)
        attributedString.draw(in:textFrame)
        
        guard
            
            let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            let error:String = NSLocalizedString("CShare_errorImage", comment:"")
            errorSharing(error:error)
            
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    private func asyncShareGif()
    {
        
    }
    
    private func asyncSharePng()
    {
        guard
        
            let frames:[DNoteFrame] = modelHomeItem.note.frames?.array as? [DNoteFrame],
            let firstFrameString:String = frames.first?.text
        
        else
        {
            finishSharing()
            
            return
        }
        
        let textAttributes:[String:AnyObject] = [
            NSFontAttributeName:modelHomeItem.font(),
            NSForegroundColorAttributeName:UIColor.black]
        
        let attributedString:NSAttributedString = NSAttributedString(
            string:firstFrameString,
            attributes:textAttributes)
        
        guard
        
            let image:UIImage = frameToImage(attributedString:attributedString)
        
        else
        {
            finishSharing()
            
            return
        }
        
        successShare(image:image)
    }
    
    private func successShare(image:UIImage)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.export(image:image)
            self?.finishSharing()
        }
    }
    
    private func export(image:UIImage)
    {
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[image],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
        }
        
        present(activity, animated:true, completion:nil)
    }
    
    private func errorSharing(error:String)
    {
        VAlert.messageOrange(message:error)
    }
    
    private func finishSharing()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            guard
                
                let view:VShare = self?.view as? VShare
                
            else
            {
                return
            }
            
            view.stopLoading()
        }
    }
    
    //MARK: public
    
    func back()
    {
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    func shareGif()
    {
        startLoading()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in

            self?.asyncShareGif()
        }
    }
    
    func sharePng()
    {
        startLoading()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSharePng()
        }
    }
}
