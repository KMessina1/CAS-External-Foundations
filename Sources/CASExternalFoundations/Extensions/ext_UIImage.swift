/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_UIImage.swift
   Author: Kevin Messina
  Created: Sep 4, 2025
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import UIKit

public extension UIImage {
    func thumbnail(width: CGFloat) -> UIImage? {
        guard size.width > width else { return self }
        let imageSize = CGSize(
            width: width,
            height: CGFloat(ceil(width/size.width * size.height))
        )
        return preparingThumbnail(of: imageSize)
    }
    
    func isImageLandscape(_ image: UIImage) -> Bool {
        return image.size.width > image.size.height
    }
    
    func get(_ name:String) -> UIImage {
        let systemImg: UIImage? = UIImage(systemName: name)
        let fileImg: UIImage? = UIImage(named: name)
        let defaultImg: UIImage? = UIImage(systemName: "photo.badge.exclamationmark")

        if systemImg != nil {
            return systemImg!
        }else if fileImg != nil {
            return fileImg!
        }else if defaultImg != nil {
            return defaultImg!
        }else{
            return UIImage()
        }
    }
}

