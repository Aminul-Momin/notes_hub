-   [Security tips for web developers](https://www.squarefree.com/securitytips/web-developers.html#CSRF)

## Notes on Django

-   How do I check Django installation?
    -   `$ django-admin --version`

### Important Objects and Functions in Django:

```python
from django.db import models

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordResetForm, SetPasswordForm
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin

from django.contrib.admin import ModelAdmin
from django.contrib import messages
from django.contrib import admin
from django.contrib.sites.shortcuts import get_current_site

from django.views.generic import ( ListView, DetailView, CreateView, UpdateView, DeleteView )

from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static

from django.http import HttpResponse
from django.http import JsonResponse
from django.utils import reverse, timezone
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.shortcuts import render, redirect, get_object_or_404

from django.template.loader import render_to_string

# =============================================================================

from django.core.mail import send_mail
send_mail('Subject here','Here is the message.','from@example.com',['to@example.com'],fail_silently=False,)

```

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Django CLI</summary>

-   `$ django-admin -h`
-   `$ django-admin check`
-   `$ django-admin compilemessages`
-   `$ django-admin createcachetable`
-   `$ django-admin dbshell`
-   `$ django-admin diffsettings`
-   `$ django-admin dumpdata`
-   `$ django-admin flush`
-   `$ django-admin inspectdb`
-   `$ django-admin loaddata`
-   `$ django-admin makemessages`
-   `$ django-admin makemigrations`
-   `$ django-admin migrate`
-   `$ django-admin runserver`
-   `$ django-admin sendtestemail`
-   `$ django-admin shell`
-   `$ django-admin showmigrations`
-   `$ django-admin sqlflush`
-   `$ django-admin sqlmigrate`
-   `$ django-admin sqlsequencereset`
-   `$ django-admin squashmigrations`
-   `$ django-admin startapp`
-   `$ django-admin startproject`
-   `$ django-admin test`
-   `$ django-admin testserver`

-   `$ python manage.py -h`

-   [auth]

    -   `$ python manage.py changepassword`
    -   `$ python manage.py createsuperuser`

-   [contenttypes]

    -   `$ python manage.py remove_stale_contenttypes`

-   [django]

    -   `$ python manage.py check`
    -   `$ python manage.py compilemessages`
    -   `$ python manage.py createcachetable`
    -   `$ python manage.py dbshell`
    -   `$ python manage.py diffsettings`
    -   `$ python manage.py dumpdata`
    -   `$ python manage.py flush`
    -   `$ python manage.py inspectdb`
    -   `$ python manage.py loaddata`
    -   `$ python manage.py makemessages`
    -   `$ python manage.py makemigrations`
    -   `$ python manage.py migrate`
    -   `$ python manage.py sendtestemail`
    -   `$ python manage.py shell`
    -   `$ python manage.py showmigrations`
    -   `$ python manage.py sqlflush`
    -   `$ python manage.py sqlmigrate`
    -   `$ python manage.py sqlsequencereset`
    -   `$ python manage.py squashmigrations`
    -   `$ python manage.py startapp`
    -   `$ python manage.py startproject`
    -   `$ python manage.py test`
    -   `$ python manage.py testserver`

-   [sessions]

    -   `$ python manage.py clearsessions`

-   [staticfiles]

    -   `$ python manage.py collectstatic`
    -   `$ python manage.py findstatic`
    -   `$ python manage.py runserver`

-   `$ python manage.py collectstatic`
</details>

---

### Django Terms & Concepts

Django is a popular web framework for building scalable and maintainable web applications in Python. Here are some of the most important terms and concepts to know when working with Django:

-   `Model`: A model is a Python class that represents a database table. Each attribute of the class corresponds to a field in the table.
-   `View`: A view is a Python function that handles a user request and returns an HTTP response. In Django, views are responsible for handling business logic and rendering templates.
-   `Template`: A template is an HTML file that contains placeholders for dynamic data. In Django, templates can be rendered by views to create dynamic web pages.
-   `URLconf`: A URLconf is a Python module that maps URLs to views. It defines a set of patterns that match incoming requests and route them to the appropriate view.
-   `Middleware`: Middleware is a way to add extra functionality to the request/response processing pipeline in Django. Middleware can be used for authentication, caching, logging, and more.
-   `Forms`: In Django, forms are a way to handle user input. They provide a way to validate user input and convert it to Python objects.
-   `Admin site`: The Django admin site is a built-in application that provides an interface for managing data in the database. It allows authorized users to create, read, update, and delete records in the database.
-   `Migration`: A migration is a way to update the database schema to match changes to the models. Migrations are created automatically by Django when changes are made to the models.
-   `QuerySet`: A QuerySet is a collection of database objects that can be filtered, sorted, and manipulated. QuerySets are created by calling a method on a model manager.
-   `ModelForm`: A ModelForm is a Django form that is automatically generated from a model. It provides a way to create, update, and delete records in the database using a form.
-   `CSRF (Cross-Site Request Forgery)`:
-   `CORS (Cross-Origin Resource Sharing)`

---

### Models ([doc](https://docs.djangoproject.com/en/4.1/ref/models/))

-   `Fields`: A Django model's fields define the data that can be stored in the corresponding database table. Fields can represent different data types such as text, integers, dates, booleans, etc.
-   `Primary Key`: A primary key is a unique identifier for each row in a database table. In Django, every model must have a primary key field.
-   `Relationships`: Django models can define relationships between themselves, such as a one-to-many relationship, a many-to-many relationship, or a one-to-one relationship.
-   `Querysets`: Querysets are used to retrieve data from a database table. They are generated by querying the database using a Django model.
-   `Managers`: Managers are responsible for querying the database to retrieve data, and they allow you to define custom methods for querying the database.
-   `Model Forms`: Model forms are Django forms that are automatically generated based on a model's fields. They provide a simple way to create, edit, and delete model instances.
-   `Meta class`: The Meta class is used to provide additional options for a model, such as specifying the ordering of querysets or changing the default behavior of a model manager.
-   `Abstract Models`: An abstract model is a model that can't be instantiated on its own but provides common fields and methods that can be inherited by other models.
-   `Migrations`: Migrations are a way of managing changes to a model's schema. They allow you to add, remove, or modify fields in a model without losing any existing data.

#### Most common field classes and their common attributes:

-   [Model field reference](https://docs.djangoproject.com/en/4.1/ref/models/fields/)

-   Field Types:

    -   `SlugField`
    -   `TextField`
    -   `CharField`
    -   `EmailField`
    -   `BooleanField`
    -   `DateField`
    -   `FileField`
    -   `ImageField`
    -   `AutoField`
    -   `BigAutoField`
    -   `BigIntegerField`
    -   `BinaryField`
    -   `DateTimeField`
    -   `FloatField`
    -   `DecimalField`
    -   `DurationField`
    -   `FileField and FieldFile`
    -   `FilePathField`
    -   `IntegerField`
    -   `GenericIPAddressField`
    -   `JSONField`
    -   `PositiveBigIntegerField`
    -   `PositiveIntegerField`
    -   `PositiveSmallIntegerField`
    -   `SmallAutoField`
    -   `SmallIntegerField`
    -   `TimeField`
    -   `URLField`
    -   `UUIDField`

-   Relationship Fields:

    -   `ForeignKey(to, on_delete, **options)`

        -   [doc](https://docs.djangoproject.com/en/4.1/ref/models/fields/#foreignkey)
        -   Behind the scenes, Django appends `_id` to the field name to create its database column name.
        -   ForeignKey accepts other arguments that define the details of how the relation works.
            -   `on_delete`: When an object referenced by a ForeignKey is deleted, Django will emulate the behavior of the SQL constraint specified by the `on_delete` argument.
                -   The possible values for `on_delete` are found in django.db.models:
                    -   `models.CASCADE`, `models.SET_NULL`, `models.SET_DEFAULT`, `models.DO_NOTHING`, `models.CASCADE`
            -   `related_name`: The name to use for the relation from the related object back to this one. It’s also the default value for `related_query_name`

    -   `ManyToManyField(to, **options)`

        -   [doc](https://docs.djangoproject.com/en/4.1/ref/models/fields/#manytomanyfield)
            -   `related_name`
            -   `related_query_name`
            -   `limit_choices_to`
            -   `symmetrical`
            -   `through`
            -   `through_fields`
            -   `db_table`
            -   `db_constraint`
            -   `swappable`

    -   `OneToOneField(to, on_delete, parent_link=False, **options)`:
        -   [doc](https://docs.djangoproject.com/en/4.1/ref/models/fields/#onetoonefield)
        -   `on_delete`: When an object referenced by a ForeignKey is deleted, Django will emulate the behavior of the SQL constraint specified by the `on_delete` argument. - `parent_link`
        -   `parent_link`

-   Field Options (Arguments of Field Types):

    -   In Django, a Model represents a table in a database and its fields represent columns. Each field in a Django Model can have various options (parameters) to customize its behavior. Here are some commonly used Django model field options:
    -   `null` - If set to True, the field can be NULL in the database. The default is False.
    -   `blank` - If set to True, the field is allowed to be blank (i.e., have no value). The default is False.
    -   `choices` - A list of choices for the field. Each choice is a tuple containing two values: a database value and a human-readable value.
    -   `default` - The default value for the field. This can be a value or a callable that returns a value.
    -   `verbose_name` - A human-readable name for the field. If not provided, Django will use the field name with underscores replaced by spaces.
    -   `help_text` - Extra text to help users understand how to fill in the field.
    -   `max_length` - The maximum length of the field. Only applicable to text-based fields, such as CharField and TextField.
    -   `unique` - If set to True, the field must be unique across all records in the database. The default is False.
    -   `db_index` - If set to True, a database index will be created for the field. This can speed up database queries that use this field.
    -   `editable` - If set to False, the field will not be displayed in forms or editable in the admin interface. The default is True.
    -   `Enumeration types`
    -   `db_column`
    -   `db_tablespace`
    -   `error_messages`
    -   `primary_key`
    -   `unique_for_date`
    -   `unique_for_month`
    -   `unique_for_year`
    -   `validators`

#### Most common Meta option:

-   [Model Meta options](https://docs.djangoproject.com/en/4.1/ref/models/options/)

-   Model Meta options:

    -   `verbose_name`
    -   `verbose_name_plural`
    -   `ordering`
    -   `abstract`
    -   `app_label`
    -   `base_manager_name`
    -   `db_table`
    -   `Table names`
    -   `db_tablespace`
    -   `default_manager_name`
    -   `default_related_name`
    -   `get_latest_by`
    -   `managed`
    -   `order_with_respect_to`
    -   `permissions`
    -   `default_permissions`
    -   `proxy`
    -   `required_db_features`
    -   `required_db_vendor`
    -   `select_on_save`
    -   `indexes`
    -   `unique_together`
    -   `index_together`
    -   `constraints`

-   Read-only Meta attributes:
    -   `label`
    -   `label_lower`

### Forms

-   [Forms](https://docs.djangoproject.com/en/4.1/ref/forms/)
-   [Form fields](https://docs.djangoproject.com/en/4.1/ref/forms/fields/)

```python
from django.forms.fields import *
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordResetForm, SetPasswordForm
```

-   Core Fild Arguments:

    -   `label`
    -   `widget`
    -   `help_text`
    -   `required`
    -   `label_suffix`
    -   `initial`
    -   `error_messages`
    -   `validators`
    -   `localize`
    -   `disabled`

-   `CharField(**kwargs)`

    -   Default widget: TextInput
    -   Empty value: Whatever you’ve given as `empty_value`.
    -   Normalizes to: A string.
    -   Uses `MaxLengthValidator` and `MinLengthValidator` if `max_length` and `min_length` are provided. Otherwise, all inputs are valid.
    -   Error message keys: `required`, `max_length`, `min_length`
    -   Has the following optional arguments for validation:
        -   `max_length`/`min_length` → If provided, these arguments ensure that the string is at most or at least the given length.
        -   `strip` → If True (default), the value will be stripped of leading and trailing whitespace.
        -   `empty_value` → The value to use to represent “empty”. Defaults to an empty string.

-   Django form validation methods are called automatically by the Django framework when the form is submitted. The validation methods are called in the following order:

    -   `is_valid()`: This method is called first to check if the submitted form data is valid. It checks if all required fields are present and if the data is in the correct format.

    -   `clean()`: This method is called next if is_valid() returns True. This method is responsible for performing additional validation and cleaning of the submitted data. It can modify the submitted data as needed and return a cleaned version of the data.

    -   `clean_<fieldname>()`: If the clean() method has not raised any errors, then the clean\_<fieldname>() method is called for each field in the form. This method can be used to perform field-specific validation and cleaning.

    -   If any validation errors are encountered during the validation process, the errors are stored in the form's errors dictionary, which can be accessed in the template to display error messages to the user.

-   Django ModelForm is a useful tool for creating HTML forms based on Django models. The ModelForm class provides various clean methods that can be used to validate and clean form data before it is saved to the database. Here are some of the clean methods available in Django ModelForm. By using these clean methods in your Django ModelForm, you can ensure that the data entered into your forms is validated and cleaned before it is saved to the database. This helps to ensure the integrity of your data and prevent errors or inconsistencies.

    -   `clean(self)`: This method is called after all other validation methods have been called. It can be used to validate multiple fields together and to perform custom validation logic that can't be handled by the individual field validation methods. For example, if you need to check if two fields are mutually exclusive, you can do so in the clean() method.

    -   `clean_<fieldname>(self)`: This method is called for each individual field after the field's default validation has been performed. It can be used to perform additional validation on the field or to clean the data in some way. For example, if you need to convert the value of a field to uppercase, you can do so in the clean\_<fieldname>() method.

    -   `clean_<fieldname>_unique(self)`: This method is called for fields that have the unique=True option set. It can be used to check if the value of the field is unique among all other objects in the database. For example, if you have a User model with a unique email field, you can use clean_email_unique() to check if the email address is already in use.

    -   `clean_<fieldname>choices(self)`: This method is called for fields that have choices defined. It can be used to validate that the value of the field is one of the allowed choices. For example, if you have a ChoiceField with the choices "Yes" and "No", you can use clean<fieldname>\_choices() to ensure that the value is one of those two options.

    -   Each form field has a corresponding Widget class, which in turn corresponds to an HTML form widget such as `<input type="text">`. In most cases, the field will have a sensible default widget. For example, by default, a CharField will have a TextInput widget, that produces an `<input type="text">` in the HTML. If you needed `<textarea>` instead, you’d specify the appropriate widget when defining your form field,

#### Django Widget

-   [Widgets](https://docs.djangoproject.com/en/4.1/ref/forms/widgets/)
-   [Built-in widgets](https://docs.djangoproject.com/en/4.1/ref/forms/widgets/#built-in-widgets)

-   How does Widget get used in Form's Model:

```python
class PwdResetForm(PasswordResetForm):

    email = forms.EmailField(
        max_length=254,
        widget=forms.TextInput(attrs={'class': 'form-control mb-3', 'placeholder': 'Email', 'id': 'form-email'})
    )

    def clean_email(self):
        email = self.cleaned_data['email']
        u = UserBase.objects.filter(email=email)
        if not u:
            raise forms.ValidationError(
                'Unfortunatley we can not find that email address')
        return email
```

In Django, a widget is a graphical representation of an HTML form input element. Widgets are used to render HTML forms in Django templates and to handle user input.

Django provides a number of built-in widgets for different types of form fields, such as text inputs, checkboxes, radio buttons, and more. Widgets can also be customized or extended to create new types of form inputs or to modify the behavior of existing ones.

Widgets are defined as classes in Django and are associated with form fields through the widget attribute of the field. For example, the TextInput widget is associated with the CharField form field, while the CheckboxInput widget is associated with the BooleanField form field.

Widgets can be customized by subclassing the built-in widget classes or by creating new widget classes that inherit from the Widget class. Custom widgets can be used to render form inputs in a specific way or to handle user input in a custom way.

Widgets can also be used to specify additional attributes for HTML form input elements, such as CSS classes, placeholder text, or default values. This can be done by passing additional parameters to the widget constructor.

Some Widget classes are:

-   `class TextInput`

    -   input_type: 'text'
    -   template_name: 'django/forms/widgets/text.html'
    -   Renders as: <input type="text" ...>

-   `class EmailInput`:

    -   input_type: 'email'
    -   template_name: `django/forms/widgets/email.html`
    -   Renders as: <input type="email" ...>

-   `class PasswordInput`
    -   input_type: 'password'
    -   template_name: `django/forms/widgets/password.html`
    -   Renders as: <input type="password" ...>
    -   Takes one optional argument:
        -   render_value → Determines whether the widget will have a value filled in when the form is re-displayed after a validation error (default is False).

### Djangoo Class-based Views

-   [Views reference](https://docs.djangoproject.com/en/4.1/ref/class-based-views/)

```python
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.contrib.auth.views import LoginView, LogoutView

```

-   Class-based views (CBVs) in Django are a way to define views as Python classes rather than functions. CBVs provide a powerful and flexible way to create reusable views that can be easily customized and extended to fit a variety of use cases.

-   Django provides several pre-defined CBVs that can be subclassed and customized to meet specific needs, including:

    -   `View`: the base class for all CBVs that provides the basic structure for handling HTTP requests and responses. Subclasses of View typically define one or more methods to handle specific HTTP methods (such as get() and post()).
    -   `TemplateView`: a CBV that renders a template with context data. TemplateView is useful for simple pages that require minimal processing.
    -   `ListView`: a CBV that retrieves a list of objects from the database and renders them as a list in a template.
    -   `DetailView`: a CBV that retrieves a single object from the database and renders it in a template.
    -   `CreateView`: a CBV that renders a form to create a new object and processes the form data to create a new record in the database.
    -   `UpdateView`: a CBV that renders a form to update an existing object and processes the form data to update the corresponding record in the database.
    -   `DeleteView`: a CBV that renders a confirmation page for deleting an object and deletes the corresponding record in the database when the user confirms.

-   CBVs provide several benefits over function-based views:

    -   `Reusability`: CBVs can be subclassed and customized to create new views with similar functionality. This reduces the amount of code duplication and makes it easier to maintain the code.
    -   `Extensibility`: CBVs can be easily extended to add new behavior or modify existing behavior. This allows developers to build complex views with minimal effort.
    -   `Consistency`: CBVs provide a consistent way to define views, making it easier to maintain and refactor code. This consistency also makes it easier for other developers to understand and work with the code.
    -   `Separation of concerns`: CBVs allow developers to separate the logic of handling HTTP requests and rendering responses from the implementation details of the view. This makes it easier to test the code and reduces the risk of errors.

-   CBVs can be used in a variety of contexts, such as rendering HTML templates, handling form submissions, and generating API responses. They can also be combined with mixins to add additional functionality to views, such as authentication, caching, and pagination.

-   Overall, class-based views are a powerful and flexible way to define views in Django, providing a consistent and extensible interface for handling HTTP requests and responses in a variety of contexts.

### Django Templating

-   [Templates](https://docs.djangoproject.com/en/4.1/topics/templates/)
-   [Built-in template tags and filters](https://docs.djangoproject.com/en/4.0/ref/templates/builtins/)

    ```html
    <form
        class="account-form p-4 rounded"
        action="{% url 'account:login' %}"
        method="post"
        {%
        csrf_token
        %}
    ></form>
    ```

    ```html
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="{% url "store:product_all" %}">All</a></li>
        {% for c in categories %}
        <li {% if category.slug == c.slug %}class="selected" {% endif %}>
            <a class="dropdown-item" href="{{ c.get_absolute_url }}">{{ c.name|title }}</a>
        </li>
        {% endfor %}
    </ul>
    ```

    ```html
    <small class="text-muted">{{ object.date_posted|date:"F d, Y" }}</small>
    <a href="{% url 'post-update' object.id %}">Update</a>
    ```

-   `autoescape`:

Django auto-escaping is a feature of the Django web framework that helps prevent Cross-Site Scripting (XSS) attacks by automatically escaping potentially dangerous characters in output templates. To prevent XSS attacks, Django automatically escapes output in templates by default. Developers can also use a special syntax in Django templates to disable auto-escaping for a particular block of content if they need to output HTML or other markup.

    ```html
    {% autoescape off %}
        ...
    {% endautoescape %}
    ```

#### Template Tag

-   [Creating Custom Template Tags and Filters](https://www.youtube.com/watch?v=XtbvBlCyfT4)

A template tag is a Python function that is executed within a template and allows you to perform more complex operations or logic than what is typically possible with the template language alone. Template tags provide additional functionality and allow you to manipulate data, control the flow of the template, or generate dynamic content.

Template tags are surrounded by `{% %}` tags in Django templates. There are two types of template tags: simple tags and inclusion tags.

-   `Simple Tags`: Simple tags are used for performing simple operations or transformations on the data.
    They are defined as Python functions that take the context and any number of arguments and return a string that will be inserted into the template.

    -   Example: `{% tag_name argument1 argument2 %}`

-   `Inclusion Tags`: Inclusion tags are used when you want to include another template and pass it a set of context data.
    They are defined as Python functions that take the context and any number of arguments and return a rendered template as a string.
    -   Example: `{% include_tag_name argument1 argument2 %}`

Template tags can accept arguments and perform operations such as querying the database, manipulating strings, iterating over lists, or applying conditional logic. They provide a way to extend the functionality of Django templates and keep the presentation logic separate from the business logic.

Django comes with a set of built-in template tags that cover common use cases, such as looping over lists, conditionally displaying content, formatting dates, and more. Additionally, you can create your own custom template tags to encapsulate reusable functionality specific to your project.

To use a custom template tag, you need to follow these steps:

-   Create a Python module (e.g., templatetags) inside your app directory.
-   Define your template tag functions in the module.
-   Load the template tags in your template using the {% load %} tag.
-   Use the template tag within your template.
-   Example of using a built-in template tag to loop over a list:

    ```html
    {% for item in my_list %} {{ item }} {% endfor %}
    ```

-   Example of using a custom template tag to perform a custom operation:

    ```html
    {% custom_tag argument1 argument2 %}
    ```

Template tags provide a powerful mechanism for extending the capabilities of Django templates and allow you to create reusable and modular templates that can handle complex tasks and display dynamic content.

### Django Context Processors:

a context processor is a Python function that allows you to add extra data to the context of every template rendered within a Django project. It's a convenient way to make certain data available globally to all templates without explicitly passing it in every view.

A context processor is a function that takes a request object as its parameter and returns a dictionary of values that will be added to the context of the template. The context processor function is executed for every request, and its returned values are accessible in templates.

-   `django.contrib.auth.context_processors.auth` is enabled by default & contains the variable `user`.

### Django Logging System

-   [Using the Django authentication system](https://docs.djangoproject.com/en/4.1/topics/auth/default/)
-   []()
-   []()
-   []()

### Django Fixtures

-   Django fixtures are a way of loading data into the database that your Django application is using. A fixture is a collection of data that Django knows how to import into a database.
-   Fixtures are typically written as a JSON, XML or YAML file and can be used to load initial data into your database when you set up your application, as well as to provide test data when running tests. They can be useful for populating your database with sample data for development, for sharing data between different instances of an application, and for resetting the database to a known state for testing purposes.

-   [How to use Django loaddata and dumpdata?](https://zerotobyte.com/how-to-use-django-loaddata-and-dumpdata/)

-   `$ python manage.py dumpdata account.UserBase -o account/fixtures/users.json --indent 2`
-   `$ python manage.py dumpdata account.UserBase --output users.xml --format xml`
-   `$ python manage.py dumpdata account.UserBase --output users.yaml --format yaml`
-   `$ python manage.py loaddata users.json` → load data from `user.json` file across all fixtures.
-   `$ python manage.py loaddata fixture_name` → load data only from given fixture.

### Django Admin Panel

-   `django.contrib.admin` is a built-in Django application that provides a powerful and customizable administrative interface for managing the content of a Django website or application. The admin application allows developers to easily create, read, update, and delete (CRUD) records in the database through a web-based interface.
-   The admin application automatically generates an interface for each registered model in the Django project, allowing administrators to manage the database records in a user-friendly and secure way. The generated interface includes search, filtering, sorting, pagination, and CRUD operations for each model. The interface can also be customized by developers to fit the specific needs of their project.
-   The admin application is highly configurable and can be customized using Python code or templates to change the look and feel of the interface or to add custom functionality. Developers can define custom views, templates, forms, and widgets to extend the admin application's functionality.
-   `django.contrib.admin` is included in the Django core and is available by default in every Django project. It is designed to simplify the process of creating and managing database content for non-technical users, allowing them to focus on managing content rather than dealing with the underlying database and code.
-   [django-admin and manage.py](https://docs.djangoproject.com/en/4.0/ref/django-admin/#django-admin-createsuperuser)

The Django Admin panel is a built-in feature of the Django web framework that provides a user-friendly interface for managing the administrative tasks of a Django project. It is a powerful tool that allows developers, administrators, and authorized users to perform various administrative operations without having to write custom views or templates.

The Django Admin panel offers the following features:

-   `User Authentication`: The Admin panel provides a secure authentication system for administrators. It supports user registration, login, and password management.
-   `CRUD Operations`: It allows administrators to perform Create, Read, Update, and Delete (CRUD) operations on the database records. Administrators can add, edit, and delete records directly from the Admin interface.
-   `Automatic Interface Generation`: The Admin panel automatically generates the user interface based on the registered models in your Django project. It creates a customizable interface for each model, displaying fields, relationships, and actions associated with the model.
-   `Filtering and Searching`: Administrators can filter and search records based on specific criteria. The Admin panel provides filter options for each field in a model, allowing administrators to narrow down the displayed records.
-   `Permission Management`: Django Admin allows fine-grained control over user permissions and access rights. Administrators can define different user roles and assign specific permissions to each role, determining what operations users can perform in the Admin panel.
-   `Customization`: The Admin panel can be customized to match the project's branding and requirements. Developers can override templates, customize the layout, and add custom functionality to enhance the Admin interface.

The Django Admin panel is automatically enabled when you create a Django project. By registering your models with the Admin panel, you can easily manage and interact with your project's data through a user-friendly interface. It is particularly useful for managing content, performing administrative tasks, and quickly prototyping functionality during the development process.

### Django ORM

-   [Making queries](https://docs.djangoproject.com/en/4.2/topics/db/queries/#lookups-that-span-relationships)
-   [Django ORM Cookbook](https://books.agiliq.com/projects/django-orm-cookbook/en/latest/)

Django ORM (Object-Relational Mapping) is a component of the Django web framework that provides a high-level, Pythonic way to interact with databases. It allows developers to work with databases using Python objects and methods, rather than writing raw SQL queries.

The Django ORM abstracts away the underlying database and provides a consistent API for performing common database operations, such as creating, retrieving, updating, and deleting records. It simplifies the process of working with databases and helps ensure the security and integrity of data.

Key features of Django ORM include:

-   `Models`: In Django, a model is a Python class that represents a database table. Models define the fields and behavior of the data stored in the corresponding database table. They provide a way to define the structure of the data and perform operations on it, such as querying, filtering, and saving records.
-   `QuerySets`: QuerySets are used to retrieve and manipulate data from the database. They allow you to build complex queries using a chainable API, which resembles SQL syntax. QuerySets provide methods for filtering, ordering, aggregating, and performing other database operations.
-   `Field Types`: Django ORM supports various field types, such as integers, strings, dates, times, booleans, relationships (foreign keys, one-to-one, many-to-many), and more. Field types define the data type and constraints of the corresponding database column.
-   `Database Abstraction`: Django ORM provides a database abstraction layer that allows developers to write database-agnostic code. It supports multiple database backends, including PostgreSQL, MySQL, SQLite, and Oracle. Developers can switch between different database engines without changing their code.
-   `Migrations`: Django ORM includes a built-in migration system that helps manage database schema changes over time. Migrations allow you to evolve the database schema as your application evolves, keeping it in sync with your models. Migrations handle tasks such as creating tables, adding or modifying columns, and managing data migrations.

Django ORM offers a powerful and expressive way to work with databases in Django projects. It promotes a clean and efficient approach to database operations, reduces the amount of boilerplate code needed, and enhances code reusability. By leveraging Django ORM, developers can focus more on application logic and less on low-level database interactions.

### Django Signals

-   [Django ORM - Introducing Django Signals and the Observer Pattern](https://www.youtube.com/watch?v=p4vLpz1D4ow&list=PLOLrQ9Pn6cayYycbeBdxHUFrzTqrNE7Pe&index=38)
-   [Django ORM - Receiving Signals](https://www.youtube.com/watch?v=c4NEn7H5czA&list=PLOLrQ9Pn6cayYycbeBdxHUFrzTqrNE7Pe&index=36)
-   [Django ORM - Receiving Signals Specifying a Model](https://www.youtube.com/watch?v=BZ0vJDclU74&list=PLOLrQ9Pn6cayYycbeBdxHUFrzTqrNE7Pe&index=37)
-   []()

signals are a way to allow decoupled applications to get notified when certain actions occur elsewhere in the application. They provide a means for sending and receiving notifications between different parts of the codebase without having direct dependencies between them.

Signals are used to enable the "sender" of a signal to notify a group of "receivers" that something has happened. Receivers are functions or methods that are triggered when a signal is sent.

Here are some key concepts related to signals in Django:

-   `Signals`: Signals are objects representing specific actions or events that occur within a Django application. Django provides built-in signals, such as pre_save, post_save, pre_delete, post_delete, etc., which are triggered at different points during the lifecycle of a model.
-   `Senders`: A sender is the entity that sends a signal. In Django, senders are typically Django model classes, but they can be any Python object.
-   `Receivers`: A receiver is a function or method that gets executed in response to a signal being sent. Receivers define the actions to be performed when a specific signal is received. Receivers are registered to signals and can be located anywhere in the codebase.
-   `Signal Handlers`: Signal handlers are the functions or methods that implement the logic to be executed when a signal is received. They perform the desired actions based on the received signal.
-   `Signal Registration`: Signal receivers need to be registered with the appropriate signal to establish the connection between the sender and the receiver. This registration usually occurs in the ready() method of the application's configuration module or in a separate signals.py module.

Signals in Django provide a way to implement decoupled and reusable functionality. They allow different parts of an application to communicate with each other without tight coupling, enabling modularity and extensibility. Signals are commonly used for tasks like updating related models, sending notifications, triggering background tasks, and more.

To use signals in your Django project, you'll need to import the necessary signals, write signal handlers, and register the handlers with the corresponding signals. Django's documentation provides detailed information on how to work with signals and examples of their usage.

### Request and response objects

-   [Quick overview](https://docs.djangoproject.com/en/4.0/ref/request-response/#httprequest-objects)

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Middleware</summary>

-   [Middleware](https://docs.djangoproject.com/en/4.2/topics/http/middleware/)

### What is middleware:

Middleware is a framework of hooks into Django’s request/response processing. It’s a light, low-level “plugin” system for globally altering Django’s input or output.
Each middleware component is responsible for doing some specific function. For example, Django includes a middleware component, AuthenticationMiddleware, that associates users with requests using sessions.

-   There's middleware that isn't applied by default which we could activate obviously.
-   Security middleware is there by default.
-   the locale middleware is very interesting enables language selection based on data from the request that isn't activated by default and the gzip middleware also so this is a middleware which can compress content for browsers that understand gzip compression and that can help speed up the delivery of data

#### Writing your own middleware

A middleware factory is a callable that takes a get_response callable and returns a middleware. A middleware is a callable that takes a request and returns a response, just like a view.

-   A middleware can be written as a function that looks like this:

    ```python
    def simple_middleware(get_response):
    # One-time configuration and initialization.

        def middleware(request):
            # Code to be executed for each request before
            # the view (and later middleware) are called.

            response = get_response(request)

            # Code to be executed for each request/response after
            # the view is called.

            return response

        return middleware
    ```

-   it can be written as a class whose instances are callable, like this:

    ```python
    class SimpleMiddleware:
        def __init__(self, get_response):
            self.get_response = get_response
            # One-time configuration and initialization.

        def __call__(self, request):
            # Code to be executed for each request before
            # the view (and later middleware) are called.

            response = self.get_response(request)

            # Code to be executed for each request/response after
            # the view is called.

            return response
    ```

-   The `get_response` callable provided by Django might be the actual view (if this is the last listed middleware) or it might be the next middleware in the chain. The current middleware doesn’t need to know or care what exactly it is, just that it represents whatever comes next.

-   The above is a slight simplification – the `get_response` callable for the last middleware in the chain won’t be the actual view but rather a wrapper method from the handler which takes care of applying view middleware, calling the view with appropriate URL arguments, and applying template-response and exception middleware.

-   Middleware can either support only synchronous Python (the default), only asynchronous Python, or both. See Asynchronous support for details of how to advertise what you support, and know what kind of request you are getting.

-   Middleware can live anywhere on your Python path.

-   Middleware factories must accept a `get_response` argument. You can also initialize some global state for the middleware. Keep in mind a couple of caveats:

    -   Django initializes your middleware with only the `get_response` argument, so you can’t define **init**() as requiring any other arguments.
    -   Unlike the `call()` method which is called once per request, `init()` is called only once, when the web server starts.

#### How you activate middleware:

#### Middleware Hooks:

Middleware hooks are specific methods that can be implemented in middleware classes to perform additional processing at various stages of the request/response cycle. These hooks allow you to customize the behavior of middleware and add additional functionality to your Django application.

-   `process_request(self, request)`: This method is called before the view function is called. It receives the request object and can be used to modify the request or perform any preprocessing tasks. For example, you can perform authentication, URL routing, or session management operations here.

-   `process_view(self, request, view_func, view_args, view_kwargs)`: This method is called just before the view function is called. It receives the request object, the view function (view_func), and its arguments and keyword arguments. It allows you to modify the view function or perform additional processing based on the view being called. For example, you can add additional context to the request or perform authorization checks.

-   `process_exception(self, request, exception)`: This method is called when an exception occurs during request processing. It receives the request object and the raised exception. You can handle the exception, log it, or return an alternative response. This hook is useful for implementing custom error handling or exception logging.

-   `process_template_response(self, request, response)`: This method is called when the response returned by the view function is a TemplateResponse instance. It receives the request object and the response object. You can modify the template context or the response before it is rendered. This hook is commonly used to add additional context variables or modify the response content.

-   `process_response(self, request, response)`: This method is called after the view function has completed. It receives the request object and the response object. You can modify the response or perform any post-processing tasks. For example, you can add headers to the response or modify its content.

By implementing these middleware hooks, you can extend the functionality of middleware classes and customize their behavior according to your application's needs.

### CSRF (Cross Site Request Forgery):

-   [CSRF Documentation](https://docs.djangoproject.com/en/4.2/ref/csrf/)
-   [How to use Django’s CSRF protection](https://docs.djangoproject.com/en/4.2/howto/csrf/#using-csrf)
-   [Security tips for web developers](https://www.squarefree.com/securitytips/web-developers.html#CSRF)

### CORS (Cross Origin Resource Sharing):

-   [Django CORS Guide](https://www.stackhawk.com/blog/django-cors-guide/)
</details>

### Configure logging for Django app

-   [Logging](https://docs.djangoproject.com/en/4.2/topics/logging/)

---

---

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Deployment</summary>

-   `Gunicorn` and `uWSGI` are two popular Python WSGI (Web Server Gateway Interface) servers that are commonly used to serve Python web applications.
-   `Gunicorn` (short for Green Unicorn) is a Python WSGI HTTP server that is designed to be lightweight, fast, and easy to use. It can handle multiple requests concurrently and can scale to handle large numbers of requests. `Gunicorn` is commonly used in conjunction with a reverse proxy server, such as `Nginx` or `Apache`, which handles incoming requests and passes them on to `Gunicorn`.
    -   `gunicorn.socket` vs `gunicorn.service`: these are systemd units used for running Gunicorn, a Python WSGI HTTP server. They serve different purposes within the systemd service management system.
        -   `gunicorn.socket`: This unit represents a socket unit file. It defines a system socket that listens for incoming connections and passes them to the associated service unit (gunicorn.service). The gunicorn.socket unit allows systemd to manage the socket activation process, where the socket is created on-demand when a connection is received. This helps improve resource usage by only starting the Gunicorn process when needed.
        -   `gunicorn.service`: This unit represents a service unit file. It defines the Gunicorn service that handles the incoming connections received through the associated socket (gunicorn.socket). The gunicorn.service unit specifies the command to start the Gunicorn process, along with its configuration options and other settings.
-   `uWSGI` is a more feature-rich WSGI server that is designed to be highly configurable and extensible. It supports multiple protocols and interfaces, including WSGI, FastCGI, and HTTP. `uWSGI` is known for its ability to handle high traffic volumes and its support for a variety of advanced features, including load balancing, caching, and process management.
-   `Apache` is a popular web server that has been around for a long time. It is widely used and supports a wide range of features and modules, making it highly configurable and adaptable to different use cases. `Apache` is primarily used for serving static content and dynamic content through the use of modules such as PHP or Python.
-   `Nginx` is a newer web server that has gained popularity in recent years due to its high performance and scalability. `Nginx` is designed to handle large volumes of traffic and can serve both static and dynamic content. `Nginx` is often used as a reverse proxy in front of other web servers, such as `Apache` or `Tomcat`, to improve performance and reliability.
-   `Tomcat` is a Java-based web server and application server that is designed to serve Java applications. It supports the Java Servlet and JavaServer Pages (JSP) specifications and is often used to serve Java web applications. `Tomcat` is highly configurable and can be extended through the use of plugins and modules.
-   `Proxy Server` vs `Reverse Proxy Server`:

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

#### How to configure the following setup for Django project?

-   [How to use Django with uWSGI](https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/uwsgi/)
-   [How to use Django with Gunicorn](https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/gunicorn/)
-   [Setting up Django and your web server with uWSGI and nginx](https://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html#)
-   [Deploying Django with Docker Compose](https://www.youtube.com/watch?v=mScd-Pc_pX0&t=1928s)

The ultimate goal in this tutorial is to send requests from the client to Nginx which will pass them to a socket that will hand them off to uWSGI before finally being given to Django.

![server configuration for Django](/assets/django/nginx-uwsgi.webp)

<details><summary style="font-size:18px;color:Orange;text-align:left">Gunicorn</summary>

-   [https://docs.gunicorn.org/en/latest/settings.html](https://docs.gunicorn.org/en/latest/settings.html)
-   `gunicorn.socket` vs `gunicorn.service`: these are systemd units used for running Gunicorn, a Python WSGI HTTP server. They serve different purposes within the systemd service management system.

    -   `gunicorn.socket`: This unit represents a socket unit file. It defines a system socket that listens for incoming connections and passes them to the associated service unit (gunicorn.service). The gunicorn.socket unit allows systemd to manage the socket activation process, where the socket is created on-demand when a connection is received. This helps improve resource usage by only starting the Gunicorn process when needed.
    -   `gunicorn.service`: This unit represents a service unit file. It defines the Gunicorn service that handles the incoming connections received through the associated socket (gunicorn.socket). The gunicorn.service unit specifies the command to start the Gunicorn process, along with its configuration options and other settings.

-   `$ gunicorn core.wsgi:application --bind 0.0.0.0:8000`
-   `$ gunicorn core.wsgi:application --config ./gunicorn_config.py`

</details>

<details><summary style="font-size:18px;color:Orange;text-align:left">uWSGI</summary>

-   [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/index.html)

</details>

<details><summary style="font-size:18px;color:Orange;text-align:left">Nginx</summary>

-   [Learn Proper NGINX Configuration Context Logic](https://www.youtube.com/watch?v=C5kMgshNc6g&t=683s)
-   [How to Deploy Django on Nginx with uWSGI (full tutorial)](https://www.youtube.com/watch?v=ZpR1W-NWnp4&t=21s)

#### Terms and Concepts

The nginx configuration file, typically named `nginx.conf`, is a text-based file that specifies how the Nginx web server should behave. The `nginx.conf` file is written in a language called NGINX configuration language or NGINX Configuration Syntax. It is a custom configuration syntax specific to NGINX. It contains a set of directives within different contexts to specify their scope and define various aspects of server functionality, such as server listening ports, request handling, load balancing, caching, and security settings. The main contexts in an `nginx.conf` file are:

-   `Main Context`: The main context includes directives that apply globally to the entire Nginx server. It is typically defined within the http block. Directives within this context affect the overall behavior of the server, such as the number of worker processes, the user and group that the server runs as, and the configuration for logging. It typically contains directives such as server, upstream, and include.
    -   ![Main Context](/assets/nginx/main-context.png)
-   `Events Context`: The events context, also defined within the http block, is used to configure how Nginx handles connections and events. Directives in this context control parameters such as the maximum number of connections, the worker connections, and the multi_accept setting.

-   `HTTP Context`: The HTTP context contains server-level configurations and is defined within the http block. It includes directives related to HTTP protocol settings, server-wide proxies, gzip compression, SSL/TLS settings, and default MIME types. Server blocks (virtual servers) are typically defined within the HTTP context.

-   `Server Context`: The server context defines the configuration for a specific virtual server (server block). It is contained within the http context and includes directives that apply to a particular server or group of servers. Directives within the server context may include the server name, listening ports, SSL/TLS configurations, proxy settings, and location blocks.

-   `Location Context`: The location context is defined within a server context and is used to configure how Nginx handles specific URL patterns or paths. Directives within the location context determine how requests matching the specified pattern are processed. Examples of directives within the location context are root, try_files, proxy_pass, rewrite, and access control directives such as allow and deny.

Each directive is placed within the appropriate context to ensure it is applied at the desired level, whether it is server-wide, specific to a virtual server, or for handling requests matching a particular URL pattern. The context hierarchy and directive placement allow for fine-grained control over the server's behavior and functionality.

-   `Directive`: A directive is a command that configures a specific aspect of the server's behavior. Examples of commonly used directives are:

    -   ![Directives](/assets/nginx/directives.png)

    -   `listen`: Specifies the IP address and port on which Nginx should listen for incoming requests.
    -   `server_name`: Defines the domain name(s) associated with the server block.
    -   `root`: Specifies the document root directory where static files are located.
    -   `proxy_pass`: Forwards requests to a specified backend server.
    -   `try_files`: Defines the fallback behavior for file requests that do not exist.
    -   `ssl_certificate and ssl_certificate_key`: Configures SSL/TLS certificates for secure connections.
    -   `gzip`: Enables compression of HTTP responses to reduce file size.
    -   `access_log and error_log`: Specifies the log file locations for access and error logging.

-   `Include Directives`: The include directive allows you to split your configuration into multiple files for better organization. It is often used to include additional configuration snippets or separate files for server blocks and locations.

-   `Comments`: Lines starting with the # symbol are treated as comments and are ignored by Nginx. Comments are useful for adding explanatory notes or temporarily disabling directives.

It's important to note that the structure and directives in the `nginx.conf` file may vary depending on the specific setup and requirements of your web server. Understanding the purpose and proper usage of each directive is essential for configuring Nginx to meet your application's needs.

-   `Block` vs `Context`: In Nginx configuration files, the terms "block" and "context" are often used interchangeably to refer to a section of directives that serve a specific purpose. The distinction between blocks and contexts can be a bit nuanced, but in general, blocks refer to the specific groups of directives enclosed within curly braces, while contexts refer to the overall hierarchical structure and scope of the configuration file.

-   `Block`: A block in Nginx refers to a group of directives enclosed within curly braces {}. Blocks define the scope and boundaries of a configuration section and determine where directives are applicable. There are several types of blocks in an nginx.conf file:

-   `Include Directive`: The include directive in Nginx is used to include external configuration files within the main nginx.conf file. It allows you to split your configuration into multiple files for better organization and easier maintenance. Here's how the include directive works:

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

Using the include directive can help simplify the management of complex configurations by dividing them into smaller, modular files. It allows you to reuse common configurations across multiple server blocks, separate different aspects of the configuration, and make it easier to maintain and update your Nginx setup.

#### Basic Nignx Commands

-   `$ nginx -v` → Check Nginx version
-   `$ sudo nginx -t` → Check configuration file syntex before reloading
-   `$ nginx -T` → Display current configuration
-   `$ nginx -s reload` → Reload Nginx

#### Configuration file

-   `/ect/nginx/nginx.conf` → Main file location of Nginx
-   `/ect/nginx/conf.d/*.conf` → Include file location of Nginx

#### What is 'uwsgi_params' file?

The "uwsgi_params" file is a configuration file used by uWSGI, which is a fast and flexible application server commonly used for hosting Python web applications. The "uwsgi_params" file contains a set of predefined variables and configurations that are used to communicate between the web server (such as Nginx) and the uWSGI application server.
The contents of the "uwsgi_params" file typically include directives that define how certain aspects of the communication between Nginx and uWSGI should be handled. These directives often include settings related to request buffering, proxying, and headers.
Some common directives found in the "uwsgi_params" file include:

-   `uwsgi_param QUERY_STRING $query_string;`

    -   This directive sets the value of the QUERY_STRING variable to the value of the query string provided in the original HTTP request.

-   `uwsgi_param REQUEST_METHOD $request_method;`

    -   This directive sets the value of the REQUEST_METHOD variable to the HTTP request method (e.g., GET, POST, etc.).

-   `uwsgi_param CONTENT_TYPE $content_type;`

    -   This directive sets the value of the CONTENT_TYPE variable to the type of the content being sent in the request, such as "application/json" or "text/html".

-   `uwsgi_param CONTENT_LENGTH $content_length;`
    -   This directive sets the value of the CONTENT_LENGTH variable to the size of the content being sent in the request.

These directives are used to pass information from Nginx to the uWSGI application server, enabling proper handling of requests and responses.
The "uwsgi_params" file is typically included in the Nginx configuration when using uWSGI as the application server. It ensures that the necessary variables and configurations are available for the communication between Nginx and uWSGI to work correctly.
It's important to note that the specific contents of the "uwsgi_params" file can vary depending on the configuration and requirements of your specific application or environment.

</details>
</details>

---

<details>
<summary style="font-size:25px;color:Orange;text-align:left">HTTP Status Code Explainations</summary>

HTTP status codes are three-digit numbers that are returned by a server in response to a client's request. They provide information about the outcome of the request and the current state of the communication between the client and the server. Each status code has a specific meaning and is grouped into different categories.

Here is an overview of the main HTTP status code categories and their meanings:

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

HTTP status codes provide valuable information for understanding the outcome of a request and troubleshooting issues. By analyzing the status code received in the response, clients can take appropriate actions based on the specific situation encountered during the communication with the server.

</details>

---
