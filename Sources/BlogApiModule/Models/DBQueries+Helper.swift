//
//  DBQueries+Helper.swift
//  
//
//  Created by Denis Martin on 10/12/2020.
//

import FeatherCore
import BlogModule
import FluentKit

/// Base Protocol (FindBy ID must have)
protocol RESTModelContent : ViperModel, Content {
    
    static func findBy(id: UUID, on req: Request) -> EventLoopFuture<Self>
    
}


/// Searchable
protocol RESTModelSearchableContent : RESTModelContent {
    
    static func find(on req: Request) -> QueryBuilder<Self>
    
    static func searchTerm(_ qb: QueryBuilder<Self>, searchTerm: String) -> QueryBuilder<Self>
    
}

extension RESTModelSearchableContent where Self:ViperModel {
    
    /// Adding the search key will offer pagination and limit to the route
    static func searchRoute(object: PathComponent, searchKey: String?, app: Application) throws {

        app.get("api", "v1", object) { req -> EventLoopFuture<[Self]> in
            var qb = Self.find(on: req)
            
            if let searchKey = searchKey {
                let searchItem: String? = req.query[searchKey]
                let limit: Int = req.query["limit"] ?? 10
                let page: Int = max((req.query["page"] ?? 1), 1)

                if let searchTerm = searchItem, !searchTerm.isEmpty {
                    qb = Self.searchTerm(qb, searchTerm: searchTerm)
                }
                let start: Int = (page - 1) * limit
                let end: Int = page * limit
                return  qb.copy().range(start..<end).all()
            }
            
            return qb.copy().all()
        }
    }
    
    static func objectByIDRoute(object: PathComponent, app: Application) throws {
        app.get("api", "v1", object, ":id") { req -> EventLoopFuture<Self> in
            guard let idparam = req.parameters.get("id"), let uuid = UUID(idparam) else {
                throw Abort(.internalServerError)
            }
            return Self.findBy(id: uuid, on: req)
        }
        
    }

}

/// Image Extension
protocol RESTModelImageContent : RESTModelContent {
    
    func imageKeyValue() -> String
    
}

extension RESTModelImageContent where Self:ViperModel  {
    
    static func objectImageByIDRoute(object: PathComponent, app: Application) throws {
        app.get("api", "v1", object, ":id", "image") { req -> EventLoopFuture<Response> in
            guard let idparam = req.parameters.get("id"), let uuid = UUID(idparam) else {
                throw Abort(.internalServerError)
            }
            return Self.findBy(id: uuid, on: req)
                .flatMap({ (post) -> EventLoopFuture<Response> in
                    return req.redirect(to: "/assets/\(String(describing: post.imageKeyValue))")
                        .encodeResponse(for: req)
                })
        }
    }
}
