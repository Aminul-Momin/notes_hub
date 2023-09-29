## Notes on Django

![Django Architecture](/assets/django/django_model_view_template.png)

-   How do I check Django installation?
    -   `$ django-admin --version`

<details><summary style="font-size:18px;color:Orange;text-align:left">Importing Important Objects</summary>

```python



==========================================
from django.db import models

from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordResetForm, SetPasswordForm
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.tokens import PasswordResetTokenGenerator

from django.contrib.admin import ModelAdmin
from django.contrib.sites.shortcuts import get_current_site
from django.contrib import messages
from django.contrib import admin

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

from django.db import models

from decimal import Decimal

from six import text_type
# =============================================================================

from django.core.mail import send_mail
send_mail('Subject here','Here is the message.','from@example.com',['to@example.com'],fail_silently=False,)
```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Django Terms & Concepts</summary>

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
-   `Cross-Site Scripting (XSS)`
</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Django CLI</summary>

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

<details><summary style="font-size:18px;color:Orange;text-align:left">Models</summary>

-   Models ([doc](https://docs.djangoproject.com/en/4.1/ref/models/))

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

-   Read-only Meta attributes: - `label` - `label_lower`
</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Forms</summary>

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

-   [Widgets](https://docs.djangoproject.com/en/4.1/ref/forms/widgets/) || [Built-in widgets](https://docs.djangoproject.com/en/4.1/ref/forms/widgets/#built-in-widgets)

-   In Django, a widget is a graphical representation of an HTML form input element. Widgets are used to render HTML forms in Django templates and to handle user input.

-   Django provides a number of built-in widgets for different types of form fields, such as text inputs, checkboxes, radio buttons, and more. Widgets can also be customized or extended to create new types of form inputs or to modify the behavior of existing ones.

-   Widgets are defined as classes in Django and are associated with form fields through the widget attribute of the field. For example, the TextInput widget is associated with the CharField form field, while the CheckboxInput widget is associated with the BooleanField form field.

-   Widgets can be customized by subclassing the built-in widget classes or by creating new widget classes that inherit from the Widget class. Custom widgets can be used to render form inputs in a specific way or to handle user input in a custom way.

-   Widgets can also be used to specify additional attributes for HTML form input elements, such as CSS classes, placeholder text, or default values. This can be done by passing additional parameters to the widget constructor.

-   Some Widget classes are:

    -   `class TextInput`

        -   input_type: 'text'
        -   template_name: 'django/forms/widgets/text.html'
        -   Renders as: <input type="text" ...>

    -   `class EmailInput`:

        -   input_type: 'email'
        -   template_name: `django/forms/widgets/email.html`
        -   Renders as: <input type="email" ...>

    -   `class PasswordInput` - input_type: 'password' - template_name: `django/forms/widgets/password.html` - Renders as: <input type="password" ...> - Takes one optional argument: - render_value → Determines whether the widget will have a value filled in when the form is re-displayed after a validation error (default is False).

-   Specifying widgets:

    ```python
    from django import forms

    class Person(forms.Form):
        name = forms.CharField()
        web_url = forms.URLField()
        about = forms.CharField(widget=forms.Textarea)
        email = forms.EmailField(widget=forms.TextInput(attrs={'class': 'form-control mb-3', 'placeholder': 'Email', 'id': 'form-email'}), max_length=254)
    ```

</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Class-Based Views (CBVs)</summary>

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

</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Templating</summary>

-   [Templates](https://docs.djangoproject.com/en/4.1/topics/templates/)

#### Examples of using Variables, Tags and Filters in Django Templates

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

#### Django Context Processors:

-   a context processor is a Python function that allows you to add extra data to the context of every template rendered within a Django project. It's a convenient way to make certain data available globally to all templates without explicitly passing it in every view.
-   A context processor is a function that takes a request object as its parameter and returns a dictionary of values that will be added to the context of the template. The context processor function is executed for every request, and its returned values are accessible in templates.
-   `django.contrib.auth.context_processors.auth` is enabled by default & contains the variable `user`.

#### Variables

-   A variable outputs a value from the context, which is a dict-like object mapping keys to values.
-   Variables are surrounded by `{{`` and ``}}`` like this:

```html
My first name is {{ first_name }}. My last name is {{ last_name }}.
```

#### Tag

-   A template tag is a Python function that is executed within a template and allows you to perform more complex operations or logic than what is typically possible with the template language alone. Template tags provide additional functionality and allow you to manipulate data, control the flow of the template, or generate dynamic content.
-   Template tags can accept arguments and perform operations such as querying the database, manipulating strings, iterating over lists, or applying conditional logic. They provide a way to extend the functionality of Django templates and keep the presentation logic separate from the business logic.
-   Template tags are surrounded by `{% %}` tags in Django templates. There are two types of template tags: simple tags and inclusion tags.

    -   `Simple Tags`: Simple tags are used for performing simple operations or transformations on the data.
        They are defined as Python functions that take the context and any number of arguments and return a string that will be inserted into the template.

        -   Example: `{% tag_name argument1 argument2 %}`

    -   `Inclusion Tags`: Inclusion tags are used when you want to include another template and pass it a set of context data.
        They are defined as Python functions that take the context and any number of arguments and return a rendered template as a string.
        -   Example: `{% include_tag_name argument1 argument2 %}`

-   Built-in Template Tag: Django comes with a set of built-in template tags that cover common use cases, such as looping over lists, conditionally displaying content, formatting dates, and more. Additionally, you can create your own custom template tags to encapsulate reusable functionality specific to your project.

    -   [Built-in template tags and filters](https://docs.djangoproject.com/en/4.0/ref/templates/builtins/)

    -   `autoescape`: Django auto-escaping is a feature of the Django web framework that helps prevent Cross-Site Scripting (XSS) attacks by automatically escaping potentially dangerous characters in output templates. To prevent XSS attacks, Django automatically escapes output in templates by default. Developers can also use a special syntax in Django templates to disable auto-escaping for a particular block of content if they need to output HTML or other markup.

        ```html
        {% autoescape off %} ... {% endautoescape %}
        ```

-   Custom Template Tag:

    -   [Creating Custom Template Tags and Filters](https://www.youtube.com/watch?v=XtbvBlCyfT4)

    -   To use a custom template tag, you need to follow these steps:

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

    -   Template tags provide a powerful mechanism for extending the capabilities of Django templates and allow you to create reusable and modular templates that can handle complex tasks and display dynamic content.

#### Filters:

-   [Built-in Filters](https://docs.djangoproject.com/en/4.1/ref/templates/builtins/#ref-templates-builtins-filters)
-   [Writing custom template filters](https://docs.djangoproject.com/en/4.1/howto/custom-template-tags/#howto-writing-custom-template-filters)

Filters transform the values of variables and tag arguments.

</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Object Relational Mapper (ORM)</summary>

-   [Django Documentations: QuerySet API](https://docs.djangoproject.com/en/4.2/ref/models/querysets/#queryset-api-reference)
-   [Django Documentations: Making queries](https://docs.djangoproject.com/en/4.2/topics/db/queries/#lookups-that-span-relationships)
-   [When QuerySets are evaluated](https://docs.djangoproject.com/en/4.2/ref/models/querysets/#when-querysets-are-evaluated)
-   [Django ORM Cookbook](https://books.agiliq.com/projects/django-orm-cookbook/en/latest/)

Django ORM (Object-Relational Mapping) is a component of the Django web framework that provides a high-level, Pythonic way to interact with databases. It allows developers to work with databases using Python objects and methods, rather than writing raw SQL queries.

The Django ORM abstracts away the underlying database and provides a consistent API for performing common database operations, such as creating, retrieving, updating, and deleting records. It simplifies the process of working with databases and helps ensure the security and integrity of data.

Key features of Django ORM include:

-   `Models`: In Django, a model is a Python class that represents a database table. Models define the fields and behavior of the data stored in the corresponding database table. They provide a way to define the structure of the data and perform operations on it, such as querying, filtering, and saving records.
-   `QuerySets`: QuerySets are used to retrieve and manipulate data from the database. They allow you to build complex queries using a chainable API, which resembles SQL syntax. QuerySets provide methods for filtering, ordering, aggregating, and performing other database operations.
-   `Field Types`: Django ORM supports various field types, such as integers, strings, dates, times, booleans, relationships (foreign keys, one-to-one, many-to-many), and more. Field types define the data type and constraints of the corresponding database column.
-   `Database Abstraction`: Django ORM provides a database abstraction layer that allows developers to write database-agnostic code. It supports multiple database backends, including PostgreSQL, MySQL, SQLite, and Oracle. Developers can switch between different database engines without changing their code.
-   `Migrations`: Django ORM includes a built-in migration system that helps manage database schema changes over time. Migrations allow you to evolve the database schema as your application evolves, keeping it in sync with your models. Migrations handle tasks such as creating tables, adding or modifying columns, and managing data migrations.

#### Manager() vs QuerySet():

In Django, both Manager and QuerySet are integral parts of the Object-Relational Mapping (ORM) system, which allows you to interact with your database using Python objects instead of writing raw SQL queries. However, they serve different purposes within the Django ORM.

-   `Manager`:

    -   [Managers doc](https://docs.djangoproject.com/en/4.0/topics/db/managers/)
    -   A Manager is an interface through which database queries are executed. It's like a higher-level API that provides methods for creating, retrieving, updating, and deleting objects in the database. By default, every Django model has a default manager called objects. You can also define your own custom managers to add specific methods or query functionality to your models.
    -   For example, you might create a custom manager to encapsulate common queries that you frequently use with a specific model. This allows you to encapsulate logic and reusability within the manager's methods.

    ```python
    from django.db import models

    class CustomManager(models.Manager):
        def get_published(self):
            return self.filter(published=True)

    class Post(models.Model):
        title = models.CharField(max_length=100)
        content = models.TextField()
        published = models.BooleanField(default=False)

        objects = CustomManager()  # Using the custom manager
    ```

    -   In the above example, the CustomManager class defines a method get_published() which returns published posts. The objects attribute is assigned an instance of CustomManager, making the method accessible as a query method on the model.

-   `QuerySet`:

    -   [QuerySet API doc](https://docs.djangoproject.com/en/4.1/ref/models/querysets/)
    -   A QuerySet is a representation of a database query. When you perform a query using a Manager method, it returns a QuerySet object. A QuerySet allows you to chain methods together to build complex queries. It is lazy-evaluated, meaning that the actual database query is executed only when the results are needed, typically when you iterate over the QuerySet or retrieve data from it.

    ```python
    published_posts = Post.objects.get_published()
    filtered_posts = published_posts.filter(title__icontains='Django')
    ```

    -   In the above example, get_published() returns a QuerySet of published posts, and then the filter() method is chained to further narrow down the selection to posts with titles containing "Django".
    -   In summary, Manager is responsible for defining query methods on a model, while QuerySet is the representation of the actual query and allows you to chain methods to build and refine queries. They work together to provide a powerful way to interact with your database using Python code.

#### 'model.Manager.create()' and 'model.Model.save()'

-   `model.Manager.create(**kwargs)`:

    -   The `create()` method is a convenient way to create a new instance of a model and save it to the database in a single step. It's available on the model's default manager (usually named objects).

    ```python
    # Using create() to create and save a new instance
    new_person = Person.objects.create(first_name='John', last_name='Doe')
    ```

    -   Benefits:

        -   Short and concise syntax.
        -   Automatically creates and saves the object in a single call.

    -   Drawbacks:

        -   Limited flexibility compared to save(). You can't modify the instance after it's created before saving.
        -   Does not allow easy handling of exceptions during creation and saving separately.

-   `model.Model.save()`:

    -   The `save()` method is used on an instance of a model to save changes to the database. It's available on any instance of a model.

    ```python
    # Creating an instance and saving it separately using save()
    new_person = Person(first_name='John', last_name='Doe')
    new_person.save()
    ```

    ```python
    # Modifying an instance and then saving it using save()
    person = Person.objects.get(pk=1)
    person.first_name = 'Jane'
    person.save()
    ```

    -   Benefits:

        -   Offers more flexibility as you can modify the instance's attributes before saving.
        -   Allows you to handle exceptions more granularly (e.g., you can catch specific database-related exceptions).

    -   Drawbacks:

        -   Requires two steps (creating instance, then saving) compared to create().
        -   Requires more verbose code when compared to create().

### [What is `Q` object in Djanog ORM?](https://docs.djangoproject.com/en/4.2/topics/db/queries/#complex-lookups-with-q-objects)

-   the `Q` object is a powerful tool for building complex database queries using the logical OR and AND operators. It allows you to create more flexible and dynamic queries when filtering database records.

-   The `Q` object is part of Django's django`.db.models module`, and you typically use it in combination with the `filter()` method on a queryset to construct complex conditions for data retrieval. Here's how it works

    ```python
    from django.db.models import Q

    # Retrieve all books where the title contains "Django" OR the author's name is "John Doe"
    books = Book.objects.filter(Q(title__icontains='Django') | Q(author='John Doe'))
    ```

### How to perform `JOIN` query ?

-   In Django's Object-Relational Mapping (ORM), you can perform JOIN operations to retrieve data from multiple database tables using various methods. Below are some common ways to perform a JOIN query in Django ORM:
-   Assuming you have two Django models: Author and Book, and you want to join them based on a common field, such as author_id, here's a demonstration of multiple ways to perform a JOIN query:

#### Using `.select_related()` for `ForeignKey` Relationships:

-   If you have a ForeignKey relationship defined between two models, you can use `.select_related()` to perform an SQL `INNER JOIN`. This is the most common method for joining related models in Django.

```python
from myapp.models import Author, Book

# Using select_related for an INNER JOIN
books = Book.objects.select_related('author').all()

# Accessing related fields
for book in books:
    print(f"Book Title: {book.title}, Author: {book.author.name}")
```

#### Using `.prefetch_related()` for `ManyToMany` Relationships:

-   When dealing with `ManyToMany` relationships, you can use `.prefetch_related()` to perform a `JOIN` and prefetch related objects.

    ```python
    from myapp.models import Author, Book

    # Using prefetch_related for an INNER JOIN on a ManyToMany relationship
    authors = Author.objects.prefetch_related('books').all()

    # Accessing related objects
    for author in authors:
        print(f"Author: {author.name}, Books: {[book.title for book in author.books.all()]}")
    Using .filter() and annotate() for Custom Joins:
    ```

-   If you need to perform a custom join with specific conditions, you can use `.filter()` and `.annotate()` to join tables and create custom queries.

    ```python
    from myapp.models import Author, Book

    # Custom JOIN query using filter and annotate
    authors_with_books = Author.objects.filter(book__isnull=False).annotate(
        book_count=Count('book')
    ).all()

    # Accessing custom annotated fields
    for author in authors_with_books:
        print(f"Author: {author.name}, Number of Books: {author.book_count}")
    ```

#### Using Raw SQL Queries:

-   In cases where you need to perform complex joins that are not easily expressible in Django's query syntax, you can use raw SQL queries. Be cautious when using raw SQL to ensure security and portability.

    ```python
    from django.db import connection

    # Execute a raw SQL query with JOIN
    with connection.cursor() as cursor:
        cursor.execute(
            """
            SELECT myapp_author.name, myapp_book.title
            FROM myapp_author
            INNER JOIN myapp_book ON myapp_author.id = myapp_book.author_id
            """
        )
        results = cursor.fetchall()

    # Process the results
    for row in results:
        print(f"Author: {row[0]}, Book Title: {row[1]}")
    ```

### Django Fixtures

-   Django fixtures are a way of loading data into the database that your Django application is using. A fixture is a collection of data that Django knows how to import into a database.
-   Fixtures are typically written as a JSON, XML or YAML file and can be used to load initial data into your database when you set up your application, as well as to provide test data when running tests. They can be useful for populating your database with sample data for development, for sharing data between different instances of an application, and for resetting the database to a known state for testing purposes.

-   [How to use Django loaddata and dumpdata?](https://zerotobyte.com/how-to-use-django-loaddata-and-dumpdata/)

-   `$ python manage.py dumpdata account.UserBase -o account/fixtures/users.json --indent 2`
-   `$ python manage.py dumpdata account.UserBase --output users.xml --format xml`
-   `$ python manage.py dumpdata account.UserBase --output users.yaml --format yaml`
-   `$ python manage.py loaddata users.json` → load data from `user.json` file across all fixtures.
-   `$ python manage.py loaddata fixture_name` → load data only from given fixture.

</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Middleware</summary>

-   [Middleware](https://docs.djangoproject.com/en/4.2/topics/http/middleware/)

### What is middleware:

-   Middleware is a framework of hooks into Django’s request/response processing. It’s a light, low-level “plugin” system for globally altering Django’s input or output.
-   Each middleware component is responsible for doing some specific function. For example, Django includes a middleware component, AuthenticationMiddleware, that associates users with requests using sessions.

-   There's middleware that isn't applied by default which we could activate obviously.
-   Security middleware is there by default.
-   the locale middleware is very interesting enables language selection based on data from the request that isn't activated by default and the gzip middleware also so this is a middleware which can compress content for browsers that understand gzip compression and that can help speed up the delivery of data

#### Writing your own middleware

-   A middleware factory is a callable that takes a get_response callable and returns a middleware. A middleware is a callable that takes a request and returns a response, just like a view.

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

</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Django Admin Panel</summary>

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

### Django Logging System

-   [Using the Django authentication system](https://docs.djangoproject.com/en/4.1/topics/auth/default/)
-   []()
-   []()
-   []()

</details>

---

<details>
<summary style="font-size:18px;color:Orange;text-align:left">Django Signals</summary>

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

</details>

---

### Django Session

-   ![Django Session Archictures](/assets/django/django-session-steps.png)

---

### Request and response objects

-   [Quick overview](https://docs.djangoproject.com/en/4.0/ref/request-response/#httprequest-objects)

---

### CSRF (Cross Site Request Forgery):

-   [CSRF Documentation](https://docs.djangoproject.com/en/4.2/ref/csrf/)
-   [How to use Django’s CSRF protection](https://docs.djangoproject.com/en/4.2/howto/csrf/#using-csrf)
-   [Security tips for web developers](https://www.squarefree.com/securitytips/web-developers.html#CSRF)

-   `What is CSRF`?

    -   CSRF occurs when an attacker tricks a user into performing actions on a different website where the user is authenticated. This can lead to unauthorized actions being taken on behalf of the user, such as changing passwords or making unwanted purchases.
    -   Cross-Site Request Forgery (CSRF) is a type of web vulnerability where an attacker tricks a user into performing actions on a website without their knowledge or consent. Django, being a security-focused web framework, provides robust CSRF protection by default. Let's dive into the details of how CSRF protection works in Django:

-   `Django's CSRF Protection Mechanism`:
    Django's CSRF protection is designed to prevent unauthorized requests from being processed. Here's how it works:

    -   `Middleware`:

        -   Django includes a middleware component called django.middleware.csrf.CsrfViewMiddleware. This middleware is responsible for adding CSRF tokens to outgoing forms and checking incoming requests for valid tokens.

    -   `CSRF Token Generation`:

        -   When a user visits a Django website, the server generates a unique CSRF token for that user's session. This token is a random string.

        -   The token is stored both in the session data (server-side) and as a cookie in the user's browser (client-side).

    -   `Token Inclusion in Forms`:

        -   When rendering an HTML form, Django's template system automatically includes the CSRF token as a hidden field within the form.

            ```html
            <form method="post" action="/example/">
                {% csrf_token %}
                <!-- other form fields -->
                <input type="submit" value="Submit" />
            </form>
            ```

        -   The {% csrf_token %} template tag inserts the CSRF token.

    -   `Token Validation on Submission`:

        -   When the user submits the form, the token value from the hidden field is included in the POST data.

        -   Upon receiving the POST request, Django's CsrfViewMiddleware checks the submitted token against the token stored in the user's session.

        -   If the tokens match, the request is considered legitimate, and the action (e.g., form submission) is allowed to proceed.

        -   If the tokens do not match or if no token is included in the request, Django raises a CSRFTokenMissing or CSRFTokenError exception, depending on the circumstances.

    -   `Token Rotation`:

        -   To prevent certain types of attacks, Django rotates (changes) the CSRF token for a user's session whenever they log in or log out.

        -   This means that even if an attacker manages to obtain a valid token, it becomes useless once the user logs out or their session expires.

-   `CSRF Protection in Practice`:

    -   Django's CSRF protection is transparent to developers and is automatically applied to all forms generated using Django's form system.
    -   `Developers don't need to manually verify CSRF tokens; Django does this automatically.
    -   Here's what developers need to do`:

        -   Use Django's built-in form system to render forms ({% csrf_token %} is automatically included).
        -   Ensure that all POST requests (form submissions) are protected by CSRF tokens.

-   `Limitations`: While Django's CSRF protection is effective, there are a few considerations

    -   `It relies on cookies`: CSRF protection depends on the browser storing and sending the CSRF cookie, which may not work in some situations (e.g., when using an API with a client that doesn't support cookies).

    -   `AJAX requests`: For AJAX requests, developers need to ensure that the CSRF token is included in the request headers manually.

    -   `Same-origin policy`: CSRF protection assumes that the attacker can't make cross-origin requests with the user's credentials. If there are weaknesses in the same-origin policy (e.g., CORS misconfigurations), CSRF attacks may still be possible.

In summary, Django's CSRF protection is a robust defense against CSRF attacks, and it's seamlessly integrated into the framework. Developers should ensure that they use Django's form system correctly and be aware of the limitations when dealing with non-standard scenarios.

### CORS (Cross Origin Resource Sharing):

-   [Django CORS Guide](https://www.stackhawk.com/blog/django-cors-guide/)

### Cross-Site Scripting (XSS)

</details>

### Configure logging for Django app

-   [Logging](https://docs.djangoproject.com/en/4.2/topics/logging/)

---

---
