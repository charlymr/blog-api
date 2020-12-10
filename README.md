# Blog Rest API module

This module is reponsible Rest API endpoint to the blog module.
It should be use with Feather

## Dependencies
 
 ### System (https://github.com/BinaryBirds/feather)
 - Admin module
 - Api module
 - Frontend module
 - User module
 - System module
 
 ### feather-modules (https://github.com/feather-modules)
 - Blog module (PR to main module in progress)
 ```.package(name: "blog-module", url: "https://github.com/charlymr/blog", from: "1.0.0-beta.10"),```


## Available Services

### BlogPost
- http://localhost:8080/api/v1/posts/?limit=10&page=1&title=AnyTextToSeach
- http://localhost:8080/api/v1/posts
- http://localhost:8080/api/v1/posts/<#BlogPost ID#>/
- http://localhost:8080/api/v1/posts/<#BlogPost ID#>/image

### Authors
- http://localhost:8080/api/v1/authors/?limit=10&page=1&name=AnyTextToSeach
- http://localhost:8080/api/v1/authors
- http://localhost:8080/api/v1/authors/<#Authors ID#>/
- http://localhost:8080/api/v1/authors/<#Authors ID#>/image

### Categories
- http://localhost:8080/api/v1/categories/?limit=10&page=1&title=AnyTextToSeach
- http://localhost:8080/api/v1/categories
- http://localhost:8080/api/v1/categories/<#Category ID#>/
- http://localhost:8080/api/v1/categories/<#Category ID#>/image

### Links
- http://localhost:8080/api/v1/links/?limit=10&page=1&name=AnyTextToSeach
- http://localhost:8080/api/v1/links/Links
