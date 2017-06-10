import UIKit
import ImageIO
import MobileCoreServices

class CShare:Controller<VShare>
{
    let model:MShare
    let modelHomeItem:MHomeItem
    private let kFilenameGif:String = "punky.gif"
    private let kFilenamePng:String = "punky.png"
    private let kLoopCount:Int = 0
    
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
    
    private func loadImages() -> [MShareImage]
    {
        var images:[MShareImage] = []
        
        guard
        
            let frames:[DNoteFrame] = modelHomeItem.note.frames?.array as? [DNoteFrame]
        
        else
        {
            return images
        }
        
        for frame:DNoteFrame in frames
        {
            guard
            
                let image:UIImage = frameToImage(noteFrame:frame)
            
            else
            {
                continue
            }
            
            let model:MShareImage = MShareImage(image:image, duration:frame.duration)
            images.append(model)
        }
        
        return images
    }
    
    private func animateGif(images:[MShareImage]) -> URL?
    {
        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(kFilenameGif)
        let totalImages:Int = images.count
        
        guard
            
            let destination:CGImageDestination = CGImageDestinationCreateWithURL(
                fileUrl as CFURL,
                kUTTypeGIF,
                totalImages,
                nil)
            
        else
        {
            let error:String = NSLocalizedString("CShare_errorGif", comment:"")
            VAlert.messageOrange(message:error)
            
            return nil
        }
        
        let destinationPropertiesRaw:[String:Any] = [
            kCGImagePropertyGIFDictionary as String:[
                kCGImagePropertyGIFLoopCount as String:kLoopCount]]
        let destinationProperties:CFDictionary = destinationPropertiesRaw as CFDictionary
        
        CGImageDestinationSetProperties(
            destination,
            destinationProperties)
        
        for image:MShareImage in images
        {
            guard
                
                let cgImage:CGImage = image.image.cgImage
                
            else
            {
                continue
            }
            
            let gifPropertiesRaw:[String:Any] = [
                kCGImagePropertyGIFDictionary as String:[
                    kCGImagePropertyGIFDelayTime as String:image.duration]]
            let gifProperties:CFDictionary = gifPropertiesRaw as CFDictionary
            
            CGImageDestinationAddImage(
                destination,
                cgImage,
                gifProperties)
        }
        
        CGImageDestinationFinalize(destination)
        
        return fileUrl
    }
    
    private func frameToImage(noteFrame:DNoteFrame) -> UIImage?
    {
        let width:CGFloat = MShare.width
        let height:CGFloat = MShare.height
        let imageSize:CGSize = CGSize(width:width, height:height)
        let imageFrame:CGRect = CGRect(origin:CGPoint.zero, size:imageSize)
        
        let image:UIImage? = imageWidthData(
            noteFrame:noteFrame,
            imageSize:imageSize,
            imageFrame:imageFrame)
        
        return image
    }
    
    private func imageWidthData(
        noteFrame:DNoteFrame,
        imageSize:CGSize,
        imageFrame:CGRect) -> UIImage?
    {
        let scale:CGFloat = model.currentScale()
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
        
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
    
    private func export(url:URL)
    {
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[url],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
        }
        
        present(activity, animated:true, completion:nil)
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
        let images:[MShareImage] = loadImages()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
         
            guard
            
                let fileUrl:URL = self?.animateGif(images:images)
            
            else
            {
                self?.finishSharing()
                
                return
            }
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.export(url:fileUrl)
                self?.finishSharing()
            }
        }
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

        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(kFilenamePng)
        
        guard
            
            let data:Data = UIImagePNGRepresentation(image)
        
        else
        {
            finishSharing()
            
            return
        }
        
        do
        {
            try data.write(to:fileUrl, options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            finishSharing()
            
            return
        }
        
        export(url:fileUrl)
        finishSharing()
    }
}
