/*-------------------------------------------------------------------------------------------------------------------------
     File: lib_SwiftPrint.swift
   Author: Kevin Messina
  Created: 8/20/26
 Modified: 08/20/2026 08:04 PM EDT
  Version: 2
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.

©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import SwiftUI
import CASExternalFoundations

/// Alias to logFileFunctionLine() function that returns the location of the place in your code that the call was made from.
/// - Parameters:
///   - fileName: Filename that the function is in
///   - functionName: Function name that was called
///   - lineNumber: Line# function called from
///   - columnNumber: Col# within the Line# function called from
/// - Returns: ex: └──➤ Called by GRDB-Setup.swift - copydb.Queue() at line# 70 [col#: 122]
public func LFFL(fileName: String = #filePath,functionName: String = #function,lineNumber: Int = #line,columnNumber: Int = #column) -> String {
    return logFileFunctionLine(fileName: fileName,functionName: functionName,lineNumber: lineNumber,columnNumber: columnNumber)
}

public func logFileFunctionLine(fileName: String = #filePath,functionName: String = #function,lineNumber: Int = #line,columnNumber: Int = #column) -> String {
    return "\n└──➤ Called by \(URL(fileURLWithPath: fileName).lastPathComponent) - \(functionName) @ line# \(lineNumber) [col#: \(columnNumber)]"
}

public final class SimPrint {
    public enum DisplayType { case all,errorsOnly }
    public static var displayType: DisplayType = .all

    public enum Types { case
        //General
        info,noPrefix,
        //Status
        success,warning,error,failed,
        //Details
        detail,detail_1,detail_2,
        //API
        API,API_Weather,API_Location,API_GeoLocation,
        //Files
        folder,document,photo,
        //Data
        database,record,recordSaved,recordDeleted,recordUpdated,recordDetail,recordFetch,
        //Text Messaging
        txtMsg_NoSubject,txtMsg_NoAttachment,
        //Appear/Disappear of views
        viewAppear,viewDisappear,
        //Archiving Functions
        zipArchive,unZipArchive
    }

    public enum Subject { case
        //General
        none,
        //Function
        calculation,UI,
        //Database
        dbFunction,
        //API
        API,API_Weather,API_Location,API_GeoLocation
    }

//    public enum DBType { case success,warning,error,info,skipped }
//
//    public enum DBAction:String {
//        case fetchAll = "FetchAll"
//        case fetchOne = "FetchOne"
//        case fetchCount = "FetchCount"
//        case update = "Update"
//        case delete = "Delete"
//        case alreadyExists = "AlreadyExists"
//        case insert = "Insert"
//        case upsert = "Upsert"
//        case migrate = "Migrate"
//        case cloudRead = "cloud: Read"
//        case cloudWrite = "cloud: Write"
//        case cloudDelete = "cloud: Delete"
//    }
//
//    public enum DBMigrationAction:String {
//        case insert = "Insert"
//        case upsert = "Upsert"
//        case alter = "Alter"
//        case delete = "Delete"
//        case drop = "Drop"
//        case create = "Create"
//        case rename = "Rename"
//        case add = "Add"
//        case copy = "Copy"
//        case update = "Update"
//        case exists = "Exists"
//        case migration = "Migration"
//        case replace = "Replace"
//        case skip = "Skip"
//    }
//
//    public enum DBMigrationItem:String {
//        case table = "Table"
//        case record = "Record"
//        case column = "Columns"
//        case none = ""
//    }
//
//    public enum DBMigrationIssues:String {
//        case duplicate = "Duplicate (Already exists)"
//        case exists = "Exists as named"
//        case notFound = "Not Found"
//        case none = ""
//        case error = "Error"
//    }

    private init() {}

    public static func Details(errorMsg:String = "",file:String = #file,function:String = #function,line:Int = #line,col:Int = #column) -> String {
        var txt:String = "\n└─➤Called by:"

        if !file.isEmpty {
            let fileName:String = URL(fileURLWithPath: file).lastPathComponent
            txt.append("\n└──➤🗂FILENAME: \( fileName ) ")
        }

        if !function.isEmpty {
            txt.append("🔠FUNCTION: \( function ) ")
        }

        if (line >= 0) {
            txt.append("\n└──➤#️⃣COLUMN#: \( col ) " )
        }

        if (col >= 0) {
            txt.append("\n└──➤#️⃣LINE#: \( line ) " )
        }


        if !errorMsg.isEmpty {
            txt.append("\n└──➤❌ERROR: \( errorMsg )")
        }

        return txt
    }

    public static func Info(
        _ msg:String,
        action:Types,
        subType:Subject = .none,
        errorMsg:String = "",
        file:String = "",
        function:String = "",
        line:Int = -1,
        log:String,
        LF_Start:Bool = false,
        LF_End:Bool = false,
        forceShow:Bool = false
    ) {
        if !(
            deviceIs.Sim ||
            (deviceIs.Phone && displayType == .all) ||
            deviceIs.CanvasPreview ||
            forceShow == true
        ) {
            return
        }

        if (
            displayType != .all &&
            action != .error &&
            forceShow == false
        ) {
            return
        }

        var txt:String = ""

        if LF_Start {
            txt = "\n\n"
        }

        switch action {
            case .API: txt.append("🛜")
            case .API_Weather: txt.append("🛜🌦️")
            case .API_Location: txt.append("🛜🧭")
            case .API_GeoLocation: txt.append("🛜🏠")
            case .info: txt.append("ℹ️")
            case .detail: txt.append("🔤")
            case .detail_1: txt.append("└──➤ ")
            case .detail_2: txt.append("└─────➤ ")
            case .success: txt.append("ℹ️✅")
            case .warning: txt.append("ℹ️⚠️")
            case .error: txt.append("ℹ️‼️")
            case .failed: txt.append("ℹ️‼️")
            case .folder: txt.append("📂 ")
            case .document: txt.append("📝")
            case .photo: txt.append("🏞️")
            case .noPrefix: txt = ""
            case .database: txt.append("🗄️")
            case .record: txt.append("💿")
            case .recordDetail: txt.append("└──➤ 💿")
            case .recordFetch: txt.append("🗄️➤💿")
            case .recordSaved,.recordUpdated: txt.append("💿✅")
            case .recordDeleted: txt.append("💿❌")
            case .txtMsg_NoSubject,.txtMsg_NoAttachment: txt.append("💬❌")
            case .viewAppear: txt.append("📲✅")
            case .viewDisappear: txt.append("📲❌")
            case .zipArchive: txt.append("🗄️⇲")
            case .unZipArchive: txt.append("🗄️⇱")
        }

        switch subType {
            case .none: break
            case .calculation: txt.append("🧮")
            case .dbFunction: txt.append("🗃️")
            case .UI: txt.append("🎨")
            case .API_Weather: txt.append("🛜🌦️")
            case .API_Location: txt.append("🛜🧭")
            case .API_GeoLocation: txt.append("🛜🏠")
            case .API: txt.append("🛜🌐")
        }

        switch action {
            case .error:
                txt.append(msg.isEmpty ?"\(errorMsg)\(log)" :"\(msg) (\(errorMsg)) \(log)")
            default:
                txt.append("\(msg)\(log)")
        }

        if LF_End {
            txt.append("\n")
        }

        print(txt)
    }
  }
