
import Foundation
//
//  Model.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import Foundation


//MARK: - Welcome
struct News: Codable {

    let relatedTopics: [RelatedTopic]
    let results: [ResultURL] //Se agrego URL


    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
        case results = "Results"
 
    }
}

// MARK: - Infobox
struct Infobox: Codable {
    let content: [Content]
    let meta: [MetaElement]
    
    enum CodingKeys: String, CodingKey {
            case content, meta
        }
    
}

// MARK: - Content
struct Content: Codable {
    
    let dataType, label: String?
    let value: ValueUnion?//
    let wikiOrder: WikiOrder?//

    enum CodingKeys: String, CodingKey {
        case dataType = "data_type"
        case label, value
        case wikiOrder = "wiki_order"
    }
}

enum ValueUnion: Codable {
    case string(String?) //?
    case stringArray([String?]) //?
    case valueClass(ValueClass?) //?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(ValueClass.self) {
            self = .valueClass(x)
            return
        }
        throw DecodingError.typeMismatch(ValueUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        case .valueClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - ValueClass
struct ValueClass: Codable, Hashable  {
    let entityType, id: String?
    let numericID: Int?

    enum CodingKeys: String, CodingKey {
        case entityType = "entity-type"
        case id
        case numericID = "numeric-id"
    }
}

enum WikiOrder: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(WikiOrder.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for WikiOrder"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - MetaElement
struct MetaElement: Codable, Hashable  {
    let dataType, label, value: String

    enum CodingKeys: String, CodingKey {
        case dataType = "data_type"
        case label, value
    }
}

// MARK: - WelcomeMeta
struct WelcomeMeta: Codable {
    let attribution, blockgroup, createdDate: String?
    let description: String?
    let designer, devDate: String?
    let devMilestone: String?
    let developer: [Developer]
    let exampleQuery, id: String
    let isStackexchange: String?
    let jsCallbackName: String
    let liveDate: String?
    let maintainer: Maintainer
    let name, perlModule: String
    let producer: String? //
    let productionState, repo, signalFrom, srcDomain: String
    let srcID: Int
    let srcName: String
    let srcOptions: SrcOptions
    let srcURL: String?
    let status, tab: String?
    let topic: [String]
    let unsafe: Int

    enum CodingKeys: String, CodingKey {
        case attribution, blockgroup
        case createdDate = "created_date"
        case description, designer
        case devDate = "dev_date"
        case devMilestone = "dev_milestone"
        case developer
        case exampleQuery = "example_query"
        case id
        case isStackexchange = "is_stackexchange"
        case jsCallbackName = "js_callback_name"
        case liveDate = "live_date"
        case maintainer, name
        case perlModule = "perl_module"
        case producer
        case productionState = "production_state"
        case repo
        case signalFrom = "signal_from"
        case srcDomain = "src_domain"
        case srcID = "src_id"
        case srcName = "src_name"
        case srcOptions = "src_options"
        case srcURL = "src_url"
        case status, tab, topic, unsafe
    }
}

// MARK: - Developer
struct Developer: Codable, Hashable  {
    let name, type: String
    let url: String
}

// MARK: - Maintainer
struct Maintainer: Codable, Hashable  {
    let github: String
}

// MARK: - SrcOptions
struct SrcOptions: Codable, Hashable  {
    let directory: String
    let isFanon, isMediawiki, isWikipedia: Int
    let language, minAbstractLength: String
    let skipAbstract, skipAbstractParen: Int
    let skipEnd: String
    let skipIcon, skipImageName: Int
    let skipQr, sourceSkip, srcInfo: String

    enum CodingKeys: String, CodingKey {
        case directory
        case isFanon = "is_fanon"
        case isMediawiki = "is_mediawiki"
        case isWikipedia = "is_wikipedia"
        case language
        case minAbstractLength = "min_abstract_length"
        case skipAbstract = "skip_abstract"
        case skipAbstractParen = "skip_abstract_paren"
        case skipEnd = "skip_end"
        case skipIcon = "skip_icon"
        case skipImageName = "skip_image_name"
        case skipQr = "skip_qr"
        case sourceSkip = "source_skip"
        case srcInfo = "src_info"
    }
}

// MARK: - RelatedTopic
struct RelatedTopic: Codable, Hashable  {
    let firstURL: String
    let icon: RelatedTopicIcon?
    let result, text: String

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

// MARK: - RelatedTopicIcon
struct RelatedTopicIcon: Codable, Hashable  {
    let height, url, width: String

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}

// MARK: - Result
struct ResultURL: Codable, Hashable  {
    let firstURL: String?
    let icon: ResultIcon
    let result, text: String?

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

// MARK: - ResultIcon
struct ResultIcon: Codable, Hashable  {
    let height: Int?
    let url: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}

// MARK: - Encode/decode helpers




//EJEMPLO DE COMO CONTRUIR EL MODELO
/*struct SearchResultResponse {
    var abstrac: String?
}

struct Infobox1 {
    let content:
}

struct Content1 {
    let da
}*/

