//
//  BlogPostModel+Query.swift
//  
//
//  Created by Denis Martin on 09/12/2020.
//

import FeatherCore
import BlogModule
import FluentKit

extension BlogPostModel : RESTModelImageContent, RESTModelSearchableContent {
    
    static func searchTerm(_ qb: QueryBuilder<BlogPostModel>, searchTerm: String) -> QueryBuilder<BlogPostModel> {
        qb.filter(\.$title ~~ searchTerm)
    }
    
    func imageKeyValue() -> String {
        $imageKey.value!
    }
    
}

extension BlogAuthorModel : RESTModelImageContent, RESTModelSearchableContent {

    func imageKeyValue() -> String {
        $imageKey.value!
    }
    
    static func searchTerm(_ qb: QueryBuilder<BlogAuthorModel>, searchTerm: String) -> QueryBuilder<BlogAuthorModel> {
        qb.filter(\.$name ~~ searchTerm)
    }

    static public func find(on req: Request) -> QueryBuilder<BlogAuthorModel> {
        findMetadata(on: req.db)
            .filter(FrontendMetadata.self, \.$status == .published)
            .filter(FrontendMetadata.self, \.$date <= Date())
            .sort(FrontendMetadata.self, \.$date, .descending)
    }

}

extension BlogCategoryModel : RESTModelImageContent, RESTModelSearchableContent {

    func imageKeyValue() -> String {
        $imageKey.value!
    }

    static func searchTerm(_ qb: QueryBuilder<BlogCategoryModel>, searchTerm: String) -> QueryBuilder<BlogCategoryModel> {
        qb.filter(\.$title ~~ searchTerm)
    }

    static func find(on req: Request) -> QueryBuilder<BlogCategoryModel> {
        findMetadata(on: req.db)
            .filter(FrontendMetadata.self, \.$status == .published)
            .filter(FrontendMetadata.self, \.$date <= Date())
            .sort(FrontendMetadata.self, \.$date, .descending)
    }
    
}

extension BlogAuthorLinkModel : RESTModelSearchableContent {

    static func findBy(id: UUID, on req: Request) -> EventLoopFuture<BlogAuthorLinkModel> {
        query(on: req.db)
            .filter(\.$id == id)
            .first()
            .unwrap(or: Abort(.notFound))
    }

    static func searchTerm(_ qb: QueryBuilder<BlogAuthorLinkModel>, searchTerm: String) -> QueryBuilder<BlogAuthorLinkModel> {
        qb.filter(\.$name ~~ searchTerm)
    }

    static func find(on req: Request) -> QueryBuilder<BlogAuthorLinkModel> {
        findMetadata(on: req.db)
            .filter(FrontendMetadata.self, \.$status == .published)
            .filter(FrontendMetadata.self, \.$date <= Date())
            .sort(FrontendMetadata.self, \.$date, .descending)
    }
    
}
