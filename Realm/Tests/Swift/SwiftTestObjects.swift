////////////////////////////////////////////////////////////////////////////
//
// Copyright 2014 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Realm

class SwiftStringObject: RLMObject {
    @objc dynamic var stringCol = ""
}

class SwiftBoolObject: RLMObject {
    @objc dynamic var boolCol = false
}

class SwiftIntObject: RLMObject {
    @objc dynamic var intCol = 0
}

class SwiftLongObject: RLMObject {
    @objc dynamic var longCol: Int64 = 0
}

class SwiftObject: RLMObject {
    @objc dynamic var boolCol = false
    @objc dynamic var intCol = 123
    @objc dynamic var floatCol = 1.23 as Float
    @objc dynamic var doubleCol = 12.3
    @objc dynamic var stringCol = "a"
    @objc dynamic var binaryCol = "a".data(using: String.Encoding.utf8)
    @objc dynamic var dateCol = Date(timeIntervalSince1970: 1)
    @objc dynamic var objectCol = SwiftBoolObject()
    @objc dynamic var arrayCol = RLMArray(objectClassName: SwiftBoolObject.className())
}

class SwiftOptionalObject: RLMObject {
    // FIXME: Support all optional property types
//    @objc dynamic var optBoolCol: Bool?
//    @objc dynamic var optIntCol: Int?
//    @objc dynamic var optFloatCol: Float?
//    @objc dynamic var optDoubleCol: Double?
    @objc dynamic var optStringCol: String?
    @objc dynamic var optNSStringCol: NSString?
    @objc dynamic var optBinaryCol: Data?
    @objc dynamic var optDateCol: Date?
    @objc dynamic var optObjectCol: SwiftBoolObject?
}

class SwiftDogObject: RLMObject {
    @objc dynamic var dogName = ""
}

class SwiftOwnerObject: RLMObject {
    @objc dynamic var name = ""
    @objc dynamic var dog: SwiftDogObject? = SwiftDogObject()
}

class SwiftAggregateObject: RLMObject {
    @objc dynamic var intCol = 0
    @objc dynamic var floatCol = 0 as Float
    @objc dynamic var doubleCol = 0.0
    @objc dynamic var boolCol = false
    @objc dynamic var dateCol = Date()
}

class SwiftAllIntSizesObject: RLMObject {
    @objc dynamic var int8  : Int8  = 0
    @objc dynamic var int16 : Int16 = 0
    @objc dynamic var int32 : Int32 = 0
    @objc dynamic var int64 : Int64 = 0
}

class SwiftEmployeeObject: RLMObject {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var hired = false
}

class SwiftCompanyObject: RLMObject {
    @objc dynamic var employees = RLMArray(objectClassName: SwiftEmployeeObject.className())
}

class SwiftArrayPropertyObject: RLMObject {
    @objc dynamic var name = ""
    @objc dynamic var array = RLMArray(objectClassName: SwiftStringObject.className())
    @objc dynamic var intArray = RLMArray(objectClassName: SwiftIntObject.className())
}

class SwiftDynamicObject: RLMObject {
    @objc dynamic var stringCol = "a"
    @objc dynamic var intCol = 0
}

class SwiftUTF8Object: RLMObject {
    @objc dynamic var 柱колоéнǢкƱаم👍 = "值значен™👍☞⎠‱௹♣︎☐▼❒∑⨌⧭иеمرحبا"
}

class SwiftIgnoredPropertiesObject: RLMObject {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var runtimeProperty: AnyObject?
    @objc dynamic var readOnlyProperty: Int { return 0 }

    override class func ignoredProperties() -> [String]? {
        return ["runtimeProperty"]
    }
}

class SwiftPrimaryStringObject: RLMObject {
    @objc dynamic var stringCol = ""
    @objc dynamic var intCol = 0

    override class func primaryKey() -> String {
        return "stringCol"
    }
}

class SwiftLinkSourceObject: RLMObject {
    @objc dynamic var id = 0
    @objc dynamic var link: SwiftLinkTargetObject?
}

class SwiftLinkTargetObject: RLMObject {
    @objc dynamic var id = 0
    @objc dynamic var backlinks: RLMLinkingObjects<SwiftLinkSourceObject>?

    override class func linkingObjectsProperties() -> [String : RLMPropertyDescriptor] {
        return ["backlinks": RLMPropertyDescriptor(with: SwiftLinkSourceObject.self, propertyName: "link")]
    }
}

class SwiftLazyVarObject : RLMObject {
    @objc dynamic lazy var lazyProperty : String = "hello world"
}

class SwiftIgnoredLazyVarObject : RLMObject {
    @objc dynamic var id = 0
    @objc dynamic lazy var ignoredVar : String = "hello world"
    override class func ignoredProperties() -> [String] { return ["ignoredVar"] }
}

class SwiftObjectiveCTypesObject: RLMObject {
    @objc dynamic var stringCol: NSString?
    @objc dynamic var dateCol: NSDate?
    @objc dynamic var dataCol: NSData?
    @objc dynamic var numCol: NSNumber? = 0
}
