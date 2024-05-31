//
//  NewTask.swift
//  Test App
//
//  Created by Sudeepa Pal on 31/05/24.
//

import Foundation
import RealmSwift

class NewTask: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var selectedDate: String = ""
    @objc dynamic var textFieldView: String = ""
    @objc dynamic var startTime: String = "--"
    @objc dynamic var endTime: String = "--"
}
