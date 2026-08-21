/*-------------------------------------------------------------------------------------------------------------------------
     File: lib_Files.swift
   Author: Kevin Messina
  Created: 7/1/23
 Modified: 08/20/2026 08:04 PM EDT
  Version: 3
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation

// MARK: - *** FILES ***
public struct Files {
    public init() {}

    public enum directories:Int { case docsDir,libDir,cacheDir,bundleDir,custom,tempDir,provenanceDir,inventoryDir,sessionsDir,reportsDir }
    public enum primeDirectories:Int { case docsDir,libDir,cacheDir }
    public enum fileExtensions:Int { case all,jpg,jpeg,mp3,mp4,png,db,doc,csv,tsv,txt,avi,mov,pdf }

    /// Return the PATH string for Directory
    public struct dir {
        public 
        static let documents:String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path
        public 
        static let library:String = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.path
        public 
        static let cache:String = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.path
        public 
        static let temp:String = FileManager.default.temporaryDirectory.path()
        public 
        static let provenance:String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent("Provenance").path()
        public 
        static let inventory:String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent("Inventory").path()
        public 
        static let sessions:String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent("Sessions").path()
        public 
        static let reports:String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent("Reports").path()
    }
    
    /// Return the URL string for Directory
    public func getPathURL(in directory:directories) -> URL {
        switch directory {
            case .docsDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            case .libDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            case .cacheDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            case .tempDir: return FileManager.default.temporaryDirectory
            case .bundleDir: return Bundle.main.bundleURL
            case .provenanceDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    .appendingPathComponent("Provenance")
            case .inventoryDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    .appendingPathComponent("Inventory")
            case .sessionsDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    .appendingPathComponent("Sessions")
            case .reportsDir: return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    .appendingPathComponent("Reports")
            case .custom: return URL(fileURLWithPath: "")
        }
    }
    
    public func getPathForFilename(_ fileName:String,in directory:directories,path:String? = "") -> (url:URL,path:String) {
        var documentsURL:URL
        
        if directory == .custom && !path!.isEmpty {
            documentsURL = URL(string: path!)!
        }else{
            documentsURL = getPathURL(in: directory)
        }
        
        if !fileName.isEmpty {
            documentsURL = documentsURL.appendingPathComponent(fileName)
        }
        
        return (documentsURL,documentsURL.path)
    }
    
    public func exists(atPath: String) -> Bool {
        return FileManager.default.fileExists(atPath: atPath)
    }
    
    public func exists(filename:String?=nil,in directory:directories) -> Bool {
        guard
            filename != nil,
            !filename!.isEmpty
        else {
            return false
        }
        
        let documentsURL:URL = getPathURL(in: directory).appendingPathComponent(filename!)

        return FileManager.default.fileExists(atPath: documentsURL.path)
    }
    
    @discardableResult  public func copyFromBundle(fileName:String, to:directories) -> Bool {
        let FM = FileManager.default
        let fromURL = Bundle.main.bundleURL.appendingPathComponent(fileName)
        
        var toURL:URL = getPathURL(in: to)
        toURL = toURL.appendingPathComponent(fileName)

        var fileExists: Bool = false

        if !Files().exists(filename: fileName, in: to) {
            do {
                try FM.copyItem(atPath: fromURL.path, toPath: toURL.path)
                SimPrint.Info("\(fileName.uppercased()) copied from bundle to \(to) directory.",action: .success,log: LFFL())
            } catch {
                SimPrint.Info("\( fileName.uppercased() ) could not be copied from bundle to \( to ) directory.",
                         action: .error,
                         errorMsg:error.localizedDescription,
                         log: LFFL()
                )
            }

            fileExists = FM.fileExists(atPath: toURL.path)
        }
        
        return fileExists
    }

    public func returnPathForFilename(_ filename:String, in directory:directories) -> (url:URL,path:String) {
        var fileURL:URL = getPathURL(in: directory)
        
        if !filename.isEmpty {
            fileURL = fileURL.appendingPathComponent(filename)
        }
        
        return (url: fileURL, path: fileURL.path())
    }
    
    @discardableResult  public func moveOrRename(fromName:String, fromDir: directories, toName:String, in toDir:directories) -> Bool {
        let FM = FileManager.default
        var fromURL:URL = getPathURL(in: fromDir)
        var toURL:URL = getPathURL(in: toDir)
        
        if !fromName.isEmpty {
            fromURL = fromURL.appendingPathComponent(fromName)
        }
        
        if !toName.isEmpty {
            toURL = toURL.appendingPathComponent(toName)
        }
        
        do {
            try FM.moveItem(at: fromURL, to: toURL)
        } catch let error as NSError {
            SimPrint.Info(
                "File could not be renamed/moved from \( fromURL.absoluteString ) to \( toURL.absoluteString ).",
                action: .error,
                errorMsg:error.localizedDescription,
                log: LFFL()
            )
        }
        
        let fileExists = FM.fileExists(atPath: toURL.path)
        return fileExists
    }

    public func getFileType(forExtension: Files.fileExtensions) -> String {
        switch fileExtensions(rawValue: forExtension.rawValue) {
            case .all: return "ALL"
            case .avi: return "avi"
            case .csv: return "csv"
            case .db: return "db"
            case .doc: return "doc"
            case .jpeg: return "jpeg"
            case .jpg: return "jpg"
            case .mov: return "mov"
            case .mp3: return "mp3"
            case .mp4: return "mp4"
            case .pdf: return "pdf"
            case .png: return "png"
            case .tsv: return "tsv"
            case .txt: return "txt"
            case .none: return ""
        }
    }
    
    public func deleteAllFiles(in dir:directories) {
        let documentsUrl = Files().getPathURL(in: dir)
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(
                at: documentsUrl,
                includingPropertiesForKeys: nil,
                options: .skipsHiddenFiles
            )
            
            for fileURL in fileURLs {
                try FileManager.default.removeItem(at: fileURL)
            }
        } catch  {
            print(error)
        }
    }

    public func deleteAllFilesOfType(ext: Files.fileExtensions,in dir:directories) {
        let documentsUrl = Files().getPathURL(in: dir)
        let ofType: String = getFileType(forExtension: ext)
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(
                at: documentsUrl,
                includingPropertiesForKeys: nil,
                options: .skipsHiddenFiles
            )
            
            for fileURL in fileURLs where fileURL.pathExtension == ofType {
                try FileManager.default.removeItem(at: fileURL)
            }
        } catch  {
            print(error)
        }
    }
    
    @discardableResult  public func delete(fileName:String?=nil,in directory:directories) -> Bool {
        var documentsURL:URL = getPathURL(in: directory)
        if fileName != nil { documentsURL = documentsURL.appendingPathComponent(fileName!) }
        
        do {
            try FileManager.default.removeItem(atPath: documentsURL.path)
            SimPrint.Info("\( fileName?.uppercased() ?? "file" ) deleted from \( directory ) directory.",action: .success, log: LFFL())
            return true
        } catch {
            SimPrint.Info("\( fileName?.uppercased() ?? "file" ) could not be deleted from \( directory ) directory.",action: .error, errorMsg:error.localizedDescription, log: LFFL())
            return false
        }
    }
    
    public func renameFileURL(oldFileName: String, newFileName: String, in directory:directories) {
        let FM = FileManager.default
        let folderURL:URL = getPathURL(in: directory)
        
        let oldFileURL = folderURL.appendingPathComponent(oldFileName)
        let newFileURL = folderURL.appendingPathComponent(newFileName)
        
        do {
            // Attempt to move (rename) the file
            try FM.moveItem(at: oldFileURL, to: newFileURL)
            print("File '\(oldFileName)' successfully renamed to '\(newFileName)'.")
        } catch {
            print("Error renaming file: \(error.localizedDescription)")
        }
    }

    public func copyFileURLToDirectory(fileURL: URL, newFilename: String, in directory:directories) {
        guard fileURL.startAccessingSecurityScopedResource() else {
            print("Failed to start accessing security-scoped resource")
            return
        }
        
        defer {
            fileURL.stopAccessingSecurityScopedResource()
        }
        
        do {
            let filename = fileURL.lastPathComponent
            let destinationURL = getPathForFilename(filename, in: directory).url

            // Remove existing file if present to avoid errors during copy
            if Files().exists(filename: filename, in: directory) {
                Files().delete(fileName: filename, in: directory)
            }

            try FileManager.default.copyItem(at: fileURL, to: destinationURL)
            
            print("File copied to: \(destinationURL.path)")
            // You can now safely access the copied file from destinationURL
        } catch {
            print("Error copying file: \(error.localizedDescription)")
        }
    }
    
    @discardableResult  public func createDirectory(folderName:String,in directory:directories) -> Bool {
        let folderURL = getPathURL(in: directory).appendingPathComponent(folderName)
        
        if !Files().exists(filename: "/"+folderName, in: directory) {
            do {
                try FileManager.default.createDirectory(atPath: folderURL.path, withIntermediateDirectories: true, attributes: nil)
                
                let results = Files().exists(filename: "/"+folderName, in: directory)
                SimPrint.Info("\( folderName.uppercased()) created in documents directory.",action: .success, log: LFFL())
                
                return results
            } catch {
                SimPrint.Info("\( folderName.uppercased() ) could not be created in documents directory.",action: .error, errorMsg:error.localizedDescription, log: LFFL())
                fatalError("Couldn't create the \( folderName.uppercased() ) folder in documents directory.")
            }
        }
        
        return false
    }
    
    public func returnContentsOfDirectoryAt(path: String) -> [String] {
        do {
            return try FileManager.default.contentsOfDirectory(atPath: path)
        } catch {
            SimPrint.Info("\( path.uppercased() ) could not send contents in directory.",action: .error, errorMsg:error.localizedDescription, log: LFFL())
            return []
        }
    }
    
    public func returnContentsOf(directory: primeDirectories) -> [String] {
        var directoryPath = ""
        
        switch directory {
            case .libDir: directoryPath = getPathURL(in: .libDir).path()
            case .cacheDir: directoryPath = getPathURL(in: .cacheDir).path()
            case .docsDir: directoryPath = getPathURL(in: .docsDir).path()
        }

        do {
            return try FileManager.default.contentsOfDirectory(atPath: directoryPath)
        } catch {
            SimPrint.Info("\( directoryPath.uppercased() ) could not send contents in directory.",action: .error, errorMsg:error.localizedDescription, log: LFFL())
            return []
        }
    }
    
    public func returnContentsOfDirectoryOfType(ext: Files.fileExtensions,in dir:directories) -> (filenames: [String], count:Int) {
        let documentsUrl = Files().getPathURL(in: dir)
        let ofType: String = getFileType(forExtension: ext)
        var filenames: [String] = []
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(
                at: documentsUrl,
                includingPropertiesForKeys: nil,
                options: .skipsHiddenFiles
            )
            
            for fileURL in fileURLs where fileURL.pathExtension == ofType {
                filenames.append(fileURL.path)
            }
        } catch  {
            SimPrint.Info("\( documentsUrl.path.uppercased() ) could not send contents in directory.",action: .error, errorMsg:error.localizedDescription, log: LFFL())
        }
        
        return (filenames: filenames, count: filenames.count)
    }
    
    /// Returns the attributes of a file
    /// - Parameters:
    ///   - filename: String filename
    ///   - in: directory preset
    ///
    /// - Usage: let attribs = Files().getFileAttribs(filename: Databases.primaryDB.fullFilename, in: .docsDir)
    ///          let created = attribs[FileAttributeKey.creationDate] ?? "N/A"
    ///
    /// Common Attributes
    ///   NSFileSize: The size of the file in bytes.
    ///   NSFileCreationDate: The date the file was created.
    ///   NSFileModificationDate: The date the file was last modified.
    ///   NSFileType: The type of the file (e.g., regular file, directory, symbolic link).
    ///   NSFileOwnerAccountName: The name of the file’s owner.
    ///   NSFileGroupOwnerAccountName: The name of the file’s group owner.
    ///   NSFilePosixPermissions: The POSIX permissions of the file.
    public func getFileAttribs(filename: String, in dir: directories) -> [FileAttributeKey: Any] {
        var fileAttributes: [FileAttributeKey: Any] = [:]
        let documentsPath = Files().getPathForFilename(filename, in: dir).path

        do {
            fileAttributes = try FileManager.default.attributesOfItem(atPath: documentsPath)
            print("File attributes: \(fileAttributes)")
            print(fileAttributes[FileAttributeKey.creationDate] ?? "N/A")
            print(fileAttributes[FileAttributeKey.modificationDate] ?? "N/A")
            print(fileAttributes[FileAttributeKey.size] ?? "N/A")
        } catch {
            print("Failed to retrieve attributes: \(error.localizedDescription)")
        }
        
        return fileAttributes
    }
}
