<details><summary style="font-size:25px;color:Orange;text-align:left">HTTP Methods & Status Code</summary>

### HTTP Methods

HTTP methods, also known as HTTP request methods, are essential components of the Representational State Transfer (REST) architectural style for designing web services and APIs. RESTful APIs use these methods to perform various actions on resources, which can be thought of as objects or data entities. These methods define the type of operation you want to perform on a resource. Here, I'll explain each HTTP method in detail and its typical use in RESTful APIs.

-   GET

    -   `Purpose`: Retrieve data from a resource.
    -   `Idempotent`: Yes. Repeated GET requests should have the same effect as a single request.
    -   `Example`: Fetch the details of a user by requesting GET /users/123.

-   POST

    -   `Purpose`: Create a new resource.
    -   `Idempotent`: No. Repeated POST requests with the same data will create multiple resources.
    -   `Example`: Create a new user by sending data to POST /users.

-   PUT

    -   `Purpose`: Update or replace a resource at a specific URL.
    -   `Idempotent`: Yes. Repeated PUT requests with the same data should have the same effect as a single request.
    -   `Example`: Update user information by sending data to PUT /users/123.

-   PATCH

    -   `Purpose`: Partially update a resource at a specific URL.
    -   `Idempotent`: It depends on the implementation. It should be designed to be idempotent, but it's not guaranteed.
    -   `Example`: Update only the email address of a user by sending data to PATCH /users/123.

-   DELETE

    -   `Purpose`: Remove a resource from the server.
    -   `Idempotent`: Yes. Repeated DELETE requests should have the same effect as a single request.
    -   `Example`: Delete a user by sending a request to DELETE /users/123.

-   HEAD

    -   `Purpose`: Retrieve metadata (headers) about a resource without the actual data.
    -   `Idempotent`: Yes. Repeated HEAD requests should have the same effect as a single request.
    -   `Example`: Get the headers of a resource without downloading its content using HEAD /resource.

-   OPTIONS

    -   `Purpose`: Retrieve information about the communication options for a resource.
    -   `Idempotent`: Yes. Repeated OPTIONS requests should have the same effect as a single request.
    -   `Example`: Determine the available methods and capabilities for a resource using OPTIONS /resource.

-   CONNECT

    -   `Purpose`: Used for setting up a network connection to a resource, typically used for proxy servers.
    -   `Idempotent`: No.
    -   `Example`: Rarely used directly in RESTful APIs.

-   TRACE

    -   `Purpose`: Used for diagnostic purposes, allows a client to retrieve a diagnostic trace of the actions taken by intermediate servers.
    -   `Idempotent`: Yes.
    -   `Example`: Rarely used directly in RESTful APIs.

It's important to design your RESTful API to use these HTTP methods in a way that adheres to REST principles and is intuitive for clients. Additionally, you should handle each method appropriately on the server-side to ensure data integrity and security.

### HTTP Status Codes

-   `HTTP Status Codes`: HTTP status codes are three-digit numbers that are returned by a server in response to a client's request. They provide information about the outcome of the request and the current state of the communication between the client and the server. Each status code has a specific meaning and is grouped into different categories. Here is an overview of the main HTTP status code categories and their meanings:

    -   1xx Informational: These status codes indicate that the server has received the request and is processing it. They are mainly used for communication purposes and do not represent a final response.

        -   `100 Continue`: The server has received the initial part of the request and expects the client to continue sending the rest of it.
        -   `101 Switching Protocols`: The server is changing the protocol used in the request.

    -   2xx Success: These status codes indicate that the request was successfully received, understood, and accepted by the server.

        -   `200 OK`: The request was successful, and the server is returning the requested resource.
        -   `201 Created`: The request was successful, and a new resource was created as a result.
        -   `204 No Content`: The request was successful, but there is no content to return.

    -   3xx Redirection: These status codes indicate that the client needs to take additional steps to complete the request.

        -   `301 Moved Permanently`: The requested resource has been permanently moved to a new location.
        -   `302 Found`: The requested resource has been temporarily moved to a different location.

    -   4xx Client Error: These status codes indicate that there was an error on the client's side, and the request cannot be fulfilled.

        -   `400 Bad Request`: The server cannot understand the request due to malformed syntax or other client-side errors.
        -   `403 Forbidden`: The server understood the request, but the client does not have permission to access the requested resource.
        -   `404 Not Found`: The requested resource could not be found on the server.

    -   5xx Server Error:These status codes indicate that there was an error on the server's side, and the request could not be fulfilled.

        -   `500 Internal Server Error`: A generic server error occurred, indicating that something went wrong on the server.
        -   `502 Bad Gateway`: The server acting as a gateway or proxy received an invalid response from an upstream server.

