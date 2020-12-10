//
//  BlogApiModule.swift
//  BlogApiModule
//
//  Created by Denis Martin-Bruillot
//

import FeatherCore
import BlogModule

open class BlogApiModule : ViperModule {
    
    public var router: ViperRouter? { BlogApiRouter() }

    public static var name: String = "blog.api"

    open func boot(_ app: Application) throws {
        
        /// BlogPost
        ///
        // http://hostname/api/v1/posts/?limit=10&page=1&title=AnyTextToSeach
        try BlogPostModel.searchRoute(object: "posts", searchKey: "title", app: app)
        
        // http://hostname/api/v1/posts/<BlogPost ID>/
        try BlogPostModel.objectByIDRoute(object: "posts", app: app)
        
        // http://hostname/api/v1/posts/<BlogPost ID>/image
        try BlogPostModel.objectImageByIDRoute(object: "posts", app: app)
        
        /// Authors
        /// 
        // http://hostname/api/v1/posts/?limit=10&page=1&name=AnyTextToSeach
        try BlogAuthorModel.searchRoute(object: "authors", searchKey: "name", app: app)
        
        // http://hostname/api/v1/posts/<Authors ID>/
        try BlogAuthorModel.objectByIDRoute(object: "authors", app: app)
        
        // http://hostname/api/v1/posts/<Authors ID>/image
        try BlogAuthorModel.objectImageByIDRoute(object: "authors", app: app)
        
        /// Categories
        ///
        // http://hostname/api/v1/categories/?limit=10&page=1&title=AnyTextToSeach
        try BlogCategoryModel.searchRoute(object: "categories", searchKey: "title", app: app)
        
        // http://hostname/api/v1/categories/<Category ID>/
        try BlogCategoryModel.objectByIDRoute(object: "categories", app: app)
        
        // http://hostname/api/v1/categories/<Category ID>/image
        try BlogCategoryModel.objectImageByIDRoute(object: "categories", app: app)
        
        /// Links
        ///
        // http://hostname/api/v1/links/?limit=10&page=1&name=AnyTextToSeach
        try BlogAuthorLinkModel.searchRoute(object: "links", searchKey: "name", app: app)
        
        // http://hostname/api/v1/links/Links/
        try BlogAuthorLinkModel.objectByIDRoute(object: "links", app: app)
        
        
    }
    
    public init() { }

}
