import UIKit

class CShare:Controller<VShare>
{
    let model:MShare
    let modelHomeItem:MHomeItem
    
    init(modelHomeItem:MHomeItem)
    {
        self.modelHomeItem = modelHomeItem
        model = MShare()
        
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
    
    private func frameToImage(noteFrame:DNoteFrame) -> UIImage?
    {
        let width:CGFloat = MShare.width
        let height:CGFloat = MShare.height
        let imageSize:CGSize = CGSize(width:width, height:height)
        let imageFrame:CGRect = CGRect(origin:CGPoint.zero, size:imageSize)
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
        
        let image:UIImage? = imageWidthData(
            background:background,
            attributedString:attributedString,
            imageSize:imageSize,
            imageFrame:imageFrame,
            textFrame:textFrame)
        
        return image
    }
    
    private func imageWidthData(
        noteFrame:DNoteFrame
        imageSize:CGSize,
        imageFrame:CGRect) -> UIImage?
    {
        let scale:CGFloat = model.currentScale()
        UIGraphicsBeginImageContextWithOptions(imageSize, true, scale)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            let error:String = NSLocalizedString("CShare_errorContext", comment:"")
            VAlert.messageOrange(message:error)
            
            return nil
        }
        
        let shareImage:VShareImage = VShareImage(
            modelHomeItem:modelHomeItem,
            noteFrame:noteFrame)
        shareImage.drawHierarchy(in:imageFrame, afterScreenUpdates:true)
        
        guard
            
            let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            let error:String = NSLocalizedString("CShare_errorImage", comment:"")
            VAlert.messageOrange(message:error)
            
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        return image
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
    
    private func finishSharing()
    {
        guard
            
            let view:VShare = view as? VShare
            
        else
        {
            return
        }
        
        view.stopLoading()
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
    }
    
    func sharePng()
    {
        startLoading()
        
        guard
            
            let frames:[DNoteFrame] = modelHomeItem.note.frames?.array as? [DNoteFrame],
            let firstFrame:DNoteFrame = frames.first
            
        else
        {
            finishSharing()
            
            return
        }
        
        guard
            
            let image:UIImage = frameToImage(noteFrame:firstFrame)
            
        else
        {
            finishSharing()
            
            return
        }
        
        export(image:image)
        finishSharing()
    }
}