-   HTTP status codes provide valuable information for understanding the outcome of a request and troubleshooting issues. By analyzing the status code received in the response, clients can take appropriate actions based on the specific situation encountered during the communication with the server.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">APIs</summary>

-   [APIs for Beginners 2023 - How to use an API (Full Course / Tutorial)](https://www.youtube.com/watch?v=WXsD0ZgxjRw&t=5570s)
-   [Introduction to web APIs](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Client-side_web_APIs/Introduction)
-   [HTTP](https://en.wikipedia.org/wiki/HTTP)

An API, or Application Programming Interface, is a set of rules, protocols, and tools that allows different software components to communicate and interact with each other. APIs enable developers to create software that can leverage the functionalities of other systems, libraries, or services without needing to understand their internal workings. APIs are fundamental in software engineering and enable modular design, code reuse, and the creation of more complex applications by combining existing components. Here's an in-depth explanation of APIs in the context of software engineering:

-   `Abstraction Layer`: APIs provide an abstraction layer that shields developers from the complexities of the underlying system or service. Developers can interact with the API's well-defined interface without needing to know the implementation details.
-   `Communication Protocols`: APIs define communication protocols for exchanging data between different software components. This communication can occur over various channels, such as HTTP, REST, SOAP, WebSockets, or even direct library calls.
-   `Functionality Exposure`: APIs expose specific functionalities, services, or data sets to external developers or systems. This controlled exposure ensures that only the intended operations are accessible while keeping other internals hidden.
-   `Modularity and Reusability`: APIs promote modular design by allowing developers to create separate components with well-defined interfaces. These components can be reused in different projects or applications, reducing development time and effort.
-   `Interoperability`: APIs facilitate interoperability between diverse software systems, languages, and platforms. Developers can create applications that integrate with services and technologies that may have been developed independently.
-   `Standardization`: APIs establish standards for interaction, making it easier for developers to understand how to use a particular service or library. This standardization promotes consistent and predictable behavior.
-   `Versioning`: APIs often support versioning to ensure backward compatibility as changes are made. This allows existing applications to continue working without disruption while new versions are developed.
-   `Documentation`: Well-documented APIs provide clear guidelines on how to use them, including information about endpoints, parameters, request/response formats, error handling, and authentication.
-   `Security`: APIs can implement security mechanisms such as authentication, authorization, and encryption to ensure that data and services are accessed only by authorized parties.
-   `Third-Party Integration`: APIs enable third-party developers to build applications or services that extend or enhance the functionality of an existing software product.
-   `Microservices Architecture`: In modern software design, APIs play a crucial role in the microservices architecture, where different parts of an application are developed as separate services, each with its own API.
-   `Web APIs`: Web APIs are APIs that are exposed over the internet using protocols like HTTP. They enable web applications to interact with remote services, databases, or other web resources.
-   `Testing and Mocking`: Developers can use mock APIs during testing to simulate interactions and behaviors of external components before integrating with the actual implementation.
-   `Rate Limiting and Throttling`: APIs often include mechanisms to control the rate at which requests can be made, preventing abuse and ensuring fair usage.
-   `Data Exchange`: APIs are commonly used for exchanging data between different systems, such as integrating third-party services, fetching data from databases, or sending data to analytics platforms.

-   HTTP API vs REST API

    -   HTTP API and REST API are both ways to communicate with an application or a web service, but they differ in the way they are designed and implemented.

        -   HTTP API (also known as Web API) is a general term that describes any API that is accessed over the HTTP protocol. It can use various formats such as JSON, XML, or HTML, and can have different methods such as GET, POST, PUT, and DELETE. HTTP APIs can be designed to be lightweight and simple, and they can be used for various purposes, including web applications, mobile applications, or machine-to-machine communication.
        -   REST API (Representational State Transfer) is a specific type of HTTP API that follows a set of architectural principles to make it more efficient, scalable, and maintainable. REST API uses a client-server model and is based on the HTTP protocol. It uses standard HTTP methods such as GET, POST, PUT, and DELETE, and it employs a set of conventions to define resources, URIs, and responses. REST API aims to make the client-server communication stateless and cacheable, and it uses hypermedia (links) to navigate between resources.

    -   In summary, the main differences between HTTP API and REST API are:

        -   HTTP API is a general term that describes any API that is accessed over the HTTP protocol, while REST API is a specific type of HTTP API that follows a set of architectural principles.
        -   HTTP API can use different formats and methods, while REST API uses standard HTTP methods and employs a set of conventions to define resources and responses.
        -   HTTP API can be simple and lightweight, while REST API aims to make the client-server communication more efficient, scalable, and maintainable.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">URL (Universal Resource Locator)</summary>

-   [Query Parameter](https://fastapi.tiangolo.com/tutorial/query-params/)
-   [Path Parameter](https://fastapi.tiangolo.com/tutorial/path-params/)

</details>

---

### CSRF (Cross-Site Request Forgery):

### CORS (Cross-Origin Resource Sharing):

### Cross-Site Scripting (XSS):

-   `Autoescaping`: Autoescaping is the concept of automatically escaping special characters for you. Special characters in the sense of HTML (or XML, and thus XHTML) are &, >, <, " as well as '. Because these characters carry specific meanings in documents on their own you have to replace them by so called “entities” if you want to use them for text. Not doing so would not only cause user frustration by the inability to use these characters in text, but can also lead to security problems.
-   [Flask: Cross-Site Scripting (XSS)](https://flask.palletsprojects.com/en/2.3.x/security/#security-xss)

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Deployment</summary>

-   [How to use Django with uWSGI](https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/uwsgi/)
-   [How to use Django with Gunicorn](https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/gunicorn/)
-   [Setting up Django and your web server with uWSGI and nginx](https://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html#)
-   [Deploying Django with Docker Compose](https://www.youtube.com/watch?v=mScd-Pc_pX0&t=1928s)

---

---

-   `Gunicorn` vs `uWSGI`: `Gunicorn` and `uWSGI` are two popular Python WSGI (Web Server Gateway Interface) servers that are commonly used to serve Python web applications.
    -   `Gunicorn` (short for Green Unicorn) is a Python WSGI HTTP server that is designed to be lightweight, fast, and easy to use. It can handle multiple requests concurrently and can scale to handle large numbers of requests. `Gunicorn` is commonly used in conjunction with a reverse proxy server, such as `Nginx` or `Apache`, which handles incoming requests and passes them on to `Gunicorn`.
    -   `uWSGI` is a more feature-rich WSGI server that is designed to be highly configurable and extensible. It supports multiple protocols and interfaces, including WSGI, FastCGI, and HTTP. `uWSGI` is known for its ability to handle high traffic volumes and its support for a variety of advanced features, including load balancing, caching, and process management.
-   `Uvicorn`:
-   `Apache` is a popular web server that has been around for a long time. It is widely used and supports a wide range of features and modules, making it highly configurable and adaptable to different use cases. `Apache` is primarily used for serving static content and dynamic content through the use of modules such as PHP or Python.
-   `Nginx` is a newer web server that has gained popularity in recent years due to its high performance and scalability. `Nginx` is designed to handle large volumes of traffic and can serve both static and dynamic content. `Nginx` is often used as a reverse proxy in front of other web servers, such as `Apache` or `Tomcat`, to improve performance and reliability.
-   `Tomcat` is a Java-based web server and application server that is designed to serve Java applications. It supports the Java Servlet and JavaServer Pages (JSP) specifications and is often used to serve Java web applications. `Tomcat` is highly configurable and can be extended through the use of plugins and modules.

### `Proxy Server` vs `Reverse Proxy Server`:

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

![server configuration for Django](/assets/django/nginx-uwsgi.webp)

### `Reverse Proxy Server` vs `Web Server Gateway Interface` (WSGI):

A Reverse Proxy Server and a Web Server Gateway Interface (WSGI) serve different roles in web application architecture, but they are complementary components. Here's a comparison of the two:

-   `Reverse Proxy Server`:

    -   `Definition`:

        -   A reverse proxy server is a server that sits between client devices and backend web servers.
        -   It receives incoming client requests, such as HTTP requests, and forwards those requests to the appropriate backend server or application.

    -   `Purpose`:

        -   `Load Balancing`: Reverse proxies can distribute client requests across multiple backend servers to balance the load and improve performance and reliability.
        -   `Security`: They can provide an additional layer of security by hiding the internal structure of the network and filtering out malicious traffic.
        -   `SSL Termination`: Reverse proxies can handle SSL/TLS encryption and decryption, offloading this resource-intensive task from the backend servers.
        -   `Caching`: They can cache frequently requested content to reduce the load on backend servers and improve response times.

    -   `Examples`:

        -   Nginx and Apache HTTP Server are commonly used as reverse proxy servers.
        -   CDNs (Content Delivery Networks) often use reverse proxies to cache and serve static content.

-   `Web Server Gateway Interface (WSGI)`:

    -   `Definition`:

        -   WSGI is a specification in Python that defines a standard interface between web servers and web applications or frameworks.
        -   It allows web servers to communicate with Python web applications in a consistent and standardized way.

    -   `Purpose`:

        -   WSGI serves as an interface between a web server and a Python web application or framework.
        -   It allows different web servers to run Python web applications written using various frameworks, such as Flask, Django, or Pyramid.

    -   `Examples`:

        -   Popular Python web servers like Gunicorn, uWSGI, and mod_wsgi (for Apache) implement the WSGI standard.
        -   Python web frameworks, including Flask and Django, can be deployed using WSGI servers.

-   `Relationship`:

    -   `A reverse proxy server and WSGI serve different but complementary roles`:

        -   The reverse proxy server handles tasks like load balancing, SSL termination, and security at the network level, sitting between clients and backend servers.
        -   WSGI, on the other hand, handles the communication between a web server and a Python web application at the application level, allowing the Python code to receive and process HTTP requests.

    -   In a typical web application architecture, a reverse proxy server (e.g., Nginx) may be used to handle tasks like load balancing and SSL termination, while a WSGI server (e.g., Gunicorn or uWSGI) interfaces with the Python web application to serve dynamic content.

In summary, a reverse proxy server and WSGI serve different purposes in web application architecture. The reverse proxy manages network-level tasks, while WSGI provides a standardized interface for communication between web servers and Python web applications. Together, they enable the deployment of Python web applications in a scalable and secure manner.

### ASGI (Asynchronous Server Gateway Interface):

-   `Definition`:

    -   ASGI is a specification for asynchronous web servers and frameworks in Python.
    -   It allows Python web applications to handle asynchronous operations, such as long-lived connections and real-time communication, in an efficient and non-blocking manner.

-   `Purpose`:

    -   ASGI is designed to handle asynchronous web applications and services that require real-time interactions, like chat applications, streaming, and server-sent events.
    -   It provides a standardized interface for handling asynchronous HTTP requests and WebSocket connections.

-   `ASGI Servers`:

    -   ASGI servers are the web servers that implement the ASGI specification.
    -   These servers are responsible for handling incoming ASGI requests and routing them to the appropriate ASGI application or framework.

-   `Examples of ASGI Servers`:

    -   Some popular ASGI servers include Daphne, Uvicorn, Hypercorn, and more.
    -   Uvicorn, for example, is widely used and known for its simplicity and performance.

-   `Usage`:

    -   ASGI servers are commonly used with asynchronous web frameworks like FastAPI and Starlette to build high-performance web applications that require real-time capabilities.
    -   To run an ASGI application with a server like Uvicorn, you typically use a command like this:

        ```python
        uvicorn myapp:app --host 0.0.0.0 --port 8000
        ```

    -   In this example, myapp is the Python module containing your ASGI application, and app is the instance of your ASGI application within that module.

<details><summary style="font-size:18px;color:Orange;text-align:left">Gunicorn (Green Unicorn)</summary>

-   [https://docs.gunicorn.org/en/latest/settings.html](https://docs.gunicorn.org/en/latest/settings.html)
-   `gunicorn.socket` vs `gunicorn.service`: these are systemd units used for running Gunicorn, a Python WSGI HTTP server. They serve different purposes within the systemd service management system.

    -   `gunicorn.socket`: This file represents a Socket Unit which nanage inter-process communication through sockets. It defines a system socket that listens for incoming connections and passes them to the associated service unit (`gunicorn.service`). The `gunicorn.socket` unit allows systemd to manage the socket activation process, where the socket is created on-demand when a connection is received. This helps improve resource usage by only starting the Gunicorn process when needed.
    -   `gunicorn.service`: This file represents a Service Unit. It defines the Gunicorn service that handles the incoming connections received through the associated socket (`gunicorn.socket`). The `gunicorn.service` unit specifies the command to start the Gunicorn process, along with its configuration options and other settings.

-   `$ gunicorn core.wsgi:application --bind 0.0.0.0:8000`
-   `$ gunicorn core.wsgi:application --config ./gunicorn_config.py`

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">uvicorn</summary>

-   `uvicorn myapp:app --host 0.0.0.0 --port 8000`

    -   `myapp` refers to the Python module containing your ASGI application.
    -   `app` is the instance of your ASGI application within that module.
    -   `--host` and `--port` options specify the host and port on which `uvicorn` should listen.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">uWSGI (universal Web Server Gateway Interface)</summary>

-   [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/index.html)

-   `uWSGI`: It's a popular web server interface and application server gateway that facilitates communication between web servers and web applications, allowing them to work together seamlessly. uWSGI is commonly used in deploying Python web applications, but it supports multiple programming languages and frameworks.

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

<details><summary style="font-size:18px;color:Orange;text-align:left">Nginx</summary>

-   [Learn Proper NGINX Configuration Context Logic](https://www.youtube.com/watch?v=C5kMgshNc6g&t=683s)
-   [How to Deploy Django on Nginx with uWSGI (full tutorial)](https://www.youtube.com/watch?v=ZpR1W-NWnp4&t=21s)

#### Terms and Concepts

-   `nginx.conf`: The nginx configuration file, typically named `nginx.conf`, is a text-based file that specifies how the Nginx web server should behave. The `nginx.conf` file is written in a language called NGINX configuration language or NGINX Configuration Syntax. It is a custom configuration syntax specific to NGINX. It contains a set of directives within different contexts to specify their scope and define various aspects of server functionality, such as server listening ports, request handling, load balancing, caching, and security settings. The main contexts in an `nginx.conf` file are:

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

<details><summary style="font-size:25px;color:Orange;text-align:left">Title</summary>

</details>

---
