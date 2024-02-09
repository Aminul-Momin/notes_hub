<details open><summary style="font-size:25px;color:Orange;text-align:left">APIs, HTTP APIs & REST APIs</summary>

#### APIs

-   [Top 6 Most Popular API Architecture Styles](https://www.youtube.com/watch?v=4vLxWqE94l4)
-   [APIs for Beginners 2023 - How to use an API (Full Course / Tutorial)](https://www.youtube.com/watch?v=WXsD0ZgxjRw&t=5570s)
-   [Introduction to web APIs](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Client-side_web_APIs/Introduction)
-   [HTTP](https://en.wikipedia.org/wiki/HTTP)

---

API stands for "Application Programming Interface." An API is a set of rules and protocols that allows one software application to interact with another. It defines the methods and data formats that applications can use to request and exchange information. APIs are used to enable the integration of different software systems, allowing them to communicate and work together. Here are key aspects of APIs:

-   **Communication between Software Components**: APIs define how different software components should interact. They act as a bridge, allowing one application to access the functionality or data of another.
-   **Abstraction Layer**: APIs provide an abstraction layer that hides the internal complexities of the system or service, exposing only what is necessary for external users or applications.
-   **Methods and Endpoints**: APIs expose methods (functions) and endpoints (URLs or URIs) that define the operations or resources available for interaction. These methods and endpoints are like the building blocks that developers can use.
-   **Data Formats**: APIs define the data formats in which information is exchanged. Common formats include JSON (JavaScript Object Notation) and XML (eXtensible Markup Language).
-   **HTTP and RESTful APIs**: Many APIs use HTTP (Hypertext Transfer Protocol) as the communication protocol. REST (Representational State Transfer) is a commonly used architectural style for designing networked applications, and RESTful APIs adhere to REST principles.
-   **Authentication and Authorization**: APIs often include mechanisms for authentication and authorization to control access to resources. This ensures that only authorized users or applications can make use of the API.
-   **Third-Party Integration**: APIs are crucial for enabling third-party developers to integrate their applications or services with existing platforms, services, or data sources.
-   **Web APIs vs. Library APIs**: Web APIs are typically accessed over the internet using standard protocols, while library APIs are sets of routines or tools for building software and are often used within the same programming language.
    -   `Web APIs`: Services like Twitter, Google Maps, or OpenWeatherMap provide APIs that developers can use to access their data or functionality.
    -   `Library APIs`: Libraries in programming languages, like the Standard Template Library (STL) in C++ or the Python Standard Library, expose APIs for developers to use predefined functions and classes. APIs play a fundamental role in modern software development by facilitating the creation of modular, interoperable, and scalable applications. They enable the integration of different systems and contribute to the development of a vibrant ecosystem of interconnected applications and services.

#### HTTP

HTTP, or Hypertext Transfer Protocol, is a fundamental protocol used for communication on the World Wide Web. It is an application layer protocol that facilitates the transfer of hypertext, which includes text, images, videos, and other multimedia files, over the internet. Here are key terms and concepts associated with HTTP:

-   `Client and Server`: In the context of HTTP, the client is typically a web browser or a similar application that requests resources, while the server is a computer hosting those resources and responding to client requests.
-   `Request-Response Model`: HTTP follows a request-response model. The client sends an HTTP request to the server, and the server responds with the requested data or an error message.
-   `URL (Uniform Resource Locator)`: A URL is a string of characters that provides the address used to access a resource on the web. It includes the protocol (e.g., http://), the domain name, and the path to the resource.
-   **HTTP Methods**: HTTP defines several methods or verbs that indicate the desired action to be performed on a resource. Common HTTP methods include:

    -   > `GET`: Retrieve data from a resource.

        -   `Idempotent`: Yes. Repeated GET requests should have the same effect as a single request.
        -   `Example`: Fetch the details of a product by requesting GET /products/123.
            -   `$ curl http://localhost:8000/products/123`

    -   > `POST`: Used to submit data to be processed to a specified resource. It can also be used to create a new resource.

        -   `Idempotent`: No. Repeated POST requests with the same data will create multiple resources.
        -   `Example`: Create a new product by sending data to POST /products.
            -   `$ curl -X POST -H "Content-Type: application/json" -d '{"name": "New Product", "price": 19.99}' http://localhost:8000/products/`

    -   > `PUT`: The PUT method is used to update or create a resource at a specific URI. It essentially replaces the current representation of the target resource with the request payload.

        -   `Use Case`: PUT is typically used when the client has the full representation of the resource and wants to replace the existing resource at the specified URI.
        -   `Idempotent`: Yes. PUT requests are considered idempotent, meaning that multiple identical requests should have the same effect as a single request. If you send the same PUT request multiple times, it should not have unintended side effects.
        -   `Example 0`: Update product information by sending data to PUT /products/123 using curl.
            -   `$ curl -X PUT -H "Content-Type: application/json" -d '{"name": "Updated Product", "price": 24.99}' http://localhost:8000/products/123/`
        -   `Example 1`: Update product information by sending data to PUT /products/123 in Django.

            ```python
            # views.py
            from django.shortcuts import get_object_or_404
            from rest_framework.views import APIView
            from rest_framework.response import Response
            from rest_framework import status
            from .models import Product
            from .serializers import ProductSerializer

            class ProductDetailView(APIView):
                def put(self, request, pk):
                    product = get_object_or_404(Product, pk=pk)
                    serializer = ProductSerializer(product, data=request.data)

                    if serializer.is_valid():
                        serializer.save()
                        return Response(serializer.data, status=status.HTTP_200_OK)

                    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            ```

        -   `Example 2`: Update product information by sending data to PUT /products/123 in Django.

            ```python
            # views.py
            from django.shortcuts import get_object_or_404, render, redirect
            from .models import Product
            from .forms import ProductForm

            def product_detail(request, pk):
                product = get_object_or_404(Product, pk=pk)

                if request.method == 'PUT':
                    form = ProductForm(request.PUT, instance=product)
                    if form.is_valid():
                        form.save()
                        return redirect('product_detail', pk=pk)
                else:
                    form = ProductForm(instance=product)

                return render(request, 'product_detail.html', {'form': form})
            ```

        -   `Example 3`: Update product information by sending data to PUT /products/123 in Django.

            ```python
            # views.py
            from django.shortcuts import get_object_or_404, render, redirect
            from django.http import HttpResponse
            from django.views.decorators.csrf import csrf_exempt
            from .models import Product
            import json

            @csrf_exempt
            def product_detail(request, pk):
                product = get_object_or_404(Product, pk=pk)

                if request.method == 'PUT':
                    # Retrieve and decode JSON data from the request body
                    try:
                        data = json.loads(request.body.decode('utf-8'))
                    except json.JSONDecodeError:
                        return HttpResponse("Invalid JSON data", status=400)

                    # Update the product with the data
                    product.name = data.get('name', product.name)
                    product.price = data.get('price', product.price)
                    product.save()

                    return HttpResponse("Product updated successfully", status=200)

                return render(request, 'product_detail.html', {'product': product})
            ```

    -   > `PATCH`: The PATCH method is used to apply partial modifications to a resource. Unlike PUT, which replaces the entire resource, PATCH is specifically designed for partial updates.

        -   `Use Case`: PATCH is used when the client wants to apply changes to specific fields of a resource without affecting the entire representation. It is more bandwidth-efficient when dealing with large resources.
        -   `Idempotent`: It depends on the implementation. While PATCH is intended to be idempotent, achieving true idempotence can be challenging since the server must interpret the partial update in a consistent manner.
        -   `Example`: Update only the email address of a user by sending data to PATCH /users/123.

    -   > `DELETE`: Remove a resource from the server.

        -   `Idempotent`: Yes. Repeated DELETE requests should have the same effect as a single request.
        -   `Example`: Delete a user by sending a request to DELETE /users/123.

    -   > `HEAD`: The HEAD method is used to retrieve the headers of a resource without fetching its body. It is essentially a way to request metadata about a resource without the need to transfer the entire representation.

        -   `Response`: The server responds to a HEAD request with the headers that would be returned for a corresponding GET request, but without the actual data.
        -   `Use Case`: If a client is interested in obtaining information like the last modification time (Last-Modified), content type, or content length of a resource without downloading the entire resource, a HEAD request can be useful.
        -   `Idempotent`: Yes. Repeated HEAD requests should have the same effect as a single request.
        -   `Example`: Get the headers of a resource without downloading its content using HEAD /products.
            -   `$ curl -I http://localhost:8000/products/`

    -   > `OPTIONS`: Retrieve information about the communication options for a resource.

        -   `Purpose`: The OPTIONS method is used to retrieve the communication options for a given resource or server. It is often used for service discovery and to determine the allowed methods, headers, and other configuration details of an API.
        -   `Response`: The server responds to an OPTIONS request with information about the allowed methods (e.g., GET, POST, PUT, DELETE), headers, and any other details that help a client understand how to interact with the resource.
        -   `Use Cases`:

            -   `CORS (Cross-Origin Resource Sharing)`: The OPTIONS request is crucial in the context of CORS, where a browser may send a pre-flight OPTIONS request to check if it is allowed to make a subsequent request to a different domain.
            -   `Service Discovery`: In some cases, an OPTIONS request can be used to discover the capabilities of an API, helping clients understand what operations are supported.
            -   `Example`:
                -   `$ curl -X OPTIONS http://localhost:8000/products/`
            -   `Example`:

                ```http
                OPTIONS /api/resource/123 HTTP/1.1
                Host: example.com
                ```

                -   The server responds with information about the allowed methods, headers, etc.

                ```http
                HTTP/1.1 200 OK
                Allow: GET, HEAD, POST, OPTIONS
                Access-Control-Allow-Origin: *
                Access-Control-Allow-Methods: GET, POST, OPTIONS
                ```

        -   `Idempotent`: Yes. Repeated OPTIONS requests should have the same effect as a single request.
        -   `Example`: Determine the available methods and capabilities for a resource using OPTIONS /resource.

    -   `CONNECT`: Used for setting up a network connection to a resource, typically used for proxy servers.

        -   `Purpose`: The CONNECT method is used to establish a tunnel to the server identified by the target resource. It is typically used with the HTTP Secure (HTTPS) protocol to establish a secure connection through an intermediary (such as a proxy server).
        -   `Use Cases`: Proxy Servers: The primary use case for CONNECT is when a client wants to establish a secure connection to a server through a proxy. The CONNECT method is used to request that the proxy create a tunnel, and subsequent data is sent over the established tunnel without interpretation by the proxy.
        -   `Example`: Rarely used directly in RESTful APIs.

            ```http
            CONNECT server.example.com:443 HTTP/1.1
            Host: server.example.com:443
            ```

        -   The client sends a CONNECT request to the proxy server, requesting a tunnel to server.example.com on port 443 for establishing a secure connection.
        -   The server responds with a success status if the tunnel is established.

        -   `Idempotent`: No.

    -   > `TRACE`: Used for diagnostic purposes, allows a client to retrieve a diagnostic trace of the actions taken by intermediate servers.

        -   `Purpose`:The TRACE method is used for diagnostic purposes. When a server receives a TRACE request, it echoes the received request back to the client. This can be useful for troubleshooting and understanding how intermediate servers modify the request.

        -   `Use Cases`:Debugging: The primary use case for TRACE is debugging and diagnosing issues in the communication between the client and the server. It allows the client to see how the request is modified as it travels through different proxies and servers.

        -   `Example`: Rarely used directly in RESTful APIs.

            ```http
            TRACE /path/to/resource HTTP/1.1
            Host: example.com
            ```

            -   The server echoes the received request back to the client, and the client can inspect how the request was processed by intermediate servers.

        -   `Idempotent`: Yes.

-   **HTTP Status Codes**: HTTP responses include status codes that indicate the result of the server's attempt to process the request. Common status code categories include:

    -   > `1xx Informational`: These status codes indicate that the server has received the request and is processing it. They are mainly used for communication purposes and do not represent a final response.

        -   `100 Continue`: The server has received the initial part of the request and expects the client to continue sending the rest of it.
        -   `101 Switching Protocols`: The server is changing the protocol used in the request.

    -   > `2xx Success`: These status codes indicate that the request was successfully received, understood, and accepted by the server.

        -   `200 OK`: The request was successful, and the server is returning the requested resource.
        -   `201 Created`: The request was successful, and a new resource was created as a result.

    -   > `3xx Redirection`: These status codes indicate that the client needs to take additional steps to complete the request.

        -   `301 Moved Permanently`: The requested resource has been permanently moved to a new location.
        -   `302 Found`: The requested resource has been temporarily moved to a different location.

    -   > `4xx Client Error`: These status codes indicate that there was an error on the client's side, and the request cannot be fulfilled.

        -   `400 Bad Request`: The server cannot understand the request due to malformed syntax or other client-side errors.
        -   `403 Forbidden`: The server understood the request, but the client does not have permission to access the requested resource.

    -   > `5xx Server Error`: These status codes indicate that there was an error on the server's side, and the request could not be fulfilled.

        -   `500 Internal Server Error`: A generic server error occurred, indicating that something went wrong on the server.
        -   `502 Bad Gateway`: The server acting as a gateway or proxy received an invalid response from an upstream server.

-   `Headers`: HTTP headers provide additional information about the request or the response. They include metadata such as content type, content length, and caching directives.
-   `Cookies`: Cookies are small pieces of data sent from a server and stored on the client's browser. They are commonly used for user authentication, tracking, and session management.
-   `Session`: A session is a way to persist information across multiple requests and responses between a client and a server. Sessions are often managed using cookies or URL parameters.
-   `Statelessness`: HTTP is a stateless protocol, meaning each request from a client to a server is independent, and the server does not retain information about the client's state between requests. Session management mechanisms are used to overcome this limitation.
-   `HTTPS (Hypertext Transfer Protocol Secure)`: HTTPS is a secure version of HTTP that encrypts the data transmitted between the client and the server. It uses SSL/TLS protocols to ensure the confidentiality and integrity of the communication.
-   `Websockets`: Websockets provide a full-duplex communication channel over a single, long-lived connection. This enables real-time communication between a client and a server.
-   `REST (Representational State Transfer)`: REST is an architectural style for designing networked applications. It often uses HTTP as the communication protocol and relies on a stateless, client-server interaction.
    Understanding these HTTP terms and concepts is essential for web developers, system administrators, and anyone involved in working with web technologies. HTTP forms the foundation of communication on the internet, and knowledge of its principles is crucial for effective web development and troubleshooting.

#### REST

REST, or Representational State Transfer, is an architectural style for designing networked applications. It was introduced by Roy Fielding in his doctoral dissertation in 2000 and has since become a popular choice for building web services and APIs (Application Programming Interfaces).

REST API (Representational State Transfer) is a specific type of HTTP API that follows a set of architectural principles to make it more efficient, scalable, and maintainable. REST API uses a client-server model and is based on the HTTP protocol. It uses standard HTTP methods such as GET, POST, PUT, and DELETE, and it employs a set of conventions to define resources, URIs, and responses. REST API aims to make the client-server communication stateless and cacheable, and it uses hypermedia (links) to navigate between resources. Here are key terms and concepts associated with REST:

-   `Resource`: In REST, everything is considered a resource. A resource can be a physical object (like an entity in a database), a service, or any other concept that can be identified and addressed.

-   `Uniform Resource Identifier (URI)`:

    -   Resources in REST are identified by URIs.
    -   A URI is a string of characters that uniquely identifies a particular resource.
    -   URIs can be further classified into URLs (Uniform Resource Locators) when they specify the location of the resource, and URNs (Uniform Resource Names) when they only provide a unique name.
    -   URIs are used to identify and interact with resources on the internet.

    -   `Uniform Resource Locator (URL)`:

        -   A URL is a specific type of URI that provides the means to locate and retrieve a resource on the internet.
        -   It includes the protocol used to access the resource (e.g., HTTP or HTTPS), the domain or IP address where the resource is hosted, and the path to the specific resource on that server.
        -   URLs are the most common type of URIs and are used when you want to specify the location of a resource.

-   `HTTP Methods (Verbs)`: RESTful services use standard HTTP methods to perform operations on resources.

-   `Representation`: Representations are the different ways a resource can be presented or represented. In REST, a resource can have multiple representations, such as JSON, XML, HTML, or others. Clients interact with resources by exchanging representations. For example, a client might request a user resource and receive a JSON representation of that user.

-   `Idempotence`: An operation is considered idempotent if it produces the same result regardless of how many times it is applied. For example, a GET request is idempotent because retrieving a resource multiple times does not change the resource.

-   `Content Negotiation`: Content negotiation is the process of selecting the appropriate representation of a resource based on the client's preferences. This is often done using the Accept header in HTTP requests.

-   `API Versioning`: To manage changes in an API, versioning is often employed. This can be done through the URI, headers, or other mechanisms, allowing clients to specify the version of the API they wish to use.

#### RESTfull Principles:

RESTful principles are a set of constraints that guide the design of RESTful systems to ensure simplicity, scalability, and uniformity. The key principles of REST are:

-   `Statelessness`:

    -   Each request from a client to a server must contain all the information needed to understand and fulfill the request.
    -   The server should not store any information about the client's state between requests. Each request should be independent.

-   `Client-Server Architecture`:

    -   The client and server are separate entities that communicate over a network.
    -   The client is responsible for the user interface and user experience, while the server is responsible for processing requests, managing resources, and handling business logic.

-   `Uniform Interface`: The uniform interface is a key constraint in REST; it helps to have consistency in the design, simplify and decouple the architecture. It is characterized by following

    -   `Resource Identification`: Resources are identified and addressed in a RESTful system using URIs (Uniform Resource Identifiers). These URIs act as global identifiers for resources, and clients can use them to interact with the resources on the server.
    -   `Resource Manipulation through Representations`: Resources in a RESTful system can have multiple representations, such as XML, JSON, HTML, or others. Clients interact with resources by exchanging representations. When a client requests a resource, it receives a representation of that resource, and it can modify or delete the resource by sending the server a new representation.
    -   `Self-Descriptive Messages`: In a RESTful system, communication between clients and servers is achieved through the exchange of messages. These request and response messages adhere to the principles of Representational State Transfer (REST) and are designed to be self-descriptive. This means that they include all the information needed for the recipient to understand and process the message. For example, headers may specify the content type, allowing the recipient to interpret the body correctly. There are typically two main types of messages exchanged: requests from clients to servers and responses from servers to clients.

        -   `HTTP Request Message (Client to Server)`:

            -   `Method`: The HTTP method (or verb) indicates the desired action to be performed on the resource. Common methods include GET (retrieve a resource), POST (create a new resource), PUT (update a resource), DELETE (remove a resource), etc.
            -   `URI (Uniform Resource Identifier)`: Specifies the identifier of the resource on which the action should be performed. It uniquely identifies the resource within the system.
            -   `Headers`: Additional information about the request, such as content type, accepted response formats, authentication credentials, etc.
            -   `Body (optional)`: In some cases, a request may include a message body. For example, in a POST or PUT request, the body contains data to create or update a resource.

        -   `HTTP Response Message (Server to Client)`:

            -   `Status Code`: Indicates the outcome of the server's attempt to process the request. Common status codes include 200 OK (successful), 201 Created (resource successfully created), 404 Not Found (resource not found), 500 Internal Server Error (server encountered an error), etc.
            -   `Headers`: Provide additional information about the response, such as content type, cache control directives, server information, etc.
            -   `Body (optional)`: Contains the representation of the resource or additional information. For example, in a successful GET request, the body might contain the requested resource in the desired format (JSON, XML, HTML, etc.).

    -   `Hypermedia as the Engine of Application State (HATEOAS)`: Another key principle of REST (Representational State Transfer) architecture is Hypermedia as the Engine of Application State. It refers to the use of hypermedia controls within API responses to enable dynamic navigation and discoverability. The client navigates through the application by following links in the representations returned by the server. This makes the application more discoverable and allows changes to be made on the server without affecting clients that rely on the hypermedia links. Key Concepts of Hypermedia in RESTful API are followings.

        -   `Hypermedia Controls`:

            -   The server includes hypermedia controls (links, forms, etc.) within the representations it sends to clients. These controls provide information about the available actions, resources, and state transitions that clients can access.

        -   `Links and Link Relations`: Link relations in HATEOAS play a crucial role in defining the semantics of hypermedia links. A link relation is a way to express the meaning or purpose of a link. It provides a standardized way for clients to understand the relationship between the current resource and linked resources. Some common link relations used in HATEOAS include:

            -   **Self (self)**: The self link relation is used to provide a link back to the current resource. It allows the client to retrieve information about the current state or resource.

                ```json
                {
                    "links": [{ "rel": "self", "href": "/api/resource/123" }],
                    "data": {
                        /* ... */
                    }
                }
                ```

            -   **Related (related)**: The related link relation is used to indicate a related resource. It might provide links to associated resources that can be useful for the client.

                ```json
                {
                    "links": [
                        { "rel": "related", "href": "/api/other_resource" }
                    ],
                    "data": {
                        /* ... */
                    }
                }
                ```

            -   **Next (next) and Previous (prev)**: These link relations are often used in paginated results to navigate to the next or previous set of resources.

                ```json
                {
                    "links": [
                        { "rel": "next", "href": "/api/resources?page=2" },
                        { "rel": "prev", "href": "/api/resources?page=1" }
                    ],
                    "data": [
                        /* ... */
                    ]
                }
                ```

            -   **Create (create), Update (update), and Delete (delete)**: These link relations may be used to indicate the actions a client can take to create, update, or delete a resource.

                ```json
                {
                    "links": [
                        {
                            "rel": "create",
                            "href": "/api/resources",
                            "method": "POST"
                        },
                        {
                            "rel": "update",
                            "href": "/api/resource/123",
                            "method": "PUT"
                        },
                        {
                            "rel": "delete",
                            "href": "/api/resource/123",
                            "method": "DELETE"
                        }
                    ],
                    "data": {
                        /* ... */
                    }
                }
                ```

            -   **Profile (profile)**: The profile link relation can be used to indicate a link to a resource that provides additional information about the resource's representation format or profile.

                ```json
                {
                    "links": [
                        {
                            "rel": "profile",
                            "href": "/api/profiles/resource_profile"
                        }
                    ],
                    "data": {
                        /* ... */
                    }
                }
                ```

            -   Other Common link relations include "first," "last," and custom relations specific to the API.

        -   `Discoverability`:

            -   Clients can dynamically discover and navigate the API by following hypermedia links provided in the responses.
            -   Instead of hardcoding URLs, clients rely on the links embedded in the API responses to explore available actions and resources.

        -   `Stateless Interaction`:

            -   RESTful APIs are stateless, and hypermedia supports stateless interactions by including all the necessary information for clients to navigate and interact within each response.
            -   Clients maintain the state of the application based on the information provided in the hypermedia controls.

        -   `Reduced Coupling`:

            -   Hypermedia reduces the coupling between the client and the server. Clients are not required to have prior knowledge of the API structure; instead, they can rely on the information provided in the hypermedia links.

        -   `Media Types`:

            -   Hypermedia APIs often use specific media types to represent hypermedia controls. Common media types include HAL (Hypertext Application Language), JSON-LD (JSON Linked Data), Siren, and others.
            -   The choice of media type defines how hypermedia controls, links, and resource representations are structured in the API responses.

-   `Cacheability`:

    -   Responses from the server can be explicitly marked as cacheable or non-cacheable.
    -   Caching can improve performance and reduce the load on servers by allowing clients to reuse previously fetched representations.

-   `Layered System`:

    -   The architecture can be composed of multiple layers, with each layer having a specific responsibility and interacting only with adjacent layers.
    -   This helps to achieve scalability, flexibility, and easier maintenance.

-   `Code-On-Demand (Optional)`:

    -   Servers can temporarily extend the functionality of a client by transferring logic in the form of applets or scripts.
    -   This constraint is optional and not always used in RESTful architectures.

#### HTTP API vs REST API

HTTP API and REST API are terms often used interchangeably, but they represent different concepts. Let's clarify the distinctions between them:

-   `HTTP API`:

    -   An HTTP API (Application Programming Interface) is a general term for an interface that allows one software application to interact with another over the HTTP protocol.
    -   It doesn't prescribe a specific architectural style or set of constraints.
    -   An HTTP API can use various design patterns and data formats for communication, including SOAP (Simple Object Access Protocol), XML-RPC, or custom protocols.
    -   It may not adhere to the principles of REST (Representational State Transfer) and might not leverage HTTP methods and status codes in a RESTful manner.

-   `REST API`:

    -   REST, on the other hand, is a specific architectural style for designing networked applications, and a REST API is an API that follows the principles of REST.
    -   RESTful APIs use standard HTTP methods (GET, POST, PUT, DELETE, etc.) to perform operations on resources, and they often use standard HTTP status codes to indicate the result of a request.
    -   REST APIs typically involve stateless communication, a uniform and consistent interface, resource-based URLs, and support for various representation formats (JSON, XML).
    -   HATEOAS (Hypermedia as the Engine of Application State) is a key concept in RESTful APIs, where clients interact with the application entirely through hypermedia provided dynamically by application servers.

In summary, while an HTTP API refers to any API that uses the HTTP protocol for communication, a REST API specifically adheres to the principles of REST. RESTful APIs leverage the standard features of HTTP and follow a set of constraints to achieve a scalable, maintainable, and uniform architecture. It's important to note that not all APIs that use HTTP are necessarily RESTful, and the distinction lies in whether they follow the principles of REST.

#### OpenAPI

OpenAPI, formerly known as Swagger, is a specification for building APIs (Application Programming Interfaces). It provides a standardized way to describe RESTful APIs, allowing both humans and computers to understand the capabilities of a service without access to its source code. OpenAPI is often used to design, document, and consume APIs. Here are key aspects of OpenAPI:

1. **Specification Format**:
    - `YAML or JSON`: OpenAPI specifications can be written in either YAML (YAML Ain't Markup Language) or JSON (JavaScript Object Notation). YAML is often preferred for its human-readable and clean syntax.
2. **API Documentation**:
    - `Human-Readable Documentation`: OpenAPI specifications serve as a comprehensive documentation for APIs. Developers can easily understand how to interact with the API, including available endpoints, request/response formats, authentication methods, and more.
    - `Interactive Documentation`: Tools like Swagger UI or ReDoc can generate interactive documentation directly from the OpenAPI specification, allowing users to explore and test API endpoints interactively.
3. **API Design**:
    - `Design-First Approach`: OpenAPI encourages a design-first approach to building APIs. Developers can create the API specification before implementing the actual service, fostering collaboration between development teams and stakeholders.
4. **Key Components**:
    - `Paths and Operations`: Define endpoints (paths) and operations (HTTP methods) supported by the API.
    - `Parameters`: Specify parameters for requests, including path parameters, query parameters, headers, and request bodies.
    - `Responses`: Describe the possible responses from API endpoints, including status codes and response bodies.
    - `Security Definitions`: Define security requirements and authentication mechanisms.
5. **Code Generation**:
    - `Client Code`: OpenAPI specifications can be used to generate client code in various programming languages, reducing the effort required to consume an API.
    - `Server Code`: Some tools can also generate server-side code skeletons based on the OpenAPI specification, facilitating the implementation of API services.
6. **Tool Ecosystem**:
    - `Validation Tools`: Tools can validate whether an API implementation conforms to its OpenAPI specification.
    - `Code Generators`: Various code generators can produce client libraries, server stubs, and documentation based on the OpenAPI specification.
    - `Testing Tools`: OpenAPI specifications can be used to generate tests for API endpoints.
7. **Standardization**:
    - `Industry Standard`: OpenAPI is widely adopted as an industry standard for API specifications. Many API-related tools and platforms support OpenAPI, making it easier to integrate and work with different services.

OpenAPI plays a crucial role in promoting API standardization, collaboration, and understanding between different parties involved in the API lifecycle, from design to consumption.

#### OAuth (Open Authorization)

OAuth (Open Authorization) is an open standard and framework that allows secure third-party access to resources on behalf of a resource owner, without sharing the resource owner's credentials directly. It is commonly used for granting access to web and mobile applications to interact with APIs and services on behalf of users. OAuth provides a standardized way for users to grant limited access to their resources (such as data or services) to another party without exposing their credentials. Key concepts and components of OAuth include:

-   **Roles**:

    -   `Resource Owner`: The entity that owns the protected resource, typically a user.
    -   `Client`: The application requesting access to a protected resource on behalf of the resource owner.
    -   `Authorization Server`: The server that authenticates the resource owner and issues access tokens after obtaining authorization.
    -   `Resource Server`: The server hosting the protected resources that the client wants to access.

-   **Flows/Grant Types**:

    -   `Authorization Code Grant`: Used by web applications where the client can securely retrieve an authorization code by directing the user's browser to an authorization endpoint. The authorization code is then exchanged for an access token.
    -   `Implicit Grant`: Designed for mobile and browser-based applications where the client obtains an access token directly without an intermediate authorization code.
    -   `Client Credentials Grant`: Used when the client is the resource owner and requests access to its resources.
    -   `Resource Owner Password Credentials Grant`: Involves the resource owner's credentials being directly used by the client to obtain an access token.

-   **Access Tokens**:

    -   `Bearer Tokens`: The most common type of access token in OAuth. It is a string representing the authorization granted to the client.
    -   `Token Lifespan`: Access tokens have a limited lifespan and may be short-lived. Refresh tokens can be used to obtain a new access token without requiring the user to re-authenticate.

-   **Scopes**:

    -   `Scope`: A parameter that defines the specific permissions or access levels requested by the client. It allows resource owners to control the scope of access granted.

-   **Endpoints**:

    -   `Authorization Endpoint`: Where the resource owner grants authorization to the client.
    -   `Token Endpoint`: Where the client exchanges the authorization code or credentials for an access token.
    -   `Redirection URI`: The URI to which the authorization server redirects the user-agent (browser) after granting or denying access.

OAuth is widely adopted and is used by major platforms and services to enable secure and delegated access. It enhances security by allowing users to control the access they grant to third-party applications without sharing their credentials directly.

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Networking</summary>

#### Networking Terms & Concepts:

In software engineering, networking refers to the practice of designing, implementing, and maintaining the communication infrastructure that allows different software components, systems, or devices to exchange information. Understanding key terms and concepts in networking is crucial for software engineers working on applications that rely on network communication. Here are some fundamental terms and concepts in the context of networking:

-   `Network`: A network is a collection of interconnected devices or nodes that can communicate with each other. Networks can be local (LAN) or global (WAN) and can use various technologies like Ethernet, Wi-Fi, or cellular networks.
-   `Protocol`: A protocol is a set of rules and conventions that dictate how data is transmitted and received over a network. Examples include TCP/IP (Transmission Control Protocol/Internet Protocol) and HTTP (Hypertext Transfer Protocol).

    **1. TCP (Transmission Control Protocol)**: TCP is one of the core protocols of the Internet Protocol Suite. It provides reliable, connection-oriented communication between devices over a network. TCP ensures that data is delivered in the correct order and without errors.

    -   `Connection-Oriented`: TCP establishes a connection before data transfer and ensures that the data is received in the correct order.
    -   `Reliability`: TCP includes mechanisms for error detection, correction, and flow control to ensure reliable data transfer.
    -   `Stream-oriented`: TCP operates as a stream of bytes, ensuring that data is delivered as a continuous stream without dividing it into packets.
    -   `Use Case`: TCP is commonly used for applications that require a reliable and ordered data delivery mechanism, such as file transfer (FTP), email (SMTP), and web browsing.

    **2. UDP (User Datagram Protocol)**: User Datagram Protocol (UDP) is one of the core protocols in the Internet Protocol (IP) suite and operates at the transport layer. It is a connectionless, lightweight protocol designed for fast and efficient communication without the reliability mechanisms found in protocols like Transmission Control Protocol (TCP). Here are key characteristics and features of UDP:

    -   `Connectionless`: Unlike TCP, UDP does not establish a connection before sending data. Each UDP packet is sent independently, making it a connectionless protocol. This lack of connection setup reduces overhead but means there's no guarantee of delivery.
    -   `Unreliable`: UDP does not guarantee the delivery of packets, and it does not implement mechanisms for retransmission or acknowledgment. This makes UDP faster but less reliable compared to TCP.
    -   `Low Overhead`: UDP has lower overhead than TCP because it doesn't include features like flow control, error recovery, and congestion control. As a result, UDP is more suitable for applications where low latency and minimal delay are crucial.
    -   `Packet Structure`: UDP packets, often referred to as datagrams, have a simple structure. They consist of a header and data payload. The header includes source and destination port numbers, length information, and a checksum for error detection.
    -   `Port Numbers`: UDP uses port numbers to identify different services or processes on a device. Port numbers help in routing the data to the correct application.
    -   `Usage Scenarios`:
        -   `Real-Time Applications`: UDP is commonly used in real-time applications where low latency is crucial, such as online gaming, voice-over-IP (VoIP), and streaming media.
        -   `Broadcasts and Multicasts`: UDP is suitable for scenarios where broadcasting or multicasting is required.
        -   `Simple Request-Response Communication`: Applications that can tolerate occasional packet loss and don't require reliable, ordered delivery may choose UDP for simplicity.
        -   `Examples`: DNS (Domain Name System) uses UDP for name resolution, and various streaming protocols like RTP (Real-time Transport Protocol) use UDP for efficient data delivery.

    **2. IP (Internet Protocol)**: IP, or Internet Protocol, is a fundamental communication protocol that is used for transmitting data across networks. It is an essential part of the Internet Protocol Suite, which encompasses a set of protocols that govern how data is sent, received, and routed between devices on a network. It works at the network layer (Layer 3) of the OSI model.

    The Internet Protocol is designed to facilitate communication between devices by assigning unique numerical addresses to each device connected to a network. These numerical addresses are known as IP addresses. There are two versions of IP currently in use: IPv4 (Internet Protocol version 4) and IPv6 (Internet Protocol version 6). IPv4 addresses are 32-bit numerical labels, expressed as four sets of decimal numbers separated by dots (e.g., 192.168.1.1), while IPv6 addresses are 128-bit labels, expressed in hexadecimal format.

    -   `Connectionless`: Unlike TCP, IP is connectionless and does not establish a continuous connection before transmitting data.
    -   `Routing`: IP addresses are used to route data between devices on different networks. Routers make decisions based on IP addresses to forward packets to their intended destinations.
    -   `Use Case`: IP is the foundation for all communication on the Internet. It enables devices to send and receive data across networks using IP addresses.

    **3. HTTP (Hypertext Transfer Protocol)**: HTTP is an application layer protocol that governs the transfer of hypertext, typically in the form of web pages. It operates on top of the TCP/IP stack and is used for communication between web clients (browsers) and servers.

    -   `Stateless`: Each request from a client to a server is independent, and the server does not retain information about the client's state between requests.
    -   `Text-Based`: HTTP messages are text-based, making them human-readable. Requests and responses consist of headers and, optionally, a message body.
    -   `Request-Response Model`: A client sends an HTTP request to a server, and the server responds with the requested resource or an error message.
    -   `Use Case:`HTTP is the foundation of data communication on the World Wide Web. It enables the retrieval of web pages, images, videos, and other resources.

    **4. Relationship Between TCP, UDP, IP, and HTTP**:

    -   `Layered Architecture`:
        -   TCP and IP work together to provide end-to-end communication and routing across networks. TCP ensures reliable, ordered data delivery, while IP handles addressing and routing.
        -   HTTP operates at a higher layer (application layer) and utilizes the services of TCP/IP to transfer data reliably between web clients and servers.
    -   `Protocol Stack`:
        -   TCP and IP are foundational protocols in the TCP/IP protocol stack, which is the basis for communication on the Internet.
        -   HTTP operates on top of the TCP/IP stack, using TCP as its transport layer protocol to ensure reliable data transfer.

-   `IP Address`: An IP (Internet Protocol) address is a unique numeric identifier assigned to each device on a network. It allows devices to locate and communicate with each other on the Internet or within a local network.
-   `Subnetting`: Subnetting involves dividing a larger network into smaller, more manageable sub-networks. It helps optimize network performance, improve security, and organize IP address assignments.

    -   `Subnet`: A subnet, or subnetwork, is a logical subdivision of an IP network. This division is typically done to improve network performance, security, and management. Subnetting allows for the efficient use of IP addresses and helps in organizing and controlling network traffic. The size of a subnet is same as the size of it's CIDR block. To understand subnetting, it's important to grasp some key terms and concepts:
    -   `IP Address`: An IP address is a numerical label assigned to each device connected to a computer network that uses the Internet Protocol for communication. It serves two main purposes - host or network identification and location addressing.
    -   `Subnet Mask vs CIDR Notation`: Subnet masks and CIDR (Classless Inter-Domain Routing) notation are two different ways of representing network prefixes in IP addressing. They are used to define the boundaries between the network and host portions of an IP address. Both serve similar purposes but are expressed in different formats.

        -   `Subnet Mask`: A subnet mask is a 32-bit number that divides an IP address into network and host portions. It is represented using dotted decimal notation, just like an IP address. The subnet mask uses `1`s to represent the network portion of the address and `0`s for the host portion. For example, the subnet mask `255.255.255.0` means that the first 24 bits are used for network addressing and the remaining 8 bits are available for host addresses.

            -   Subnet masks are used to determine the range of IP addresses available for hosts within a specific subnet. Hosts with IP addresses falling within the same subnet share the same network characteristics.
            -   Routers use subnet masks to make routing decisions. When a router receives a packet, it looks at the destination IP address and subnet mask to determine the appropriate route to forward the packet.
            -   Subnet masks are often used in private network addressing (e.g., in a local area network) where certain address ranges are reserved for private use. Network Address Translation (NAT) is commonly used to map private addresses to a single public IP address when connecting to the internet.

        -   `CIDR (Classless Inter-Domain Routing)`: CIDR is a notation for expressing IP addresses and their associated `routing prefix`. It allows for a more flexible allocation of IP addresses than the older class-based system (Class A, B, and C networks). CIDR notation includes both the IP address and the length of the network prefix, separated by a slash ("/"). For example, `192.168.1.0/24` indicates that the first 24 bits are the network prefix, and the remaining 8 bits are for host addresses. The size of a CIDR block is $2^{32 − Prefix Length} = 2^{32 − 24} = 2^8$
        -   `Network Prefix`: A network prefix, often referred to simply as a "prefix," is a part of an IP address that represents the network itself. It is used in conjunction with a subnet mask or CIDR notation to define the boundaries between the network and host portions of an IP address.
        -   `Examples 1`:
            -   IP Address: 192.168.1.10
            -   Subnet Mask: 255.255.255.0
            -   CIDR notation: 192.168.1.0/24
            -   Network Prefix Length: 24
        -   `Examples 2`:
            -   IP Address: 10.0.0.5
            -   Subnet Mask: 255.255.255.128
            -   CIDR notation: 10.0.0.0/25
            -   Network Prefix Length: 25

    -   `Network Address`: The network address is the address representing the entire network. In a subnet, it is the base address, and typically the first usable IP address in a subnet is reserved for the network address.
    -   `Broadcast Address`: The broadcast address is a special address that allows information to be sent to all devices within a specific subnet. It is the highest address in the range and is often reserved for broadcasting messages to all hosts on the subnet.
    -   `Host Address Range`: The host address range represents the usable IP addresses within a subnet, excluding the network and broadcast addresses. This range is available for assignment to individual devices on the network.
    -   `VLSM (Variable Length Subnet Masking)`: VLSM allows for the use of different subnet masks on the same network address space. This is particularly useful when subnetting a larger network into smaller subnets with varying size requirements.
    -   `Supernetting`: Supernetting is the opposite of subnetting. It involves combining smaller network blocks into a larger, aggregated block. This can be useful for optimizing routing tables and reducing the number of entries in a routing table.

-   `Routing`: Routing is the process of directing data packets between different networks or sub-networks. Routers are devices that make routing decisions based on network topology and the destination IP address of the packets. Routing is a fundamental concept in computer networking that involves the process of determining the path for data to travel from its source to its destination across a network. Routing is crucial for the proper functioning of the internet and other interconnected networks. Here are key terms and concepts related to routing:

    -   `Router`: A router is a networking device that forwards data packets between computer networks. Routers operate at the network layer (Layer 3) of the OSI model and use routing tables to make decisions about where to forward packets based on destination IP addresses.
    -   `Routing Table`: A routing table is a data structure stored in a router that contains information about the available routes to various network destinations. The table includes entries specifying the next-hop router or the outgoing interface, along with metrics and other information used to determine the best path for packet forwarding.
    -   `Routing Protocol`: A routing protocol is a set of rules that routers use to communicate with each other and share information about the network's topology. Common routing protocols include OSPF (Open Shortest Path First), RIP (Routing Information Protocol), BGP (Border Gateway Protocol), and EIGRP (Enhanced Interior Gateway Routing Protocol).
    -   `Static Routing`: Static routing involves manually configuring the routing table on a router. Administrators define the routes and specify the next-hop router or outgoing interface. While simple, static routing can be less flexible and scalable compared to dynamic routing.
    -   `Dynamic Routing`: Dynamic routing protocols allow routers to automatically exchange information about network changes. This enables routers to dynamically adjust their routing tables based on factors like link failures, congestion, or changes in network topology. Dynamic routing protocols enhance scalability and adaptability.
    -   `Default Gateway`: The default gateway is the router that a device uses to reach destinations outside its own subnet. When a device wants to communicate with a host on another network, it sends the traffic to its default gateway, which then forwards the packets toward the destination.

-   `Switching`: Switching involves the process of forwarding data frames within a local network. Switches are devices that operate at the data link layer (Layer 2) of the OSI model and use MAC addresses for frame forwarding.
-   `Firewall`: A firewall is a security device or software that monitors and controls incoming and outgoing network traffic based on predetermined security rules. It helps protect a network from unauthorized access and potential security threats. A firewall is a barrier designed to prevent unauthorized access to or from a private network while allowing authorized communications. It can be implemented in both hardware (physical devices) and software (programs running on servers or network devices).

    -   `Packet Filtering`: Packet filtering is a basic form of firewall functionality that examines packets of data and determines whether to allow or block them based on specified criteria. These criteria often include source and destination IP addresses, port numbers, and the protocol type.
    -   `Stateful Inspection`: Stateful inspection, also known as dynamic packet filtering, goes beyond packet filtering by keeping track of the state of active connections. It makes decisions based on the context of the traffic, allowing or blocking packets based on their relationship to established connections.
    -   `Proxy Server`: A proxy server acts as an intermediary between client devices and the internet. It intercepts requests and responses, forwarding them on behalf of the clients. This provides an additional layer of security by hiding the internal network structure and potentially filtering and caching content.
    -   `Network Address Translation (NAT)`: NAT is a method used by firewalls to modify network address information in packet headers while in transit. It enables multiple devices on a local network to share a single public IP address, enhancing security and conserving IP address space.
    -   `Application Layer Filtering`: Firewalls with application layer filtering operate at the application layer (Layer 7 of the OSI model) and can inspect and control specific applications or protocols. This allows for more granular control over the types of traffic permitted or denied.
    -   `Intrusion Detection System (IDS) and Intrusion Prevention System (IPS)`: An IDS monitors network or system activities for malicious activities or security policy violations. An IPS goes a step further by actively preventing or blocking detected threats. Firewalls may incorporate IDS or IPS features for enhanced security.
    -   `DMZ (Demilitarized Zone)`: A DMZ is a network segment that sits between an organization's internal network and an external network, such as the internet. Servers and services that need to be accessible from the internet, like web servers, are often placed in the DMZ, separated from the internal network by firewalls.
    -   `Rule-Based Filtering`: Rule-based filtering involves defining a set of rules that dictate how the firewall should handle incoming and outgoing traffic. Rules can specify conditions such as source and destination IP addresses, port numbers, and the allowed protocols.
    -   `VPN (Virtual Private Network) Support`: Firewalls often include VPN support to facilitate secure communication over public networks. VPNs use encryption and tunneling protocols to create a secure connection, allowing remote users or branch offices to connect to the corporate network.
    -   `Logging and Auditing`: Firewalls maintain logs of network activity, which can be crucial for security analysis, troubleshooting, and compliance with regulations. Auditing features help organizations track and review firewall events and rule violations.
    -   `Application Layer Gateways (ALG)`: ALGs are components of firewalls that understand specific applications or services and can interpret and control the associated traffic. For example, an FTP ALG can intelligently handle File Transfer Protocol traffic.

-   `DNS (Domain Name System)`: DNS is a system that translates human-readable domain names (e.g., www.example.com) into IP addresses. It plays a crucial role in enabling users to access websites using domain names rather than numeric IP addresses.
-   `HTTP/HTTPS (Hypertext Transfer Protocol/Secure)`: HTTP is the protocol used for transmitting hypertext over the Internet. HTTPS is a secure version of HTTP that uses encryption (SSL/TLS) to ensure the confidentiality and integrity of data.
-   `API (Application Programming Interface)`: An API defines a set of rules and tools for building software applications. In a network context, APIs often enable communication and data exchange between different software systems.
-   `TCP (Transmission Control Protocol) and UDP (User Datagram Protocol)`: TCP and UDP are transport layer protocols in the TCP/IP suite. TCP provides reliable, connection-oriented communication, while UDP offers faster, connectionless communication with less overhead.
-   `Latency and Bandwidth`: Latency is the delay between the initiation of a network request and the receipt of the corresponding response. Bandwidth refers to the maximum rate at which data can be transmitted over a network.
-   `Secure Socket Layer/Transport Layer Security (SSL/TLS)`: SSL/TLS protocols provide secure communication over a computer network. In software engineering, developers implement SSL/TLS to encrypt data transmitted between clients and servers, ensuring confidentiality and integrity during data transfer.

    -   SSL (Secure Sockets Layer) and its successor TLS (Transport Layer Security) are cryptographic protocols designed to provide secure communication over a computer network, commonly the internet. SSL was developed by Netscape in the mid-1990s, and TLS is its standardized successor. These protocols ensure that the data exchanged between clients and servers remains private, integral, and secure. Here's how SSL/TLS contributes to network security:

    -   `Handshake Protocol`: The SSL/TLS handshake is the initial step in establishing a secure connection. During the handshake, the client and server exchange information, including supported cryptographic algorithms, session keys, and digital certificates. This process ensures that both parties agree on the security parameters for the communication.
    -   `Key Exchange`: SSL/TLS supports various methods of key exchange to establish a secure communication channel. This includes both asymmetric (public-key) and symmetric (shared secret) encryption. The key exchange methods are designed to secure the confidentiality of data during transmission.
    -   `Digital Certificates`: Digital certificates are a critical component of SSL/TLS, providing a means of authenticating the identity of the server. The server presents a digital certificate, typically signed by a trusted Certificate Authority (CA), to prove its legitimacy. This helps users verify that they are connecting to the intended and legitimate server.
    -   `Public-Key Infrastructure (PKI)`: SSL/TLS relies on a Public-Key Infrastructure for managing digital certificates and public/private key pairs. Certificate Authorities issue digital certificates, and clients use these certificates to verify the authenticity of the server's public key.
    -   `Encryption Algorithms`: SSL/TLS supports various encryption algorithms for securing data during transmission. This includes symmetric key algorithms (such as AES) for encrypting the actual data and asymmetric key algorithms (such as RSA) for secure key exchange during the handshake.
    -   `Session Management`: SSL/TLS can establish a secure session between a client and a server. Once the session is established, it allows for the efficient reuse of cryptographic parameters, reducing the overhead of repeated handshakes for subsequent connections.
    -   `Data Integrity`: SSL/TLS uses cryptographic hash functions to ensure the integrity of transmitted data. This means that any unauthorized modification or tampering with the data during transit can be detected by the recipient.
    -   `Cipher Suites`: A cipher suite is a combination of cryptographic algorithms used for key exchange, encryption, and authentication. SSL/TLS supports multiple cipher suites, and the negotiation during the handshake determines the most suitable one for the connection.
    -   `Perfect Forward Secrecy (PFS)`: Some implementations of SSL/TLS support Perfect Forward Secrecy, ensuring that the compromise of a long-term secret key does not compromise past or future session keys. This enhances the security of communications even if long-term keys are compromised.
    -   `HTTPS (HTTP Secure)`: SSL/TLS is commonly used to secure HTTP traffic, resulting in the HTTPS protocol. When a website uses HTTPS, the data exchanged between the user's browser and the server is encrypted and secured, providing a more secure browsing experience.
    -   `SSL/TLS Versions`: Over time, SSL and TLS have seen multiple versions, with each version introducing improvements in security and performance. It's important to use the latest and most secure versions, as older versions may have vulnerabilities.

#### OSI (Open Systems Interconnection):

The OSI (Open Systems Interconnection) model is a conceptual framework that standardizes the functions of a telecommunication or computing system into seven abstraction layers. Each layer represents a specific set of functions and protocols, and the model was developed to facilitate interoperability between different systems. Here are the seven layers of the OSI model along with key terms and concepts associated with each layer:

1. **Physical Layer (Layer 1)**: The physical layer deals with the transmission and reception of raw binary data over a physical medium such as cables or wireless signals. Key concepts include:

    - `Bit`: The basic unit of digital information, representing a 0 or 1.
    - `Voltage, Signal, Cable Types`: Physical aspects of data transmission.

2. **Data Link Layer (Layer 2)**: The data link layer provides error detection and correction, as well as framing and addressing of data packets. Key concepts include:

    - `Frames`: The data link layer organizes raw bits into frames, adding header and trailer information.
    - `MAC Address`: Media Access Control address uniquely identifies devices on a network.
    - `Switches and Bridges`: Devices operating at the data link layer to forward frames within a local network.

3. **Network Layer (Layer 3)**: The network layer is responsible for logical addressing, routing, and forwarding of packets between different networks. Key concepts include:

    - `IP Address`: Internet Protocol address used for network layer addressing.
    - `Routing`: Process of determining the best path for data to travel between source and destination networks.
    - `Routers`: Devices that operate at the network layer to route data between different networks.

4. **Transport Layer (Layer 4)**: The transport layer ensures end-to-end communication, error recovery, and flow control between devices on different networks. Key concepts include:

    - `Segments`: The transport layer breaks down data from the upper layers into segments.
    - `TCP (Transmission Control Protocol)`: Connection-oriented protocol providing reliable, ordered delivery of data.
    - `UDP (User Datagram Protocol)`: Connectionless protocol offering faster, but less reliable, data delivery.

5. **Session Layer (Layer 5)**: The session layer manages and terminates sessions (communication links) between applications. It establishes, maintains, and synchronizes the dialogue between two devices. Key concepts include:

    - `Dialog Control`: Manages sessions, allowing for full-duplex or half-duplex communication.
    - `Session Establishment, Maintenance, and Termination`: Handles the creation, maintenance, and closure of sessions.

6. **Presentation Layer (Layer 6)**: The presentation layer is responsible for data translation, encryption, and compression to ensure that data is presented in a readable format. Key concepts include:

    - `Data Encryption and Compression`: Ensures secure and efficient data transfer.
    - `Translation Services`: Converts data formats between the application and lower layers.

7. **Application Layer (Layer 7)**: The application layer provides a network interface for application software. It enables communication between software applications on different devices. Key concepts include:
    - `Network Services`: Provides network services directly to end-users or applications.
    - `Protocols`: Application layer protocols like HTTP, FTP, SMTP, and DNS.

Understanding the OSI model helps in conceptualizing the various functions and interactions that occur within a networked system. It serves as a reference framework for discussing and designing network architectures and protocols, aiding in the development of interoperable and modular networking technologies.

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Security Measures & Vulnerabilitis</summary>

### What is CSRF (Cross-Site Request Forgery)?

Cross-Site Request Forgery (CSRF) is a security vulnerability that occurs when an attacker tricks a user's browser into making an unwanted request to a web application where the user is authenticated. This attack takes advantage of the fact that web browsers automatically include all relevant cookies for a specific domain in every HTTP request sent to that domain.

Here's a step-by-step explanation of how a CSRF attack works:

-   `Authentication`: The victim logs into a web application, and the application issues a session cookie to the user to keep them authenticated.

-   `Attacker's Preparation`: The attacker creates a malicious webpage or embeds malicious code into a website that the victim visits.

-   `Unwanted Request`: When the victim visits the attacker's webpage or the compromised site, the malicious code on the page triggers a request to the vulnerable web application where the victim is authenticated.

-   `Automatic Inclusion of Cookies`: Because the victim is already authenticated with the web application, the victim's browser automatically includes the authentication cookies in the request.

-   `Execution of Unwanted Action`: The web application, unaware that the request did not originate from the legitimate user, processes the request as if it were a legitimate action initiated by the user.

CSRF attacks are particularly dangerous when they involve actions that cause state changes on the server, such as changing a user's password, transferring funds, or making a purchase.

To protect against CSRF attacks, web applications can implement measures like:

-   `Anti-CSRF Tokens`: Include a unique, random token in each form or request that modifies server state. The token is verified on the server side to ensure that the request is legitimate.

-   `SameSite Cookie Attribute`: Set the SameSite attribute on cookies to 'Strict' or 'Lax'. This restricts how cookies are sent with cross-site requests, mitigating the risk of CSRF.

-   `Referrer Policy`: Set an appropriate Referrer Policy to control which information is included in the Referer header. This helps prevent certain types of CSRF attacks.

-   `Use of HTTP Methods`: Ensure that state-changing requests use HTTP methods that have side-effect semantics (such as POST or DELETE) rather than safe methods like GET.

In Flask, you can use the flask-wtf extension, along with its CSRF protection features, to guard against CSRF attacks. Here's a simple example:

```python
from flask import Flask, render_template
from flask_wtf import FlaskForm
from wtforms import StringField

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'  # Replace with a strong, secret key

class MyForm(FlaskForm):
    username = StringField('Username')

@app.route('/', methods=['GET', 'POST'])
def index():
    form = MyForm()

    if form.validate_on_submit():
        # Process the form data securely
        return f'Hello, {form.username.data}!'

    return render_template('index.html', form=form)

if __name__ == '__main__':
    app.run(debug=True)
```

In this example, the FlaskForm from flask-wtf automatically includes a CSRF token in the form, providing protection against CSRF attacks when submitting the form.

### What is CORS (Cross-Origin Resource Sharing)?

Cross-Origin Resource Sharing (CORS) is a security feature implemented by web browsers that controls how web pages from one domain can request and interact with resources from another domain. The Same-Origin Policy (SOP) is a security measure that restricts web pages from making requests to a different domain than the one that served the web page. CORS is a mechanism to relax this restriction selectively.

When a web page hosted on one domain makes an HTTP request to a different domain, the browser, by default, blocks the request due to the Same-Origin Policy. CORS allows servers to specify which origins are permitted to access their resources, and which HTTP methods (e.g., GET, POST, PUT) and headers can be used in cross-origin requests.

Here's how CORS works:

-   `Browser Pre-flight Request`: Before making certain types of cross-origin requests, the browser may send a pre-flight request (using the HTTP OPTIONS method) to the target server. This pre-flight request includes information about the actual request, such as the HTTP method and headers.

-   `Server Response Headers`: The server responds to the pre-flight request with specific HTTP headers that indicate which origins are allowed, which methods are permitted, and which headers can be included in the actual request.

-   `Actual Request`: If the server's response headers permit the cross-origin request, the browser proceeds with the actual request. Otherwise, the browser blocks the request.

In a Flask application, you may encounter CORS-related issues if your frontend code (hosted on a different domain) tries to make requests to your Flask API. To handle CORS in a Flask application, you can use the flask-cors extension, which simplifies the process of adding the necessary headers to responses.

Here's an example of how to use flask-cors to enable CORS in a Flask application:

```python
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api/data', methods=['GET'])
def get_data():
    data = {'message': 'This is a sample API response.'}
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
```

In this example, the CORS(app) line adds the necessary headers to responses to allow cross-origin requests from any origin. You can also customize CORS settings based on your specific requirements.

Keep in mind that enabling CORS should be done carefully, and it's important to specify only the origins, methods, and headers that are necessary for your application's functionality to avoid potential security risks.

### What is Cross-Site Scripting (XSS)?

-   `Autoescaping`: Autoescaping is the concept of automatically escaping special characters for you. Special characters in the sense of HTML (or XML, and thus XHTML) are &, >, <, " as well as '. Because these characters carry specific meanings in documents on their own you have to replace them by so called “entities” if you want to use them for text. Not doing so would not only cause user frustration by the inability to use these characters in text, but can also lead to security problems.
-   [Flask: Cross-Site Scripting (XSS)](https://flask.palletsprojects.com/en/2.3.x/security/#security-xss)

Cross-Site Scripting (XSS) is a security vulnerability that allows attackers to inject malicious scripts into web pages viewed by other users. The primary goal of XSS attacks is to execute scripts in the context of a user's browser, enabling the attacker to steal sensitive information, manipulate page content, or perform actions on behalf of the victim.

There are three main types of XSS attacks:

-   `Stored XSS (Persistent XSS)`: In a stored XSS attack, the malicious script is permanently stored on the target server and served to users when they access a particular page. This could happen, for example, if an attacker injects malicious code into a forum post, comment, or user profile.

-   `Reflected XSS (Non-Persistent XSS)`: In a reflected XSS attack, the malicious script is embedded in a URL, a form input, or another input field. When the victim clicks on a manipulated link or submits a form, the script is included in the server's response and executed in the victim's browser.

-   `DOM-based XSS`: DOM-based XSS occurs when the client-side script manipulates the Document Object Model (DOM) of a web page. This can happen when the application processes user input to dynamically update the DOM without properly validating or sanitizing the input.

Here's a simple example of a reflected XSS attack:

```html
<!-- Malicious URL -->
https://example.com/search?query=
<script>
    alert("XSS");
</script>

<!-- Rendered HTML in the victim's browser -->
<p>
    Search results for:
    <script>
        alert("XSS");
    </script>
</p>
```

In this example, an attacker includes a script in the query parameter of a URL. If a user clicks on this link, the script is executed in the context of the victim's browser, leading to an alert box with the message 'XSS'.

To prevent XSS attacks, web developers should adopt secure coding practices:

-   `Input Validation`: Validate and sanitize all user inputs on the server side to ensure they do not contain malicious scripts. Use libraries or frameworks that automatically escape or sanitize input data.

-   `Output Encoding`: Encode data appropriately before rendering it in HTML, JavaScript, or other contexts to prevent the execution of scripts. This can be achieved using functions such as htmlspecialchars in PHP or libraries like Jinja in Python.

-   `Content Security Policy (CSP)`: Implement Content Security Policy headers to restrict the types of content that can be executed on a web page. CSP allows developers to define a whitelist of trusted sources for scripts, styles, and other resources.

-   `HTTP-Only Cookies`: Set the HTTP-Only flag on cookies to prevent them from being accessed by client-side scripts, reducing the risk of cookie theft in case of an XSS attack.

-   `Secure Coding Practices`: Follow secure coding practices and conduct regular security audits to identify and mitigate potential vulnerabilities in the application code.

By incorporating these practices, developers can significantly reduce the risk of XSS vulnerabilities and enhance the security of their web applications.

### What is SQL Injection?

SQL injection is a type of security vulnerability that occurs when an attacker is able to manipulate an application's SQL query by injecting malicious SQL code. This is a serious security issue because it allows unauthorized access, manipulation, or deletion of data in a database.

In the context of a Python Flask application, SQL injection can occur if the application constructs SQL queries using user-supplied input without properly validating or sanitizing that input. Flask applications often use an Object-Relational Mapping (ORM) system like SQLAlchemy, which helps prevent SQL injection by automatically parameterizing SQL queries.

Here's an example of how SQL injection might occur in a Flask application if not properly handled:

```python
from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///example.db'
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

@app.route('/login')
def login():
    username = request.args.get('username')
    password = request.args.get('password')

    # Vulnerable to SQL injection
    user = User.query.filter_by(username=username, password=password).first()

    if user:
        return 'Login successful'
    else:
        return 'Login failed'
```

In the above example, the login route takes username and password parameters from the request's query string and uses them directly in the SQL query. An attacker could manipulate the values of these parameters to inject malicious SQL code, potentially bypassing authentication.

To prevent SQL injection in Flask applications, it's crucial to use parameterized queries provided by the ORM or to employ safe query-building practices. Here's an improved version of the above example using SQLAlchemy parameterized queries:

```python
from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///example.db'
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

@app.route('/login')
def login():
    username = request.args.get('username')
    password = request.args.get('password')

    # Using parameterized query to prevent SQL injection
    query = text("SELECT * FROM user WHERE username = :username AND password = :password")
    user = db.engine.execute(query, {'username': username, 'password': password}).first()

    if user:
        return 'Login successful'
    else:
        return 'Login failed'
```

In this improved version, the query is constructed using the text function, and placeholders :username and :password are used. The actual values are provided separately, preventing SQL injection attacks. Always follow secure coding practices to mitigate security vulnerabilities like SQL injection in your Flask applications.

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Deployment</summary>

-   [How to use Django with uWSGI](https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/uwsgi/)
-   [How to use Django with Gunicorn](https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/gunicorn/)
-   [Setting up Django and your web server with uWSGI and nginx](https://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html#)
-   [Deploying Django with Docker Compose](https://www.youtube.com/watch?v=mScd-Pc_pX0&t=1928s)

---

-   `Gunicorn` vs `uWSGI` vs `Uvicorn`: `Gunicorn`, `uWSGI` and `Uvicorn` are popular Python WSGI (Web Server Gateway Interface) servers that are commonly used to serve Python web applications.
    -   **Gunicorn** (short for Green Unicorn) is a Python WSGI HTTP server that is designed to be lightweight, fast, and easy to use. It can handle multiple requests concurrently and can scale to handle large numbers of requests. `Gunicorn` is commonly used in conjunction with a reverse proxy server, such as `Nginx` or `Apache`, which handles incoming requests and passes them on to `Gunicorn`.
    -   **uWSGI** is a more feature-rich WSGI server that is designed to be highly configurable and extensible. It supports multiple protocols and interfaces, including WSGI, FastCGI, and HTTP. `uWSGI` is known for its ability to handle high traffic volumes and its support for a variety of advanced features, including load balancing, caching, and process management.
    -   **Uvicorn**: Uvicorn is an ASGI (Asynchronous Server Gateway Interface) server that is used to run asynchronous web applications written in Python. ASGI is a specification for asynchronous web servers and applications, allowing for better support of long-lived connections and real-time communication.
-   `Apache` is a popular web server that has been around for a long time. It is widely used and supports a wide range of features and modules, making it highly configurable and adaptable to different use cases. `Apache` is primarily used for serving static content and dynamic content through the use of modules such as PHP or Python.
-   `Nginx` is a newer web server that has gained popularity in recent years due to its high performance and scalability. `Nginx` is designed to handle large volumes of traffic and can serve both static and dynamic content. `Nginx` is often used as a reverse proxy in front of other web servers, such as `Apache` or `Tomcat`, to improve performance and reliability.
-   `Tomcat` is a Java-based web server and application server that is designed to serve Java applications. It supports the Java Servlet and JavaServer Pages (JSP) specifications and is often used to serve Java web applications. `Tomcat` is highly configurable and can be extended through the use of plugins and modules.

#### `Proxy Server` vs `Reverse Proxy Server`:

-   `Proxy Server`: A proxy server acts as an intermediary between a client and a server. When a client makes a request to access a resource (e.g., a web page), the request is first sent to the proxy server. The proxy server then forwards the request to the destination server on behalf of the client. The response from the server is relayed back to the client through the proxy server. A proxy server can reside in various locations within a network architecture, depending on its intended purpose and the network's configuration; for example, On-Premises Network, Data Center, Cloud Environment, Content Delevary Networks (CDNs) etc. The key characteristics of a proxy server include:

    -   `Client-side configuration`: The client needs to be aware of and configured to use the proxy server.
    -   `Client anonymity`: The server sees the proxy server's IP address instead of the client's IP address.
    -   `Caching`: Proxy servers can cache responses, allowing subsequent requests for the same resource to be served directly from the cache instead of going to the server again.
    -   Proxy servers are often used for purposes such as improving performance through caching, controlling access to resources (e.g., content filtering, firewall), and providing anonymity for clients.

-   `Reverse Proxy Server`: A reverse proxy server is similar to a proxy server but operates on the server-side instead of the client-side. It sits between the client and the destination server and forwards client requests to the appropriate backend servers based on various criteria (e.g., load balancing, request routing, SSL termination). The client is unaware of the presence of the reverse proxy and communicates directly with it. The key characteristics of a reverse proxy server include:

    -   `Server-side configuration`: The server is configured to use the reverse proxy to handle incoming requests.
    -   `Load balancing`: Reverse proxies distribute client requests across multiple backend servers to balance the load.
    -   `SSL termination`: Reverse proxies can handle SSL encryption/decryption, offloading this task from backend servers.
    -   `Caching`: Reverse proxies can also cache responses to improve performance.
    -   Reverse proxy servers are commonly used for load balancing, high availability, SSL termination, request routing, and as a security layer protecting backend servers by shielding them from direct access.

-   The image below show how 'client', 'Nginx', and 'uWSGI' work together.

    -   ![server configuration for Django](/assets/django/nginx-uwsgi.webp)

#### `Reverse Proxy Server` vs `Web Server Gateway Interface` (WSGI):

A Reverse Proxy Server and a Web Server Gateway Interface (WSGI) serve different roles in web application architecture, but they are complementary components. Here's a comparison of the two:

-   `Reverse Proxy Server`: A reverse proxy server is a server that sits between client devices and backend web servers. It receives incoming client requests, such as HTTP requests, and forwards those requests to the appropriate backend server or application.

    -   `Purpose`:

        -   `Load Balancing`: Reverse proxies can distribute client requests across multiple backend servers to balance the load and improve performance and reliability.
        -   `Security`: They can provide an additional layer of security by hiding the internal structure of the network and filtering out malicious traffic.
        -   `SSL Termination`: Reverse proxies can handle SSL/TLS encryption and decryption, offloading this resource-intensive task from the backend servers.
        -   `Caching`: They can cache frequently requested content to reduce the load on backend servers and improve response times.

    -   `Examples`: `Nginx` and `Apache` HTTP Server are commonly used as reverse proxy servers. CDNs (Content Delivery Networks) often use reverse proxies to cache and serve static content.

-   `Web Server Gateway Interface (WSGI)`: WSGI is a specification in Python that defines a standard interface between web servers and web applications or frameworks. It allows web servers to communicate with Python web applications in a consistent and standardized way.

    -   `Purpose`:

        -   WSGI serves as an interface between a web server and a Python web application or framework.
        -   It allows different web servers to run Python web applications written using various frameworks, such as Flask, Django, or Pyramid.

    -   `Examples`: Popular Python web servers like `Gunicorn`, `uWSGI`, and `mod_wsgi` (for Apache) implement the WSGI standard. Python web frameworks, including Flask and Django, can be deployed using WSGI servers.

-   `Relationship`:

    -   `A reverse proxy server and WSGI serve different but complementary roles`:

        -   The reverse proxy server handles tasks like load balancing, SSL termination, and security at the network level, sitting between clients and backend servers.
        -   WSGI, on the other hand, handles the communication between a web server and a Python web application at the application level, allowing the Python code to receive and process HTTP requests.

    -   In a typical web application architecture, a reverse proxy server (e.g., Nginx) may be used to handle tasks like load balancing and SSL termination, while a WSGI server (e.g., Gunicorn or uWSGI) interfaces with the Python web application to serve dynamic content.

In summary, a reverse proxy server and WSGI serve different purposes in web application architecture. The reverse proxy manages network-level tasks, while WSGI provides a standardized interface for communication between web servers and Python web applications. Together, they enable the deployment of Python web applications in a scalable and secure manner.

#### ASGI (Asynchronous Server Gateway Interface):

ASGI is a specification for asynchronous web servers and frameworks in Python. It allows Python web applications to handle asynchronous operations, such as long-lived connections and real-time communication, in an efficient and non-blocking manner.

ASGI servers are the web servers that implement the ASGI specification. These servers are responsible for handling incoming ASGI requests and routing them to the appropriate ASGI application or framework. Some popular ASGI servers include Daphne, Uvicorn, Hypercorn, and more. Uvicorn, for example, is widely used and known for its simplicity and performance.

-   `Purpose`:

    -   ASGI is designed to handle asynchronous web applications and services that require real-time interactions, like chat applications, streaming, and server-sent events.
    -   It provides a standardized interface for handling asynchronous HTTP requests and WebSocket connections.

-   `Usage`:

    -   ASGI servers are commonly used with asynchronous web frameworks like FastAPI and Starlette to build high-performance web applications that require real-time capabilities.
    -   To run an ASGI application with a server like Uvicorn, you typically use a command like this:

        -   `$ uvicorn myapp:app --host 0.0.0.0 --port 8000`
        -   In this example, myapp is the Python module containing your ASGI application, and app is the instance of your ASGI application within that module.

<details open><summary style="font-size:18px;color:Orange;text-align:left">Gunicorn (Green Unicorn)</summary>

-   [https://docs.gunicorn.org/en/latest/settings.html](https://docs.gunicorn.org/en/latest/settings.html)
-   `gunicorn.socket` vs `gunicorn.service`: these are systemd units used for running Gunicorn, a Python WSGI HTTP server. They serve different purposes within the systemd service management system.

    -   `gunicorn.socket`: This file represents a Socket Unit which nanage inter-process communication through sockets. It defines a system socket that listens for incoming connections and passes them to the associated service unit (`gunicorn.service`). The `gunicorn.socket` unit allows systemd to manage the socket activation process, where the socket is created on-demand when a connection is received. This helps improve resource usage by only starting the Gunicorn process when needed.
    -   `gunicorn.service`: This file represents a Service Unit. It defines the Gunicorn service that handles the incoming connections received through the associated socket (`gunicorn.socket`). The `gunicorn.service` unit specifies the command to start the Gunicorn process, along with its configuration options and other settings.

-   `$ gunicorn core.wsgi:application --bind 0.0.0.0:8000`
-   `$ gunicorn core.wsgi:application --config ./gunicorn_config.py`

</details>

---

<details open><summary style="font-size:18px;color:Orange;text-align:left">uvicorn</summary>

-   `uvicorn myapp:app --host 0.0.0.0 --port 8000`

    -   `myapp` refers to the Python module containing your ASGI application.
    -   `app` is the instance of your ASGI application within that module.
    -   `--host` and `--port` options specify the host and port on which `uvicorn` should listen.

</details>

---

<details open><summary style="font-size:18px;color:Orange;text-align:left">uWSGI</summary>

-   [uWSGI (universal Web Server Gateway Interface)](https://uwsgi-docs.readthedocs.io/en/latest/index.html): It's a popular web server interface and application server gateway that facilitates communication between web servers and web applications, allowing them to work together seamlessly. uWSGI is commonly used in deploying Python web applications, but it supports multiple programming languages and frameworks.

-   What is `uwsgi_params` file?

    -   The `uwsgi_params` file is a configuration file used by uWSGI, which is a fast and flexible application server commonly used for hosting Python web applications. The `uwsgi_params` file contains a set of predefined variables and configurations that are used to communicate between the web server (such as Nginx) and the uWSGI application server.
    -   The contents of the `uwsgi_params` file typically include directives that define how certain aspects of the communication between Nginx and uWSGI should be handled. These directives often include settings related to request buffering, proxying, and headers.
    -   Some common directives found in the `uwsgi_params` file include:

        -   `uwsgi_param QUERY_STRING $query_string;`

            -   This directive sets the value of the QUERY_STRING variable to the value of the query string provided in the original HTTP request.

        -   `uwsgi_param REQUEST_METHOD $request_method;`

            -   This directive sets the value of the REQUEST_METHOD variable to the HTTP request method (e.g., GET, POST, etc.).

        -   `uwsgi_param CONTENT_TYPE $content_type;`

            -   This directive sets the value of the CONTENT_TYPE variable to the type of the content being sent in the request, such as "application/json" or "text/html".

        -   `uwsgi_param CONTENT_LENGTH $content_length;`
            -   This directive sets the value of the CONTENT_LENGTH variable to the size of the content being sent in the request.

    -   These directives are used to pass information from Nginx to the uWSGI application server, enabling proper handling of requests and responses.
    -   The `uwsgi_params` file is typically included in the Nginx configuration when using uWSGI as the application server. It ensures that the necessary variables and configurations are available for the communication between Nginx and uWSGI to work correctly.
    -   It's important to note that the specific contents of the `uwsgi_params` file can vary depending on the configuration and requirements of your specific application or environment.

</details>

---

<details open><summary style="font-size:18px;color:Orange;text-align:left">Nginx</summary>

-   [Learn Proper NGINX Configuration Context Logic](https://www.youtube.com/watch?v=C5kMgshNc6g&t=683s)
-   [How to Deploy Django on Nginx with uWSGI (full tutorial)](https://www.youtube.com/watch?v=ZpR1W-NWnp4&t=21s)

#### Terms and Concepts

-   `nginx.conf`: The nginx configuration file, typically named `nginx.conf`, is a text-based file that specifies how the Nginx web server should behave. The `nginx.conf` file is written in a language called NGINX configuration language or NGINX Configuration Syntax. It is a custom configuration syntax specific to NGINX. It contains a set of directives within different contexts to specify their scope and define various aspects of server functionality, such as server listening ports, request handling, load balancing, caching, and security settings. The main contexts in an `nginx.conf` file are:

-   `default.conf.tpl`: It is a template file for a server block configuration in Nginx. A server block (also known as a virtual host) is a configuration that defines how Nginx should handle requests for a specific domain or IP address. The ".tpl" extension suggests that this file is a template that can be used to generate an actual default.conf file. Typically, you would have multiple `*.conf.tpl` files, each representing a different virtual host configuration template.

-   `Main Context`: The main context includes directives that apply globally to the entire Nginx server. It is typically defined within the http block. Directives within this context affect the overall behavior of the server, such as the number of worker processes, the user and group that the server runs as, and the configuration for logging. It typically contains directives such as server, upstream, and include.

    -   ![Main Context](/assets/nginx/main-context.png)

-   `Events Context`: The events context, also defined within the http block, is used to configure how Nginx handles connections and events. Directives in this context control parameters such as the maximum number of connections, the worker connections, and the multi_accept setting.

-   `HTTP Context`: The HTTP context contains server-level configurations and is defined within the http block. It includes directives related to HTTP protocol settings, server-wide proxies, gzip compression, SSL/TLS settings, and default MIME types. Server blocks (virtual servers) are typically defined within the HTTP context.

-   `Server Context`: The server context defines the configuration for a specific virtual server (server block). It is contained within the http context and includes directives that apply to a particular server or group of servers. Directives within the server context may include the server name, listening ports, SSL/TLS configurations, proxy settings, and location blocks.

-   `Location Context`: The location context is defined within a server context and is used to configure how Nginx handles specific URL patterns or paths. Directives within the location context determine how requests matching the specified pattern are processed. Examples of directives within the location context are root, try_files, proxy_pass, rewrite, and access control directives such as allow and deny.

-   `Directive`: A directive is a command that configures a specific aspect of the server's behavior. Each directive is placed within the appropriate context to ensure it is applied at the desired level, whether it is server-wide, specific to a virtual server, or for handling requests matching a particular URL pattern. The context hierarchy and directive placement allow for fine-grained control over the server's behavior and functionality. It's important to note that the structure and directives in the `nginx.conf` file may vary depending on the specific setup and requirements of your web server. Understanding the purpose and proper usage of each directive is essential for configuring Nginx to meet your application's needs. Examples of commonly used directives are:

    -   ![Directives](/assets/nginx/directives.png)

    -   `listen`: Specifies the IP address and port on which Nginx should listen for incoming requests.
    -   `server_name`: Defines the domain name(s) associated with the server block.
    -   `root`: Specifies the document root directory where static files are located.
    -   `proxy_pass`: Forwards requests to a specified backend server.
    -   `try_files`: Defines the fallback behavior for file requests that do not exist.
    -   `ssl_certificate and ssl_certificate_key`: Configures SSL/TLS certificates for secure connections.
    -   `gzip`: Enables compression of HTTP responses to reduce file size.
    -   `access_log and error_log`: Specifies the log file locations for access and error logging.

-   `Block` vs `Context`: In Nginx configuration files, the terms "block" and "context" are often used interchangeably to refer to a section of directives that serve a specific purpose. The distinction between blocks and contexts can be a bit nuanced, but in general, blocks refer to the specific groups of directives enclosed within curly braces, while contexts refer to the overall hierarchical structure and scope of the configuration file.

-   `Block`: A block in Nginx refers to a group of directives enclosed within curly braces {}. Blocks define the scope and boundaries of a configuration section and determine where directives are applicable. There are several types of blocks in an nginx.conf file:

-   `Include Directive`: The include directive in Nginx is used to include external configuration files within the main `nginx.conf` file. It allows you to split your configuration into multiple files for better organization and easier maintenance. Using the include directive can help simplify the management of complex configurations by dividing them into smaller, modular files. It allows you to reuse common configurations across multiple server blocks, separate different aspects of the configuration, and make it easier to maintain and update your Nginx setup. Here's how the include directive works:

    -   `Syntax`: The include directive is written as follows:

        ```txt
        include file_path;
        ```

        -   `file_path` represents the path to the external configuration file you want to include. It can be an absolute path or a relative path to the nginx.conf file.

    -   `Usage`: The include directive can be used in various contexts within the nginx.conf file. For example:

        -   `Global context`: It can be placed in the main http block of the nginx.conf file to include global configurations that apply to the entire server.
        -   `Server context`: It can be placed within individual server blocks to include server-specific configurations.
        -   `Location context`: It can be placed within location blocks to include specific configuration snippets related to handling requests for specific URL patterns.

    -   `Multiple Includes`: You can use multiple include directives to include multiple configuration files. They can be specified in the same context or in different contexts, depending on where you want the configurations to apply. For example:

        ```txt
        include /path/to/file1.conf;
        include /path/to/file2.conf;
        ```

    -   `Wildcard Includes`: The include directive also supports wildcard patterns (_) to include multiple files that match a specific pattern. For example, you can use include /path/to/_.conf; to include all configuration files with the .conf extension in the specified directory.

#### Basic Nignx Commands

-   `$ nginx -v` → Check Nginx version
-   `$ sudo nginx -t` → Check configuration file syntex before reloading
-   `$ nginx -T` → Display current configuration
-   `$ nginx -s reload` → Reload Nginx

#### Configuration file

-   `/ect/nginx/nginx.conf` → Main file location of Nginx
-   `/ect/nginx/conf.d/*.conf` → Include file location of Nginx

</details>
</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">SDLC (Software Development Life Cycle)</summary>

The Software Development Life Cycle (SDLC) is a structured framework that outlines the phases and processes involved in the development of software applications or systems. It provides a systematic approach to software development, from the initial concept to maintenance and eventual retirement of the software. Let's explore the SDLC in detail:

1. `Planning Phase`:

    - `Project Initiation`: This phase begins with the identification of a need or an opportunity for a software solution. It involves creating a project proposal, defining goals, and determining the project's feasibility.
    - `Requirements Gathering`: During this stage, project stakeholders, including end-users and clients, collaborate with the development team to collect and document detailed requirements for the software.

1. `Feasibility Study`:

    - An evaluation is performed to determine the technical, operational, and economic feasibility of the project. This assessment helps in deciding whether to proceed with the project.

1. `Design Phase`:

    - `System Design`: This involves creating a high-level design of the system, including architecture, data structures, and the overall system structure.
    - `Detailed Design`: In this stage, the high-level design is further refined, specifying data formats, algorithms, and interfaces in greater detail.

1. `Implementation (Coding) Phase`:

    - Developers write the code according to the detailed design specifications. They follow coding standards and best practices to ensure the code is maintainable and efficient.
    - Unit testing is conducted during this phase to ensure individual components work correctly.

1. `Testing Phase`:

    - `Unit Testing`: Developers test individual modules or components to verify their correctness.
    - `Integration Testing`: The different modules or components are integrated, and testing is performed to identify any issues in their interactions.
    - `System Testing`: The entire system is tested to ensure it meets the specified requirements.
    - `User Acceptance Testing (UAT)`: End-users or clients perform testing to validate that the software meets their expectations.

1. `Deployment Phase`:

    - The software is deployed to the production environment, making it accessible to end-users.
    - This may involve data migration, configuration, and setting up the necessary infrastructure.

1. `Maintenance and Support Phase`:

    - After deployment, ongoing maintenance, support, and updates are provided to address issues, enhance functionality, and ensure the software remains reliable and secure.

1. `Evaluation Phase`:

    - At various points in the SDLC, the project is evaluated to ensure it aligns with its initial goals, meets quality standards, and remains on schedule and within budget.
    - Any necessary adjustments or corrective actions are taken based on these evaluations.

1. `Documentation`:

    - Throughout the SDLC, documentation is crucial. It includes design documents, user manuals, technical guides, and other documentation that aids in software understanding, maintenance, and training.

1. `Communication and Collaboration`:

    - Effective communication and collaboration among stakeholders, including developers, testers, project managers, and end-users, are critical throughout the SDLC to ensure that everyone is aligned with project goals and progress.
    - SDLC models, such as Waterfall, Agile, and DevOps, provide different approaches to the software development process, each with its own set of principles and practices. The choice of SDLC model depends on the project's specific requirements, scope, and constraints.

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">Software Development Methodology</summary>

Software Development Approaches also known as software development methodologies or models, define the overall process and structure for developing software applications. Different approaches have evolved over time to address various project requirements, team dynamics, and development challenges. Here are some commonly used software development approaches:

Agile, Scrum, and Kanban are all software development methodologies, but they have different approaches and are best suited for different types of projects and teams. Let's compare these methodologies:

1. `Agile Methodology`:

    - `Overview`: Agile is a broad and flexible approach to software development that emphasizes iterative, customer-centric, and collaborative development.
    - `Key Principles`: Customer collaboration, responding to change, delivering working software, and individuals and interactions over processes and tools.
    - `Project Management`: Agile doesn't prescribe specific roles or processes but encourages self-organizing teams to choose their own methods.
    - `Iterations`: Agile work is organized into short iterations or sprints, which typically last 2-4 weeks.
    - `Adaptability`: Agile is highly adaptable to changing requirements and is suitable for projects with evolving or uncertain needs.

2. `Scrum Methodology`:

    - `Overview`: Scrum is a specific framework within the Agile methodology, focusing on team collaboration, product backlog, and time-boxed sprints.
    - `Roles: Scrum defines specific roles`: Product Owner (managing the product backlog), Scrum Master (facilitating the team), and Development Team.
    - `Artifacts`: Scrum uses artifacts like the Product Backlog (list of requirements), Sprint Backlog (list of tasks for a sprint), and the Increment (the potentially shippable product at the end of each sprint).
    - `Events`: Scrum prescribes specific events, such as Sprint Planning, Daily Standup, Sprint Review, and Sprint Retrospective.
    - `Advantages`: Clear roles and responsibilities, transparency, regular inspection, and adaptation.
    - `Disadvantages`: May not fit all project types, can be challenging to implement if the team isn't self-organizing.

3. `Kanban Methodology`:

    - `Overview`: Kanban is a visual approach to managing work and emphasizes a pull system with continuous delivery.
    - `Principles`: Kanban principles include visualizing workflow, limiting work in progress, making policies explicit, managing flow, and making process improvements.
    - `Roles`: Kanban does not prescribe specific roles and is often used to optimize existing processes.
    - `Board`: Work items are visualized on a Kanban board, with columns representing stages of work (e.g., to-do, in progress, done).
    - `Advantages`: Flexibility, visual project tracking, focus on efficiency.
    - `Disadvantages`: Less structure, may require strong self-discipline.

4. `Waterfall Model`:

    1. The Waterfall model follows a linear, sequential approach to software development.
    2. It consists of distinct phases, such as requirements gathering, design, implementation, testing, and deployment, with each phase dependent on the completion of the previous one.
    3. Waterfall is characterized by its upfront planning, well-defined deliverables, and limited customer involvement during development.
    4. It is often suitable for projects with stable and well-understood requirements, where change is minimal or controlled.

5. `DevOps`:

    1. DevOps is a combination of development and operations, focusing on seamless collaboration between development and IT operations teams.
    2. It aims to automate software development processes, improve deployment frequency, and enhance overall software quality.
    3. DevOps emphasizes continuous integration, continuous delivery (CI/CD), and close alignment between development and operations.

6. `Which One to Choose`:

    - `Agile`: Choose Agile when you need flexibility and adaptability for projects with changing or evolving requirements. It can be tailored to various project types.
    - `Scrum`: Choose Scrum when you want a more structured and defined framework, clear roles, and specific events. It's suitable for teams with well-defined goals and requirements.
    - `Kanban`: Choose Kanban when you want to optimize existing processes and enhance workflow visibility. It's useful for teams looking to increase efficiency and minimize bottlenecks.
    - Ultimately, the choice between Agile, Scrum, and Kanban depends on your project's specific needs, team dynamics, and the level of structure and adaptability required. Some teams even combine elements from these methodologies to create a customized approach that suits their project's requirements.

### SCRUM vs AGILE

Scrum and Agile are often discussed together as they are related concepts, but it's important to note that Scrum is just one specific framework within the broader Agile approach. Here's a comparison between Scrum and Agile:

-   `Agile`: Agile is a mindset or philosophy that emphasizes flexibility, collaboration, and iterative development. It focuses on delivering value to customers through frequent iterations and continuous feedback. The core principles of Agile, as outlined in the Agile Manifesto, include valuing individuals and interactions, working software, customer collaboration, and responding to change. Agile methodologies prioritize adaptability, customer satisfaction, and embracing change throughout the development process.
-   `Scrum`: Scrum is a specific Agile framework for managing and delivering complex projects. It provides a structured approach to software development that follows Agile principles. Scrum is characterized by its iterative and incremental development cycles called "sprints," which are time-boxed periods (typically 1-4 weeks). Scrum teams collaborate in short daily meetings called "Daily Scrums," plan and review work in "Sprint Planning" and "Sprint Review" meetings, and reflect on process improvements in "Sprint Retrospectives."

**Key Differences**:

-   Scope and Focus:

    -   Agile is a broader philosophy and mindset that can be applied to various domains beyond software development. It encompasses multiple methodologies and approaches.
    -   Scrum, on the other hand, is a specific framework within Agile that provides a defined set of roles, ceremonies, and artifacts specifically tailored for software development projects.

-   Structure and Roles:

    -   Agile does not prescribe specific roles, ceremonies, or artifacts. It allows for flexibility in adapting to the needs of the project and team.
    -   Scrum has well-defined roles, including the Scrum Master (facilitator and process enabler), Product Owner (represents the customer and prioritizes the backlog), and the Development Team (responsible for delivering the product increment).

-   Iterative Approach:

    -   Both Agile and Scrum follow an iterative approach, but Scrum employs fixed-length iterations called sprints. Each sprint produces a potentially shippable increment of the product.
    -   Agile methodologies may have different iteration lengths or may not necessarily follow fixed iterations. The focus is on delivering value through iterations and responding to customer feedback.

-   Ceremonies:

    -   Scrum has specific ceremonies, such as Sprint Planning, Daily Scrums, Sprint Review, and Sprint Retrospectives, which provide structure and ensure regular communication and collaboration.
    -   Agile methodologies may have their own set of ceremonies or adapt the ceremonies based on project needs and team preferences.

-   Documentation:
    -   Agile values working software over comprehensive documentation. It emphasizes delivering functional software that meets customer needs.
    -   Scrum also emphasizes working software but includes specific artifacts like the Product Backlog, Sprint Backlog, and Burndown Chart to support transparency and progress tracking.

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">TitleYourHeading</summary>

</details>

---

<details open><summary style="font-size:25px;color:Orange;text-align:left">TitleYourHeading</summary>

</details>
