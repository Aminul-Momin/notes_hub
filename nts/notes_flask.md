<details><summary style="font-size:18px;color:Orange;text-align:left">Flask Documents and CLI</summary>

-   [Doc: Flask](https://flask.palletsprojects.com/en/2.3.x/)

    -   [Uploading Files](https://flask.palletsprojects.com/en/2.3.x/patterns/fileuploads/)

-   [How To Make a Web Application Using Flask in Python 3](https://www.digitalocean.com/community/tutorials/how-to-make-a-web-application-using-flask-in-python-3)

### CLI

-   `$ pip show flask` → Check version of the installed Flask
-   `$ flask run`
-   `$ flask --help`
-   `$ flask shell`
    -   `$ exec(open("load_posts.py").read())`
-   `$ `
-   `$ `

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">request Objects</summary>

-   [Doc: Request](https://flask.palletsprojects.com/en/2.3.x/api/#incoming-request-data)
-   [Doc: Respose](https://flask.palletsprojects.com/en/2.3.x/api/#response-objects)
-   [Accessing Request Data](https://flask.palletsprojects.com/en/2.3.x/quickstart/#accessing-request-data)

-   The request object in Flask is an instance of the Request class provided by the Werkzeug library.
-   It represents the current HTTP request sent by the client to the Flask web application.
-   The request object provides access to various attributes and methods that allow you to interact with the incoming request data.
-   Some commonly used attributes and methods of the request object include:
    -   `request.method`: Returns the HTTP request method (e.g., 'GET', 'POST', 'PUT', 'DELETE').
    -   `request.args`: A dictionary-like object containing the query parameters (GET parameters) in the request URL.
    -   `request.form`: A dictionary-like object containing the data submitted in a form (POST parameters).
    -   `request.files`: A dictionary-like object containing uploaded files.
    -   `request.cookies`: A dictionary-like object containing the cookies sent by the client.
    -   `request.headers`: A dictionary-like object containing the HTTP headers of the request.
    -   `request.path`: The path of the request URL.
    -   `request.url`: The complete URL of the request.
    -   `request.remote_addr`: The IP address of the client making the request.
    -   `request.user_agent`: Information about the user agent (browser) making the request.
-   You can use these attributes and methods to access and manipulate the request data as needed in your Flask application.
-   The request object is automatically available in Flask route functions, allowing you to access request data without the need for explicit parameter passing.
-   It's important to handle exceptions and errors when working with the request object, especially when accessing data that may not be present in the request. For example, when accessing a query parameter, you should handle cases where the parameter doesn't exist.
-   The request object is a fundamental part of processing incoming requests and building dynamic responses in Flask web applications.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Forms and Form Fields</summary>

#### [`wtforms`](https://wtforms.readthedocs.io/en/3.0.x/):

-   [Doc: Form Fields](https://wtforms.readthedocs.io/en/3.0.x/fields/)
    -   StringField, PasswordField, SubmitField, BooleanField
-   [Doc: Form Validators](https://wtforms.readthedocs.io/en/3.0.x/validators/)
    -   `DataRequired`, `Length`, `Email`, `EqualTo`, `ValidationError`
-   [Doc: Form Widgets](https://wtforms.readthedocs.io/en/3.0.x/widgets/)
-   [Doc: Form ]()

-   `wtforms.validators`:

#### [`flask_wtf`](https://flask-wtf.readthedocs.io/en/1.0.x/)

-   [Doc: Form Fields](https://flask-wtf.readthedocs.io/en/1.0.x/form/)
-   [Doc: CSRF Protection](https://flask-wtf.readthedocs.io/en/1.0.x/csrf/)
-   [Doc: ]()

-   `flask_wtf.file`:

    -   `FileField`, `FileAllowed`

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Object Relational Model (ORM)</summary>

#### [`flask_sqlalchemy`](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)

-   `$ source .venv/bin/activate`

    -   Activate project environment

-   `$ python`

    -   activate python interctive shell

    ```python
    from flaskapp.models import User
    from flaskapp import db
    >>> db.create_all()
    >>> db.drop_all(bind=None)
    >>> User.query.all()
    ```

-   db.create_all(), db.drop_all(bind=None), User.query.all()

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Security Consideration</summary>

-   [Doc: Security Consideration](https://flask.palletsprojects.com/en/2.3.x/security/)
-   [Cross-Site Scripting (XSS)](https://flask.palletsprojects.com/en/2.3.x/security/#security-xss)
-   [Cross-Site Request Forgery (CSRF)](https://flask.palletsprojects.com/en/2.3.x/security/#cross-site-request-forgery-csrf)

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Flask APIs</summary>

### [Useful Functions and Classes](https://flask.palletsprojects.com/en/2.3.x/api/#useful-functions-and-classes)

-   `flask.current_app`
-   `flask.url_for(endpoint, *, _anchor=None, _method=None, _scheme=None, _external=None, **values)`
-   `flask.abort(code, *args, **kwargs)`
-   `flask.redirect(location, code=302, Response=None)`
-   `flask.make_response(*args)`
-   `flask.send_file(path_or_file, mimetype=None, as_attachment=False, download_name=None, conditional=True, etag=True, last_modified=None, max_age=None)`
-   ``
-   ``
-   ``

### [Message Flashing](https://flask.palletsprojects.com/en/2.3.x/api/#message-flashing)

-   `flask.flash(message, category='message')`
-   ``

### [JSON Support](https://flask.palletsprojects.com/en/2.3.x/api/#module-flask.json)

-   `flask.json.jsonify(*args, **kwargs)`
-   `flask.json.dumps(obj, **kwargs)`
-   `flask.json.dump(obj, fp, **kwargs)`
-   `flask.json.loads(s, **kwargs)`
-   `flask.json.load(fp, **kwargs)`
-   ``

### [Aplication Global](https://flask.palletsprojects.com/en/2.3.x/api/#application-globals)

-   `flask.g`
-   ``

### [Flask Templates](https://flask.palletsprojects.com/en/2.3.x/templating/)

-   Standard Template Context: `config`, `request`, `session`, `g`, `url_for()`, `get_flashed_messages()`
-   Registering Filters
-   Context Processors
-   Controlling Autoescaping
-   [Template Rendering](https://flask.palletsprojects.com/en/2.3.x/api/#template-rendering)

### [Config & Config Parameters](https://flask.palletsprojects.com/en/2.3.x/config/)

-   [Configuration](https://flask.palletsprojects.com/en/2.3.x/api/#configuration)
-   [Instance Folders](https://flask.palletsprojects.com/en/2.3.x/config/#instance-folders)

#### [flask_login](https://flask-login.readthedocs.io/en/latest/):

-   `login_user`, `current_user`, `logout_user`, `login_required`
-   `UserMixin` → This provides default implementations for the methods that Flask-Login expects user objects to have.
-   `login_view` → The name of the view to redirect to when the user needs to log in. This can be an absolute URL as well, if your authentication machinery is external to your application.
-   `login_message_category` → The message category to flash when a user is redirected to the login page.

#### [request](https://docs.python-requests.org/en/latest/)

-   `secrets`
-   `datetime` datetime
-   `PIL`
    -   Image

#### [flask_mail]()

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Flask Usefull Objects</summary>

```python
from flask import Flask, Blueprint, jsonify, request, url_for, redirect, flash, render_template, abort
from flask_login import current_user, login_required, login_user, logout_user


from wtforms import StringField, EmailField, TextAreaField, PasswordField, SubmitField, BooleanField
from wtforms.validators import DataRequired, Email, Length, EqualTo, ValidationError
from flask_wtf import FlaskForm
from flask_wtf.file import FileField,  FileAllowed

from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_mail import Mail
from flask_migrate import Migrate
import jwt
```

</details>

---

### How to Run a Flask project

```sh
pip install \
    email-validator \
    Flask-SQLAlchemy \
    Flask-WTF \
    flask-bcrypt \
    Pillow \
    Flask-Login \
    Flask-Mail \
    jwt \
    flask-migrate
```

-   Set the following global environment variable and then run the `$ flask run` command for the root folder of your Flask project

```bash
export FLASK_APP=run.py
export FLASK_DEBUG=1
export FLASK_ENV=dev
```

-   `$ flask run` → Start flask server from root folder of your flask project.
-   Created User Account Sofar:

    -   Email: bbcredcap3@gmail.com
    -   Password: 1111
