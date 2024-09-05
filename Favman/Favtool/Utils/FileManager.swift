//
//  FileManager.swift
//  Favtool
//
//  Created by Nicola Di Gregorio on 16/11/22.
//

import Foundation
import AppKit

//partial Paths
var library = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
var imagePath = "Safari/Touch Icons Cache/Images/"
var touchIconPath = "Safari/Touch Icons Cache/"

var dbPath =  "Safari/Touch Icons Cache/TouchIconCacheSettings.db"
var readingList = "Safari/ReadingListArchives"

//Paths
var imageFolder = library.first?.appendingPathComponent(imagePath)
var touchIconFolder = library.first?.appendingPathComponent(touchIconPath);
var touchIconCacheSettings = library.first?.appendingPathComponent(dbPath)
var readingListFolder = library.first?.appendingPathComponent(readingList)
var safari = library.first?.appendingPathComponent("Safari")

func showSavePanel(path: URL) {
    let openPanel = NSOpenPanel()
    openPanel.title = "authorize image access"
    openPanel.directoryURL = path
    openPanel.canChooseDirectories = true
    openPanel.message = ""
    openPanel.prompt = "Authorize"
    openPanel.title = "Authorize access to file"
    openPanel.showsTagField = false
    openPanel.runModal()
}

func copyImage (_ from : URL, for site : Site) {
    let fileManager = FileManager.default
    let destination = imageFolder!.appendingPathComponent(site.md5 + ".png");
    do{
        try? fileManager.removeItem(at: destination);
        try fileManager.copyItem(at: from, to: destination);
        NSSound.blow?.play()
    } catch {
        print("error copying file");
        NSSound.basso?.play()
    }
}


func ImageFolderIsLocked (_ state : Bool) -> String{
    do {
        try FileManager()
            .setAttributes([FileAttributeKey.immutable: state], ofItemAtPath: imageFolder!.path)
    } catch {
        print(error)
        NSSound.basso?.play()
        return error.localizedDescription
    }
    return "table not reday, make sure safari is opened on the homepage"
}


func touchFolderIsLocked (_ state : Bool) -> String{
    do {
        try FileManager()
            .setAttributes([FileAttributeKey.immutable: state], ofItemAtPath: touchIconFolder!.path)
    } catch {
        print(error)
        NSSound.basso?.play()
        return error.localizedDescription
    }
    return "table not reday, make sure safari is opened on the homepage"
}

func createFolder (path: URL){
    do {
        try FileManager.default.createDirectory(atPath: path.absoluteString, withIntermediateDirectories: true, attributes: nil)
    } catch {
        print(error)
    }
}


func removeItems (path: URL){
    do {
        try FileManager().removeItem(at: path)
    } catch {
        print(error)
    }
}
