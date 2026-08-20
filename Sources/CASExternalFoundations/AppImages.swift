/*-------------------------------------------------------------------------------------------------------------------------
     File: AppImages.swift
   Author: Kevin Messina
  Created: 11/11/24
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

import Foundation

public typealias SFSymbol = String

// MARK: - *** APP IMAGES ***
/// SF Symbols names for system images in your app.
///
/// This is the basic set of App Images used across many standard apps.
/// To EXTEND this list, add a new section in your code by:
///
///     extension AppImages {
///         static let line = AppImages(rawValue: "line")
///     }
///
/// - Returns: String name of SF Symbol to be used in Image(systemName: xx)
public struct AppImages: RawRepresentable {
    public var rawValue: SFSymbol

    public init(rawValue: SFSymbol) {
        self.rawValue = rawValue
    }
    
    /* App Logo / Launch Screen */
    public 
    
    /* App Logo / Launch Screen */
    static let logo = AppImages(rawValue: "appLogo").rawValue
    
    /* App Generic */
    public 
    
    /* App Generic */
    static let angle = AppImages(rawValue: "angle").rawValue // 􁑡
    public 
    static let about = AppImages(rawValue: "character.book.closed").rawValue // 􀫕
    public 
    static let add = AppImages(rawValue: "plus.app").rawValue // 􀑍
    public 
    static let addressBook = AppImages(rawValue: "character.book.closed.fill").rawValue // 􀫖
    public 
    static let arrow_Left = AppImages(rawValue: "arrowshape.left.fill").rawValue //􁉅
    public 
    static let arrow_Left_Square = AppImages(rawValue: "arrow.left.square.fill").rawValue // 􀄋
    public 
    static let arrow_Right = AppImages(rawValue: "arrowshape.right.fill").rawValue // 􁉃
    public 
    static let arrow_Right_Square = AppImages(rawValue: "arrow.right.square.fill").rawValue // 􀄍
    public 
    static let arrow_Up = AppImages(rawValue: "arrowshape.up.fill").rawValue //􁾩
    public 
    static let arrow_Up_Square = AppImages(rawValue: "arrow.up.square.fill").rawValue //􀄇
    public 
    static let arrow_Down = AppImages(rawValue: "arrowshape.down.fill").rawValue //􁾭
    public 
    static let arrow_Down_Square = AppImages(rawValue: "arrow.down.square.fill").rawValue //􀄉
    public 
    static let backArrow = AppImages(rawValue: "arrow.backward").rawValue // 􀰌
    public 
    static let buildings = AppImages(rawValue: "building.2.fill").rawValue // 􀝓
    public 
    static let building_Store = AppImages(rawValue: "storefront").rawValue // 􁽇
    public 
    static let buy = AppImages(rawValue: "cart.badge.plus").rawValue // 􀍫
    public 
    static let calendar = AppImages(rawValue: "calendar").rawValue // 􀉉
    public 
    static let calendar_Expiring = AppImages(rawValue: "calendar.badge.clock").rawValue //􀧞
    public 
    static let calendar_Expired = AppImages(rawValue: "calendar.badge.exclamationmark").rawValue //􀮝
    public 
    static let camera = AppImages(rawValue: "camera").rawValue //􀌞
    public 
    static let cancel = AppImages(rawValue: "nosign").rawValue //􀍼
    public 
    static let cart = AppImages(rawValue: "cart").rawValue // 􀍩
    public 
    static let checkmark = AppImages(rawValue: "checkmark").rawValue // 􀆅
    public 
    static let checkBox_On = AppImages(rawValue: "checkmark.square").rawValue // 􀃲
    public 
    static let checkBox_Off = AppImages(rawValue: "square").rawValue // 􀂒
    public 
    static let checkBox_X = AppImages(rawValue: "xmark.square").rawValue // 􀃰
    public 
    static let clearAll = AppImages(rawValue: "Clear_All").rawValue //
    public 
    static let close = AppImages(rawValue: "x.circle").rawValue // 􀀲
    public 
    static let contacts = AppImages(rawValue: "person.crop.square.filled.and.at.rectangle").rawValue // 􀦎
    public 
    static let compass = AppImages(rawValue: "safari").rawValue // 􀎬
    public 
    static let contactUs = AppImages(rawValue: "envelope.badge.person.crop").rawValue // 􁷻
    public 
    static let copyright = AppImages(rawValue: "c.circle").rawValue // 􀀈
    public 
    static let critical = AppImages(rawValue: "exclamationmark.octagon.fill").rawValue // 􀘰
    public 
    static let curve = AppImages(rawValue: "beziercurve").rawValue //􀜢
    public 
    static let dashboard = AppImages(rawValue: "doc.richtext").rawValue // 􀉅
    public 
    static let developer = AppImages(rawValue: "person.and.background.striped.horizontal").rawValue // 􁠃
    public 
    static let Disclosure_Rt = AppImages(rawValue: "chevron.right").rawValue // 􀆊
    public 
    static let Disclosure_Lt = AppImages(rawValue: "chevron.left").rawValue // 􀆉
    public 
    static let Disclosure_Up = AppImages(rawValue: "chevron.up").rawValue // 􀆇
    public 
    static let Disclosure_Dn = AppImages(rawValue: "chevron.down").rawValue // 􀆈
    public 
    static let database = AppImages(rawValue: "filemenu.and.selection").rawValue // 􀱢
    public 
    static let docs = AppImages(rawValue: "book.pages").rawValue // 􁜾
    public 
    static let doc_Item = AppImages(rawValue: "doc.richtext").rawValue // 􀉅
    public 
    static let doc_Elipse = AppImages(rawValue: "doc.badge.ellipsis").rawValue // 􀩴
    public 
    static let doc_Question = AppImages(rawValue: "doc.questionmark").rawValue // 􂇲
    public 
    static let doc_Scan = AppImages(rawValue: "document.viewfinder").rawValue //􀎾
    public 
    static let doc_Text = AppImages(rawValue: "doc.text").rawValue // 􀈿
    public 
    static let dollar = AppImages(rawValue: "dollarsign.circle").rawValue // 􀖗
    public 
    static let dollar_Sign = AppImages(rawValue: "dollarsign").rawValue // 􁎢
    public 
    static let edit = AppImages(rawValue: "square.and.pencil").rawValue // 􀈎
    public 
    static let email = AppImages(rawValue: "envelope.fill").rawValue // 􀍖
    public 
    static let entry = AppImages(rawValue: "calendar.badge.clock").rawValue // 􀧞
    public 
    static let expired = AppImages(rawValue: "calendar.badge.exclamationmark").rawValue // 􀮝
    public 
    static let expiring = AppImages(rawValue: "calendar.badge.clock").rawValue // 􀧞
    public 
    static let error = AppImages(rawValue: "exclamationmark.circle.fill").rawValue // 􀁟
    public 
    static let favoriteNo = AppImages(rawValue: "heart").rawValue // 􀊴
    public 
    static let favoriteYes = AppImages(rawValue: "heart.fill").rawValue // 􀊵
    public 
    static let favoriteSlash = AppImages(rawValue: "heart.slash").rawValue // 􀊶
    public 
    static let flowchart = AppImages(rawValue: "flowchart.slash").rawValue // 􀐕
    public 
    static let folder = AppImages(rawValue: "folder").rawValue // 􀈕
    public 
    static let formula = AppImages(rawValue: "x.squareroot").rawValue // 􀓪
    public 
    static let help = AppImages(rawValue: "info.circle").rawValue // 􀅴
    public 
    static let helpBubble = AppImages(rawValue: "info.bubble").rawValue // 􁌴
    public 
    static let helpMenu = AppImages(rawValue: "info.square").rawValue // 􁊇
    public 
    static let hidePassword = AppImages(rawValue: "eye.slash").rawValue // 􀋯
    public 
    static let idCard = AppImages(rawValue: "person.text.rectangle").rawValue // 􀿒
    public 
    static let info = AppImages(rawValue: "info.circle").rawValue // 􀅴
    public 
    static let infoFilled = AppImages(rawValue: "info.triangle.fill").rawValue // 􂹪
    public 
    static let info_i = AppImages(rawValue: "info").rawValue // 􀅳
    public 
    static let inventory = AppImages(rawValue: "archivebox.fill").rawValue // 􀈮
    public 
    static let key = AppImages(rawValue: "key.horizontal.fill").rawValue // 􁠲
    public 
    static let keyboard_Show = AppImages(rawValue: "keyboard").rawValue // 􀇳
    public 
    static let keyboard_Hide = AppImages(rawValue: "keyboard.chevron.compact.down").rawValue // 􀓖
    public 
    static let keyboard_Minus = AppImages(rawValue: "minus.forwardslash.plus").rawValue // 􀅻
    public 
    static let lightbulb_On = AppImages(rawValue: "lightbulb.max.fill").rawValue // 􁷙
    public 
    static let lightbulb_Off = AppImages(rawValue: "lightbulb.slash").rawValue // 􀞃
    public 
    static let link = AppImages(rawValue: "link").rawValue // 􀉣
    public 
    static let list = AppImages(rawValue: "list.bullet.rectangle").rawValue
    public 
    static let location = AppImages(rawValue: "mappin.and.ellipse").rawValue // 􀎫
    public 
    static let map = AppImages(rawValue: "map").rawValue // 􀙊
    public 
    static let math_Minus = AppImages(rawValue: "minus").rawValue // 􀅽
    public 
    static let math_Plus = AppImages(rawValue: "plus").rawValue // 􀅼
    public 
    static let math_Multiply = AppImages(rawValue: "multiply").rawValue // 􀅾
    public 
    static let math_Divide = AppImages(rawValue: "divide").rawValue // 􀅿
    public 
    static let math_SquareRoot = AppImages(rawValue: "squareroot").rawValue // 􂲯
    public 
    static let measure = AppImages(rawValue: "ruler.fill").rawValue // 􀟁
    public 
    static let menu = AppImages(rawValue: "line.3.horizontal").rawValue // 􀌇
    public 
    static let message = AppImages(rawValue: "message").rawValue // 􀌤
    public 
    static let messaging = AppImages(rawValue: "message.fill").rawValue // 􀌥
    public 
    static let mobilePhone = AppImages(rawValue: "candybarphone").rawValue // 􀪳
    public 
    static let noSign = AppImages(rawValue: "nosign").rawValue // 􀍼
    public 
    static let note = AppImages(rawValue: "note").rawValue // 􀧵
    public 
    static let noteText = AppImages(rawValue: "note.text").rawValue // 􀓕
    public 
    static let params = AppImages(rawValue: "rectangle.and.pencil.and.ellipsis").rawValue // 􀈏
    public 
    static let person = AppImages(rawValue: "person.fill").rawValue // 􀉪
    public 
    static let person_Rectangle = AppImages(rawValue: "person.crop.rectangle.stack").rawValue // 􀏻
    public 
    static let phone = AppImages(rawValue: "phone.fill").rawValue // 􀌿
    public 
    static let photo = AppImages(rawValue: "photo").rawValue // 􀏅
    public 
    static let photo_Issue = AppImages(rawValue: "photo.badge.exclamationmark").rawValue // 􂪥
    public 
    static let photo_Stack = AppImages(rawValue: "photo.stack").rawValue // 􀏯
    public 
    static let photos = AppImages(rawValue: "photo.on.rectangle.angled").rawValue // 􀣵
    public 
    static let pointTouch = AppImages(rawValue: "hand.point.up.fill").rawValue // 􀤺
    public 
    static let printer = AppImages(rawValue: "printer").rawValue // 􀎚
    public 
    static let purchase = AppImages(rawValue: "cart").rawValue // 􀍩
    public 
    static let questionMark = AppImages(rawValue: "questionmark").rawValue // ?
    public 
    static let range = AppImages(rawValue: "cellularbars").rawValue // 􀭧
    public 
    static let receipt_none = AppImages(rawValue: "receipt").rawValue //􂷼
    public 
    static let receipt = AppImages(rawValue: "receipt.fill").rawValue //􂷽
    public 
    static let reference = AppImages(rawValue: "books.vertical.fill").rawValue // 􀬓
    public 
    static let refresh = AppImages(rawValue: "arrow.clockwise").rawValue // 􀅈
    public 
    static let reorder = AppImages(rawValue: "arrow.up.and.down.text.horizontal").rawValue // 􀵬
    public 
    static let reorderSave = AppImages(rawValue: "text.badge.checkmark").rawValue // 􀋺
    public 
    static let replace = AppImages(rawValue: "rectangle.2.swap").rawValue // 􁁀
    public 
    static let resize = AppImages(rawValue: "square.resize").rawValue // 􂁟
    public 
    static let resize_Up = AppImages(rawValue: "square.resize.up").rawValue // 􁺟
    public 
    static let resize_Down = AppImages(rawValue: "square.resize.down").rawValue // 􁺠
    public 
    static let rotate_left = AppImages(rawValue: "rotate.left").rawValue // 􀎮
    public 
    static let rotate_right = AppImages(rawValue: "rotate.right").rawValue // 􀎰
    public 
    static let ruler = AppImages(rawValue: "ruler").rawValue // 􀟀
    public 
    static let scan_barcode = AppImages(rawValue: "barcode.viewfinder").rawValue // 􀎺
    public 
    static let scan_camera = AppImages(rawValue: "camera.viewfinder").rawValue // 􀎼
    public 
    static let scan_doc = AppImages(rawValue: "document.viewfinder").rawValue // 􀎾
    public 
    static let scan_docFilled = AppImages(rawValue: "document.viewfinder.fill").rawValue // 􀡢
    public 
    static let scan_dot = AppImages(rawValue: "dot.viewfinder").rawValue // 􁇝
    public 
    static let scan_QRcode = AppImages(rawValue: "qrcode.viewfinder").rawValue // 􀎻
    public 
    static let scanner = AppImages(rawValue: "scanner").rawValue // 􀪊
    public 
    static let search = AppImages(rawValue: "rectangle.and.text.magnifyingglass").rawValue // 􀍟
    public 
    static let sell = AppImages(rawValue: "cart.fill.badge.minus").rawValue // 􀍮
    public 
    static let settings = AppImages(rawValue: "gear").rawValue // 􀍟
    public 
    static let settingsAdj = AppImages(rawValue: "gear.badge.questionmark").rawValue // 􁅨
    public 
    static let share = AppImages(rawValue: "square.and.arrow.up").rawValue // 􀈂
    public 
    static let showPassword = AppImages(rawValue: "eye").rawValue // 􀋭
    public 
    static let sliders = AppImages(rawValue: "slider.horizontal.3").rawValue // 􀌆
    public 
    static let specs = AppImages(rawValue: "list.number").rawValue // 􀋴
    public 
    static let star = AppImages(rawValue: "star").rawValue // 􀋂
    public 
    static let status = AppImages(rawValue: "questionmark.app.dashed").rawValue // 􀿪
    public 
    static let stop = AppImages(rawValue: "exclamationmark.octagon").rawValue // 􀘯
    public 
    static let thumbnail_yes = AppImages(rawValue: "hand.thumbsup.fill").rawValue // 􀞠
    public 
    static let thumbnail_no = AppImages(rawValue: "hand.thumbsup").rawValue // 􀞠
    public 
    static let table = AppImages(rawValue: "tablecells").rawValue // 􀏣
    public 
    static let tableCells = AppImages(rawValue: "tablecells.badge.ellipsis").rawValue // 􀏥
    public 
    static let tip = AppImages(rawValue: "exclamationmark.shield.fill").rawValue // 􀞠
    public 
    static let txtFld_Next = AppImages(rawValue: "dock.arrow.down.rectangle").rawValue // 􀣿
    public 
    static let txtFld_Prev = AppImages(rawValue: "dock.arrow.up.rectangle").rawValue // 􀣾
    public 
    static let txtFld_list = AppImages(rawValue: "list.bullet.rectangle.fill").rawValue // 􀺿
    public 
    static let txtFld_date = AppImages(rawValue: "calendar").rawValue // 􀉉
    public 
    static let txtFld_pay = AppImages(rawValue: "creditcard.fill").rawValue // 􀍰
    public 
    static let txtFld_item = AppImages(rawValue: "puzzlepiece.fill").rawValue // 􀤛
    public 
    static let theme = AppImages(rawValue: "swatchpalette").rawValue // 􁙧
    public 
    static let trash = AppImages(rawValue: "trash").rawValue // 􀈑
    public 
    static let undo = AppImages(rawValue: "arrow.uturn.backward").rawValue // 􀱍
    public 
    static let warning = AppImages(rawValue: "exclamationmark.triangle").rawValue // 􀇾
    public 
    static let warningFilled = AppImages(rawValue: "exclamationmark.triangle.fill").rawValue // 􀇿
    public 
    static let website = AppImages(rawValue: "globe").rawValue // 􀆪
    public 
    static let whatsNew = AppImages(rawValue: "book.circle").rawValue // 􀉜
    public 
    static let xMark_Landscape = AppImages(rawValue: "xmark.rectangle").rawValue // 􀏍
    public 
    static let xMark_Portrait = AppImages(rawValue: "xmark.rectangle.portrait").rawValue // 􀡰
    public 
    static let xMark_Square = AppImages(rawValue: "xmark.app").rawValue // 􀺾
    public 
    static let xMark = AppImages(rawValue: "xmark").rawValue // 􀆄
}
