<h1 style="text-align:center"> <a href="https://docs.djangoproject.com/en/5.0/contents/">Django documentation contents</a> </h1>

![Django Architecture](/assets/django/django_model_view_template.png)

-   How do I check Django installation?
    -   `$ django-admin --version`

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Django CLI</summary>

-   [**django-admin & manage.py**](https://docs.djangoproject.com/en/5.0/ref/django-admin/#django-admin-and-manage-py)

**django-admin** and **manage.py** are Django’s command-line utility for administrative tasks. `manage.py` is automatically created in each Django project. It does the same thing as django-admin but also sets the DJANGO_SETTINGS_MODULE environment variable so that it points to your project’s settings.py file. Generally, when working on a single Django project, it’s easier to use `manage.py` than django-admin. If you need to switch between multiple Django settings files, use django-admin with DJANGO_SETTINGS_MODULE or the --settings command line option.

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

<details><summary style="font-size:22px;color:Orange;text-align:left">Django Architecture, Terms & Concepts</summary>

Django is a high-level web framework for building web applications in Python. Its architecture follows the Model-View-Controller (MVC) pattern, but in the Django context, it is often referred to as the Model-View-Template (MVT) pattern. The main components of Django architecture include models, views, templates, and the URL dispatcher.

**Models**:

-   `Description`: The model component represents the data structure of the application. It defines the data schema, including the fields and their relationships, and interacts with the database to perform CRUD (Create, Read, Update, Delete) operations.
-   `Implementation`: Models are defined as Python classes that subclass django.db.models.Model. Each attribute in the model class represents a field in the database table, and relationships between models are defined using ForeignKey, OneToOneField, etc.

    ```python
    from django.db import models

    class Person(models.Model):
        name = models.CharField(max_length=100)
        age = models.IntegerField()
    ```

**Views**:

-   `Description`: Views handle the user interface and business logic. They receive requests from the user, interact with the models to retrieve or modify data, and then return an appropriate response. Views are responsible for processing the HTTP request and returning an HTTP response.
-   `Implementation`: Views are implemented as Python functions or classes. Class-based views provide a more organized way to handle different HTTP methods and functionalities.

    ```python
    from django.shortcuts import render
    from django.http import HttpResponse
    from .models import Person

    def index(request):
        people = Person.objects.all()
        return render(request, 'index.html', {'people': people})
    ```

**Templates**:

-   `Description`: Templates are responsible for generating dynamic HTML content to be sent back to the user. They define the structure and layout of the presentation layer, and they can include variables and control structures to render dynamic content.
-   `Implementation`: Templates are typically written in Django Template Language (DTL), which is a template language specifically designed for Django. Templates are stored in the 'templates' directory of the Django app.

    ```html
    <ul>
        {% for person in people %}
        <li>{{ person.name }} - {{ person.age }}</li>
        {% endfor %}
    </ul>
    ```

**URL Dispatcher**:

-   `Description`: The URL dispatcher is responsible for mapping URLs to views. It determines which view function or class should handle a specific URL pattern. This allows for a clean separation of concerns and makes it easy to manage different parts of the application.
-   `Implementation`: URL patterns are defined in the urls.py file of each Django app. The urls.py file maps URL patterns to corresponding views using regular expressions and includes other URL patterns from other apps or the project.

**Middleware**:

-   `Description`: Middleware is a way to process requests globally before they reach the views or after the response is returned. It allows you to perform actions such as authentication, security checks, and content processing.
-   `Implementation`: Middleware components are configured in the MIDDLEWARE setting of the Django project. Django comes with built-in middleware, and you can also write custom middleware.
    Settings:

-   `Description`: The settings file contains configuration settings for the Django project. It includes database configuration, middleware settings, template settings, and more.
-   `Implementation`: The settings.py file in the project's main directory contains various configurations. Developers can modify this file to customize the behavior of the Django project.

**Other Terms & Concepts**:

-   `Middleware`: Middleware is a way to add extra functionality to the request/response processing pipeline in Django. Middleware can be used for authentication, caching, logging, and more.
    -   Middleware is a way to process requests globally before they reach the view.
    -   Django includes built-in middleware for common tasks like authentication, security, and more.
-   `Admin site`: The Django admin site is a built-in application that provides an interface for managing data in the database. It allows authorized users to create, read, update, and delete records in the database.
    -   Django comes with a built-in admin interface for managing models and data.
    -   Admin views are generated based on the model definitions.
-   `Migration`: A migration is a way to update the database schema to match changes to the models. Migrations are created automatically by Django when changes are made to the models.

    -   Django migrations are a set of changes to your database schema. They allow you to evolve your database schema over time while preserving existing data. Here are key points about Django migrations:

    -   `Initialization`:
        -   Migrations are used to initialize a new database, update the schema, and handle changes to the models.
        -   The makemigrations command is used to create new migrations based on changes in models.
    -   `Models as Source of Truth`:
        -   Django follows the "models as a source of truth" approach. The database schema is derived from the models defined in your Django application.
    -   `Migration Files`:
        -   Migration files are Python scripts generated by the makemigrations command.
        -   They reside in the migrations directory of each Django app and represent changes to the database schema.
    -   `migrate Command`:
        -   The migrate command is used to apply migrations and update the database schema.
        -   It reads migration files, executes the changes, and maintains a record of which migrations have been applied.
    -   `Rollback`:
        -   Migrations support rollback. You can reverse a migration using the migrate command, undoing the changes made by a specific migration.
    -   `Database State Tracking`:
        -   Django maintains a special table (django_migrations) in the database to track which migrations have been applied.
    -   `Custom Migrations`:
        -   You can create custom migrations for specific operations or data migrations beyond what Django automatically generates.
    -   `Atomic Operations`:
        -   Migrations are designed to be atomic; either all the changes in a migration are applied, or none of them are.
    -   `Dependencies`:
        -   Migrations can have dependencies on other migrations, ensuring that they are applied in the correct order.
    -   `Schema and Data Changes`:
        -   Migrations handle both schema changes (e.g., adding or altering tables) and data migrations (e.g., transforming existing data during a schema change).

-   `QuerySet`: A QuerySet is a collection of database objects that can be filtered, sorted, and manipulated. QuerySets are created by calling a method on a model manager.

    -   A Django QuerySet is a representation of a database query. It allows you to interact with your database and retrieve, filter, or manipulate data. Here are key points about Django QuerySets:

    -   `Lazy Evaluation`:

        -   QuerySets are lazy, meaning they are not evaluated until they are explicitly requested.
        -   Operations on a QuerySet, such as filtering or ordering, do not immediately hit the database; they are stored as part of the QuerySet.

    -   `Chaining Methods`:

        -   QuerySets support method chaining, allowing you to combine multiple operations into a single query.
        -   Each method returns a new QuerySet, which can be further refined.

-   `CSRF (Cross-Site Request Forgery)`:
-   `CORS (Cross-Origin Resource Sharing)`
-   `Cross-Site Scripting (XSS)`
</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Models</summary>

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

-   [Field types](https://docs.djangoproject.com/en/4.1/ref/models/fields/#field-types):

    -   [SlugField](https://docs.djangoproject.com/en/4.1/ref/models/fields/#slugfield)
    -   [TextField](https://docs.djangoproject.com/en/4.1/ref/models/fields/#textfield)
    -   [CharField](https://docs.djangoproject.com/en/4.1/ref/models/fields/#charfield)
    -   `EmailField`
    -   `BooleanField`
    -   `DateField`
    -   `FileField`
    -   `FilePathField`
    -   `ImageField`
    -   `AutoField`
    -   `DateTimeField`
    -   `FloatField`
    -   `DecimalField`
    -   `IntegerField`
    -   `UUIDField`

-   [Relationship Fields](https://docs.djangoproject.com/en/4.1/ref/models/fields/#module-django.db.models.fields.related):

    -   `ForeignKey(to, on_delete, **options)` | [doc](https://docs.djangoproject.com/en/4.1/ref/models/fields/#foreignkey)

        -   A ForeignKey is used to create a one-to-many relationship. It's used to associate one object with another, where one object (the "source" or "parent") can have multiple related objects (the "targets" or "children").
        -   Example: A Book model with a ForeignKey to an Author model establishes a relationship where each book is associated with one author, but an author can have multiple books.
        -   Behind the scenes, Django appends `_id` to the field name to create its database column name.
        -   ForeignKey accepts other arguments that define the details of how the relation works.
            -   `on_delete`: When an object referenced by a ForeignKey is deleted, Django will emulate the behavior of the SQL constraint specified by the `on_delete` argument.
                -   The possible values for `on_delete` are found in django.db.models:
                    -   `models.CASCADE`, `models.SET_NULL`, `models.SET_DEFAULT`, `models.DO_NOTHING`, `models.CASCADE`
            -   `related_name`: The name to use for the relation from the related object back to this one. It’s also the default value for `related_query_name`

    -   `ManyToManyField(to, **options)` | [doc](https://docs.djangoproject.com/en/4.1/ref/models/fields/#manytomanyfield)

        -   A ManyToManyField is used to create a many-to-many relationship between objects. This means that multiple objects from one model can be related to multiple objects from another model.
        -   Example: A Student model with a ManyToManyField to a Course model establishes a many-to-many relationship, where each student can enroll in multiple courses, and each course can have multiple students.
        -   `related_name`
        -   `related_query_name`
        -   `limit_choices_to`
        -   `symmetrical`
        -   `through`
        -   `through_fields`
        -   `db_table`
        -   `db_constraint`
        -   `swappable`

    -   `OneToOneField(to, on_delete, parent_link=False, **options)` | [doc](https://docs.djangoproject.com/en/4.1/ref/models/fields/#onetoonefield)

        -   A OneToOneField is a type of ForeignKey with a unique constraint. It creates a one-to-one relationship, ensuring that each source object is associated with only one target object, and vice versa.
        -   Example: A Profile model with a OneToOneField to a User model creates a one-to-one relationship, where each user has a single profile, and each profile belongs to only one user.
        -   `on_delete`: When an object referenced by a ForeignKey is deleted, Django will emulate the behavior of the SQL constraint specified by the `on_delete` argument.
        -   `parent_link`: When True and used in a model which inherits from another concrete model, indicates that this field should be used as the link back to the parent class, rather than the extra OneToOneField which would normally be implicitly created by subclassing.

    -   `GenericForeignKey` and `GenericRelation`:

        -   These fields are used when you need to create a generic relationship that can link a model to any other model. It's typically used for scenarios where a model can be related to different types of objects.
        -   Example: A Comment model can have a GenericForeignKey to allow it to be associated with various other models like BlogPost, Video, and Image.

    -   `Reverse Relations`:

        -   By defining a related name in a ForeignKey or a ManyToManyField, you can create reverse relations. These allow you to access objects related to a particular instance from the other end of the relationship.
        -   Example: If an Book model has a ForeignKey to a Author model with related_name='books', you can access the books written by an author using author.books.all().

-   `Field Options` (Arguments of Field Types): In Django, a Model represents a table in a database and its fields represent columns. Each field in a Django Model can have various options (parameters) to customize its behavior. Here are some commonly used Django model field options:

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

In Django, the Meta class in a model serves several important purposes for defining and configuring how the model behaves and interacts with the database. The Meta class is a class within the model that allows you to set various options and metadata related to the model. Here are some of the primary purposes of the Meta class in a Django model:

```python
class MyModel(models.Model):
    # Fields go here

    class Meta:
        db_table = 'custom_table_name'
        ordering = ['field_name']
        permissions = [
            ("can_view_special_content", "Can view special content"),
            ("can_edit_special_content", "Can edit special content"),
        ]

        verbose_name = 'Custom Name'
        verbose_name_plural = 'Custom Names'
        app_label = 'my_app'
```

-   `Database Table Naming`: You can specify the name of the database table associated with the model. By default, Django will generate a table name based on the app and model name, but you can override this using the `db_table` attribute in the Meta class.
-   `Model Ordering`: You can define the default ordering for query sets using the `ordering` attribute. This allows you to specify how the model's records should be sorted when queried.
-   `Permissions`: The Meta class allows you to specify permissions for the model using the `permissions` attribute. This can be used to define custom permissions for the model.
-   `default-permissions`: Defaults to ('add', 'change', 'delete', 'view'). You may customize this list, for example, by setting this to an empty list if your app doesn’t require any of the default permissions. It must be specified on the model before the model is created by migrate in order to prevent any omitted permissions from being created.
-   `Unique Constraints`: You can specify unique constraints on model fields using the `unique_together` attribute in the Meta class. This ensures that combinations of field values are unique.

    ```python
    class MyModel(models.Model):
        name = models.CharField(max_length=50)
        category = models.CharField(max_length=50)

        class Meta:
            unique_together = ('name', 'category')
    ```

-   `Verbose Name and Plural Name`: You can provide human-readable names for the model and its plural form using `verbose_name` and `verbose_name_plural` attributes. By default, Django uses the class name and adds an 's' for the plural form.
-   `App Label`: The Meta class allows you to specify the label of the app using `app_label` attribute to which the model belongs. This can be useful when dealing with models from different apps.

The Meta class provides a way to configure various aspects of a Django model, including database-level options, permissions, and human-readable names. It helps in customizing the behavior and presentation of the model to fit the specific requirements of your project.

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

#### [Model Inheritance Options](https://www.youtube.com/watch?v=4Xag2FzmN60&list=PLOLrQ9Pn6cazjoDEnwzcdWWf4SNS0QZml&index=9)

-   **Abstract Models**
-   **Multi-Table Model Inheritance**
-   **Proxy Models**

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Forms</summary>

-   [DOCS: Forms](https://docs.djangoproject.com/en/4.1/ref/forms/)
-   [Working with forms](https://docs.djangoproject.com/en/4.1/topics/forms/)
-   [The Forms API](https://docs.djangoproject.com/en/4.1/ref/forms/api/)
-   [Form fields](https://docs.djangoproject.com/en/4.1/ref/forms/fields/)

```python
from django.forms.fields import *
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordResetForm, SetPasswordForm
```

-   `Form Class`:

    -   Django provides a `django.forms.Form` class to create HTML forms.
    -   Forms are used to handle user input, validate data, and generate HTML for rendering.

-   `Field Types`:

    -   Django forms include various built-in field types (e.g., `CharField`, `IntegerField`, `EmailField`, etc.) to represent different types of input.

-   `Validation`:

    -   Forms perform validation on submitted data based on field types and additional validation methods.
    -   Errors are generated for invalid input, and error messages can be displayed in the template.

-   `Widgets`:

    -   Form fields use widgets to define how the input should be displayed in HTML.
    -   Examples of widgets include TextInput, PasswordInput, and CheckboxInput.

-   `Form Rendering`:

    -   Django provides template tags and filters for rendering form fields in HTML templates.
    -   The `{{ form }}` variable in a template renders all fields of the form.

-   `Handling Submissions`:

    -   Forms handle both initial form rendering and form submission.
    -   When a form is submitted, the data is validated, and if valid, it can be processed in the view.

-   `CSRF Protection`:

    -   Django forms include built-in CSRF protection to prevent Cross-Site Request Forgery attacks.
    -   `{% csrf_token %}` is used in the form template to include a hidden input with a CSRF token.

-   `Model Forms`:

    -   Django provides ModelForm which is a specialized form for working with Django models.
    -   It automatically generates form fields based on the model's fields.

-   `Formsets`:

    -   Django allows the creation of formsets, which are a way to manage multiple forms on the same page.

-   `Customization`:

    -   Forms can be customized by defining a form class and overriding methods like `__init__` and `clean`.
    -   Custom validation methods can be added to perform additional validation logic.

-   `Rendering without a Model`:

    -   Forms can be used without a corresponding model. They can handle arbitrary data.
    -   This is useful for scenarios where data doesn't need to be stored in a database.

-   `Dynamic Forms`:

    -   Form classes can be dynamically created or modified based on conditions or user input in the view.

-   `Internationalization (i18n)`:

    -   Forms support internationalization by allowing translation of error messages and labels.

-   `AJAX Support`:

    -   Forms can be used in combination with AJAX to submit and validate data without reloading the entire page.

-   `Form Fields` and `Field Arguments`:

    -   Available Fields Arguments :

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

        -   Default widget: By default, a `CharField` will have a `TextInput` widget, that produces an `<input type="text">` in the HTML. If you needed `<textarea>` instead, you’d specify the appropriate widget when defining your form field,
        -   Empty value: Whatever you’ve given as `empty_value`.
        -   Normalizes to: A string.
        -   Uses `MaxLengthValidator` and `MinLengthValidator` if `max_length` and `min_length` are provided. Otherwise, all inputs are valid.
        -   Error message keys: `required`, `max_length`, `min_length`
        -   Has the following optional arguments for validation:
            -   `max_length`/`min_length` → If provided, these arguments ensure that the string is at most or at least the given length.
            -   `strip` → If True (default), the value will be stripped of leading and trailing whitespace.
            -   `empty_value` → The value to use to represent “empty”. Defaults to an empty string.

-   `Form Validations`: Django form validation methods are called automatically by the Django framework when the form is submitted. The validation methods are called in the following order:

    -   `is_valid()`: This method is called first to check if the submitted form data is valid. It checks if all required fields are present and if the data is in the correct format.

    -   `clean()`: This method is called next if `is_valid()` returns True. This method is responsible for performing additional validation and cleaning of the submitted data. It can modify the submitted data as needed and return a cleaned version of the data.

    -   `clean_<fieldname>()`: If the `clean()` method has not raised any errors, then the `clean_<fieldname>()` method is called for each field in the form. This method can be used to perform field-specific validation and cleaning.

    -   If any validation errors are encountered during the validation process, the errors are stored in the form's errors dictionary, which can be accessed in the template to display error messages to the user.

-   `ModelForm`: Django `ModelForm` is a useful tool for creating HTML forms based on Django models. The `ModelForm` class provides various clean methods that can be used to validate and clean form data before it is saved to the database. Here are some of the clean methods available in Django ModelForm. By using these clean methods in your Django ModelForm, you can ensure that the data entered into your forms is validated and cleaned before it is saved to the database. This helps to ensure the integrity of your data and prevent errors or inconsistencies.

    -   `clean(self)`: This method is called after all other validation methods have been called. It can be used to validate multiple fields together and to perform custom validation logic that can't be handled by the individual field validation methods. For example, if you need to check if two fields are mutually exclusive, you can do so in the clean() method.

    -   `clean_<fieldname>(self)`: This method is called for each individual field after the field's default validation has been performed. It can be used to perform additional validation on the field or to clean the data in some way. For example, if you need to convert the value of a field to uppercase, you can do so in the `clean_<fieldname>()` method.

    -   `clean_<fieldname>_unique(self)`: This method is called for fields that have the `unique=True` option set. It can be used to check if the value of the field is unique among all other objects in the database. For example, if you have a User model with a unique email field, you can use clean_email_unique() to check if the email address is already in use.

    -   `clean_<fieldname>choices(self)`: This method is called for fields that have `choices` defined. It can be used to validate that the value of the field is one of the allowed choices. For example, if you have a ChoiceField with the choices "Yes" and "No", you can use `clean<fieldname>_choices()` to ensure that the value is one of those two options.

    -   Each form field has a corresponding Widget class, which in turn corresponds to an HTML form widget such as `<input type="text">`. In most cases, the field will have a sensible `default widget`. For example, by default, a CharField will have a TextInput widget, that produces an `<input type="text">` in the HTML. If you needed `<textarea>` instead, you’d specify the appropriate widget when defining your form field,

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

    -   `class PasswordInput`:
        -   input_type: 'password'
        -   template_name: `django/forms/widgets/password.html`
        -   Renders as: <input type="password" ...>
        -   Takes one optional argument:
            -   render_value → Determines whether the widget will have a value filled in when the form is re-displayed after a validation error (default is False).

-   Specifying widgets:

    ```python
    from django import forms

    class Person(forms.Form):
        name = forms.CharField()
        web_url = forms.URLField()
        about = forms.CharField(widget=forms.Textarea)
        email = forms.EmailField(widget=forms.TextInput(attrs={'class': 'form-control mb-3', 'placeholder': 'Email', 'id': 'form-email'}), max_length=254)
    ```

#### FormSet

An inline formset is a mechanism for working with multiple forms on a single page, particularly in the context of related models. It is used when you have a model with a `ForeignKey` or a `OneToOneField`, and you want to manage related model instances within the same form. Inline formsets are often used in scenarios where you have a parent model and one or more child models associated with it.

```python
# models.py
from django.db import models

class ParentModel(models.Model):
    name = models.CharField(max_length=100)

class ChildModel(models.Model):
    parent = models.ForeignKey(ParentModel, on_delete=models.CASCADE)
    child_name = models.CharField(max_length=100)

# forms.py
from django import forms

class ParentForm(forms.ModelForm):
    class Meta:
        model = ParentModel
        fields = ['name']

class ChildForm(forms.ModelForm):
    class Meta:
        model = ChildModel
        fields = ['child_name']

# views.py
from django.shortcuts import render
from django.forms import inlineformset_factory
from .models import ParentModel, ChildModel
from .forms import ParentForm, ChildForm

def my_view(request):
    parent = ParentModel()
    ChildFormSet = inlineformset_factory(ParentModel, ChildModel, form=ChildForm, extra=1)

    if request.method == 'POST':
        parent_form = ParentForm(request.POST, instance=parent)
        formset = ChildFormSet(request.POST, instance=parent)

        if parent_form.is_valid() and formset.is_valid():
            parent = parent_form.save()
            formset.save()

    else:
        parent_form = ParentForm(instance=parent)
        formset = ChildFormSet(instance=parent)

    return render(request, 'my_template.html', {'parent_form': parent_form, 'formset': formset})
```

-   Available form-field attributes in Django Template
    -   `form.cleaned_data`
    -   `form.is_valid()`
    -   `{{ form.as_div }}` --> will render them wrapped in `<div>` tags.
    -   `{{ form.as_table }}` --> will render them as table cells wrapped in `<tr>` tags.
    -   `{{ form.as_p }}` --> will render them wrapped in `<p>` tags.
    -   `{{ form.as_ul }}` --> will render them wrapped in `<li>` tags.
    -   `{{ form.hidden_fields }}`
    -   `{{ form.visible_fields }}`
    -   `{{ form.management_form }}`
    -   `{{ form.non_form_errors }}`
    -   `{{ form.name_of_field }}`
    -   `{{ form.name_of_field.field }}`
        -   The Field instance from the form class that this `BoundField` wraps. You can use it to access Field attributes, e.g. `{{ char_field.field.max_length }}`
    -   `{{ form.name_of_field.value }}`
    -   `{{ form.name_of_field.errors }}`
    -   `{{ form.name_of_field.help_text }}`
    -   `{{ form.name_of_field.html_name }}`
    -   `{{ form.name_of_field.is_hidden }}`
        -   This attribute is True if the form field is a hidden field and False otherwise.
    -   `{{ form.name_of_field.label }}`
        -   The label of the field, e.g. "Email address".
    -   `{{ form.name_of_field.label_tag }}`
    -   `{{ form.name_of_field.lagend_tag }}`
    -   `{{ form.name_of_field.id_for_label }}`
    -   Looping over the form’s fields:
        ```html
        {% for field in form %}
        <div class="fieldWrapper">
            {{ field.errors }} {{ field.label_tag }} {{ field }} {% if
            field.help_text %}
            <p class="help">{{ field.help_text|safe }}</p>
            {% endif %}
        </div>
        {% endfor %}
        ```

#### Forms Classes Hierarchy

-   <b style="color:#C71585">DeclarativeFieldsMetaclass(MediaDefiningClass)</b>:
    -   <b style="color:#9370DB">.\_\_new\_\_(mcs, name, bases, attrs)</b>
-   <b style="color:#C71585">BaseForm</b>:
    -   `default_renderer = None`
    -   `field_order = None`
    -   `prefix = None`
    -   `use_required_attribute = True`
    -   <b style="color:#9370DB">.\_\_init\_\_(self, ...)</b>
    -   <b style="color:#9370DB">.order_fields(self, field_order)</b>
    -   <b style="color:#9370DB">.\_\_str\_\_(self)</b>
    -   <b style="color:#9370DB">.\_\_repr\_\_(self)</b>
    -   <b style="color:#9370DB">.\_\_iter\_\_(self)</b>
    -   <b style="color:#9370DB">.\_\_getitem\_\_(self, name)</b>
    -   <b style="color:#9370DB">.errors(self)</b>
    -   <b style="color:#9370DB">.is_valid(self)</b>
    -   <b style="color:#9370DB">.add_prefix(self, field_name)</b>
    -   <b style="color:#9370DB">.add_initial_prefix(self, field_name)</b>
    -   <b style="color:#9370DB">.\_html_output(self, normal_row, error_row, row_ender, help_text_html, errors_on_separate_row)</b>
    -   <b style="color:#9370DB">.as_table(self)</b>
    -   <b style="color:#9370DB">.as_ul(self)</b>
    -   <b style="color:#9370DB">.as_p(self)</b>
    -   <b style="color:#9370DB">.non_field_errors(self)</b>
    -   <b style="color:#9370DB">.add_error(self, field, error)</b>
    -   <b style="color:#9370DB">.has_error(self, field, code=None)</b>
    -   <b style="color:#9370DB">.full_clean(self)</b>
    -   <b style="color:#9370DB">.\_clean_fields(self)</b>
    -   <b style="color:#9370DB">.\_clean_form(self)</b>
    -   <b style="color:#9370DB">.\_post_clean(self)</b>
    -   <b style="color:#9370DB">.clean(self)</b>
    -   <b style="color:#9370DB">.has_changed(self)</b>
    -   <b style="color:#9370DB">.changed_data(self)</b>
    -   <b style="color:#9370DB">.media(self)</b>
    -   <b style="color:#9370DB">.is_multipart(self)</b>
    -   <b style="color:#9370DB">.hidden_fields(self)</b>
    -   <b style="color:#9370DB">.visible_fields(self)</b>
    -   <b style="color:#9370DB">.get_initial_for_field(self, field, field_name)</b>
-   <b style="color:#C71585">Form(BaseForm, metaclass=DeclarativeFieldsMetaclass)</b>:

-   <b style="color:#C71585">BaseModelForm(BaseForm)</b>:
    -   <b style="color:#9370DB">.\_\_init\_\_(self, ...)</b>
    -   <b style="color:#9370DB">.\_get_validation_exclusions(self)</b>
    -   <b style="color:#9370DB">.clean(self)</b>
    -   <b style="color:#9370DB">.\_update_errors(self, errors)</b>
    -   <b style="color:#9370DB">.\_post_clean(self)</b>
    -   <b style="color:#9370DB">.validate_unique(self)</b>
    -   <b style="color:#9370DB">.\_save_m2m(self)</b>
    -   <b style="color:#9370DB">.save(self, commit=True)</b>
-   <b style="color:#C71585">ModelForm(BaseModelForm, metaclass=ModelFormMetaclass)</b>:

-   <b style="color:#C71585">modelform_factory(model, form=ModelForm, fields=None, exclude=None, formfield_callback=None, widgets=None, localized_fields=None, labels=None, help_texts=None, error_messages=None, field_classes=None)</b>

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Templating</summary>

-   [Templates](https://docs.djangoproject.com/en/4.1/topics/templates/)

#### Django Context Processors:

-   a context processor is a Python function that allows you to add extra data to the context of every template rendered within a Django project. It's a convenient way to make certain data available globally to all templates without explicitly passing it in every view.
-   A context processor is a function that takes a request object as its parameter and returns a dictionary of values that will be added to the context of the template. The context processor function is executed for every request, and its returned values are accessible in templates.
-   `django.contrib.auth.context_processors.auth` is enabled by default & contains the variable `user`.
-   Available Context Variables by Defaults: In Django templates, several context variables are loaded by default. These context variables provide information about the current request, user authentication, and other common web application attributes. Here are the key default context variables:

    -   `request`: This context variable provides access to the current HTTP request object, allowing you to access request information, such as request headers, user agents, and more.

    -   `user`: If a user is authenticated, this context variable provides access to the current user object. It allows you to check the user's authentication status and access user-specific information, such as username and permissions.

    -   `messages`: This context variable is used for displaying user messages and notifications (e.g., success messages, error messages) to the user. It's often used in conjunction with Django's messaging framework.

    -   `csrf_token`: The csrf_token context variable contains a CSRF token, which is used to protect against cross-site request forgery attacks. It's essential for secure form submissions.

    -   `debug`: This variable is set to True if debugging is enabled in the Django settings (DEBUG = True). It can be used to conditionally display debug information or error handling in templates.

    -   `now`: The now variable contains the current date and time based on the server's timezone settings. It's often used to display timestamps in templates.

    -   `perms`: This variable contains information about the permissions granted to the current user. It's useful for checking a user's permissions within templates.

    -   `request.user`: Similar to the user context variable, request.user provides information about the currently authenticated user.

    -   `LANGUAGE_CODE`: The LANGUAGE_CODE variable contains the current language code specified in the user's preferences. It's used for internationalization and localization.

    -   `STATIC_URL`: The STATIC_URL variable contains the URL prefix for static files (e.g., CSS, JavaScript, images). It's used to generate paths to static assets.

    -   `MEDIA_URL`: The MEDIA_URL variable contains the URL prefix for media files uploaded by users. It's used to generate paths to user-uploaded media files.

    -   `SITE_ID`: The SITE_ID variable contains the ID of the current site in a multi-site setup. It's used when working with the Django sites framework.

    -   These default context variables are available in Django templates and provide essential information and functionality for building web applications. You can access and use these variables to display content, handle user authentication, and manage application behavior within your templates.

#### Variables

-   A variable outputs a value from the context, which is a dict-like object mapping keys to values.
-   Variables are surrounded by `{{`` and ``}}`` like this:

    ```html
    <h1>My first name is {{ first_name }}. My last name is {{ last_name }}.</h1>
    ```

#### Tag

-   [Built-in template tags and filters](https://docs.djangoproject.com/en/4.0/ref/templates/builtins/)
-   [Creating Custom Template Tags and Filters](https://www.youtube.com/watch?v=XtbvBlCyfT4)

-   A template tag is a Python function that is executed within a template and allows you to perform more complex operations or logic than what is typically possible with the template language alone. Template tags provide additional functionality and allow you to manipulate data, control the flow of the template, or generate dynamic content.
-   Template tags can accept arguments and perform operations such as querying the database, manipulating strings, iterating over lists, or applying conditional logic. They provide a way to extend the functionality of Django templates and keep the presentation logic separate from the business logic.
-   Template tags are surrounded by `{% %}` tags in Django templates. There are two types of template tags: simple tags and inclusion tags.

    -   `Simple Tags`: Simple tags are used for performing simple operations or transformations on the data.
        They are defined as Python functions that take the context and any number of arguments and return a string that will be inserted into the template.

        -   Example: `{% tag_name argument1 argument2 %}`

    -   `Inclusion Tags`: Inclusion tags are used when you want to include another template and pass it a set of context data. They are defined as Python functions that take the context and any number of arguments and return a rendered template as a string.
        -   Example: `{% include_tag_name argument1 argument2 %}`

-   Built-in Template Tag: Django comes with a set of built-in template tags that cover common use cases, such as looping over lists, conditionally displaying content, formatting dates, and more. Additionally, you can create your own custom template tags to encapsulate reusable functionality specific to your project. Followings are some examples of using a built-in template tags:

    -   `{% block %} and {% endblock %}`:

        ```html
        <!-- Example (base template) -->
        <!DOCTYPE html>
        <html>
            <head>
                <title>{% block title %}Default Title{% endblock %}</title>
            </head>
            <body>
                <div id="content">{% block content %}{% endblock %}</div>
            </body>
        </html>
        ```

        ```html
        <!-- Example (child template) -->
        {% extends 'base.html' %} {% block title %}Page Title{% endblock %} {%
        block content %}
        <p>This is the content of the page.</p>
        {% endblock %}
        ```

    -   `{% include %}`:

        ```html
        {% include 'header.html' %}
        ```

    -   `{% url %}`:

        ```html
        <a href="{% url 'app_name:view_name' arg1=value1 %}">Link Text</a>
        ```

    -   `{% with %}` and `{% endwith %}`:

        ```html
        {% with total_price=quantity * product.price %} Total: ${{ total_price
        }} {% endwith %}
        ```

    -   `{% if %}` and `{% endif %}`:

        ```html
        {% if user.is_authenticated %} Welcome, {{ user.username }}! {% else %}
        Please log in. {% endif %}
        ```

    -   `{% for %}` and `{% endfor %}`:

        ```html
        {% for item in my_list %} {{ item }} {% endfor %}
        ```

    -   `autoescape`: Django auto-escaping is a feature of the Django web framework that helps prevent Cross-Site Scripting (XSS) attacks by automatically escaping potentially dangerous characters in output templates. To prevent XSS attacks, Django automatically escapes output in templates by default. Developers can also use a special syntax in Django templates to disable auto-escaping for a particular block of content if they need to output HTML or other markup.

        ```html
        {% autoescape off %} ... {% endautoescape %}
        ```

    -   ``:

        ```html

        ```

-   Custom Template Tag:

    -   To use a custom template tag, you need to follow these steps:

        -   Create a Python module (e.g., templatetags) inside your app directory.
        -   Define your template tag functions in the module.
        -   Load the template tags in your template using the {% load %} tag.
        -   Use the template tag within your template.

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

<details><summary style="font-size:22px;color:Orange;text-align:left">Object Relational Mapper (ORM)</summary>

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

#### model.Manager.create() and model.Model.save()

-   `model.Manager.create(**kwargs)`:

    -   The `create()` method is a convenient way to create a new instance of a model and save it to the database in a single step. It's available on the model's default manager (usually named objects).
    -   Automatically creates and saves the object in a single call.
    -   Limited flexibility compared to save(). You can't modify the instance after it's created before saving.
    -   Does not allow easy handling of exceptions during creation and saving separately.

    ```python
    # Using create() to create and save a new instance
    new_person = Person.objects.create(first_name='John', last_name='Doe')
    ```

-   `model.Model.save()`:

    -   The `save()` method is used on an instance of a model to save changes to the database. It's available on any instance of a model.
    -   Offers more flexibility as you can modify the instance's attributes before saving.
    -   Allows you to handle exceptions more granularly (e.g., you can catch specific database-related exceptions).

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

### [What is `Q` object in Djanog ORM?](https://docs.djangoproject.com/en/4.2/topics/db/queries/#complex-lookups-with-q-objects)

-   the `Q` object is a powerful tool for building complex database queries using the logical OR and AND operators. It allows you to create more flexible and dynamic queries when filtering database records.

-   The `Q` object is part of Django's `django.db.models` module, and you typically use it in combination with the `filter()` method on a queryset to construct complex conditions for data retrieval. Here's how it works

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
    ```

-   Using `.filter()` and `annotate()` for Custom Joins: If you need to perform a custom join with specific conditions, you can use `.filter()` and `.annotate()` to join tables and create custom queries.

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

<details><summary style="font-size:22px;color:Orange;text-align:left">Views</summary>

#### [Request and response objects](https://docs.djangoproject.com/en/4.1/ref/request-response/#module-django.http):

-   [HttpRequest Object](https://docs.djangoproject.com/en/4.0/ref/request-response/#httprequest-objects)
-   [HttpResponse objects](https://docs.djangoproject.com/en/4.1/ref/request-response/#httpresponse-objects)
-   [JsonResponse objects](https://docs.djangoproject.com/en/4.1/ref/request-response/#jsonresponse-objects)

-   Django uses request and response objects to pass state through the system.
-   When a page is requested, Django creates an `HttpRequest` object that contains metadata about the request. Then Django loads the appropriate view, passing the `HttpRequest` as the first argument to the view function. Each view is responsible for returning an `HttpResponse` object.

-   <b style="color:#EE82EE">HttpRequest</b>: Follwongs are the most usefull attributes of `HttpRequest` object

    -   <b style="color:#EE82EE">HttpRequest</b>**.scheme**:

        -   A string representing the scheme of the request (http or https usually).

    -   <b style="color:#EE82EE">HttpRequest</b>**.body**:

        -   The raw HTTP request body as a bytestring. This is useful for processing data in different ways than conventional HTML forms: binary images, XML payload etc. For processing conventional form data, use HttpRequest.POST.
        -   You can also read from an HttpRequest using a file-like interface with HttpRequest.read() or HttpRequest.readline(). Accessing the body attribute after reading the request with either of these I/O stream methods will produce a RawPostDataException.

    -   <b style="color:#EE82EE">HttpRequest</b>**.path**:

        -   A string representing the full path to the requested page, not including the scheme, domain, or query string.
        -   Example: "/music/bands/the_beatles/"

    -   <b style="color:#EE82EE">HttpRequest</b>**.method**

        -   A string representing the HTTP method used in the request. This is guaranteed to be uppercase.

    -   <b style="color:#EE82EE">HttpRequest</b>**.content_type**

        -   A string representing the MIME type of the request, parsed from the CONTENT_TYPE header.

    -   <b style="color:#EE82EE">HttpRequest</b>**.content_params**

        -   A dictionary of key/value parameters included in the CONTENT_TYPE header.

    -   <b style="color:#EE82EE">HttpRequest</b>**.GET**

        -   A dictionary-like object containing all given HTTP GET parameters. See the QueryDict documentation below.

    -   <b style="color:#EE82EE">HttpRequest</b>**.POST**

        -   A dictionary-like object containing all given HTTP POST parameters, providing that the request contains form data. See the QueryDict documentation below. If you need to access raw or non-form data posted in the request, access this through the HttpRequest.body attribute instead.

        -   It’s possible that a request can come in via POST with an empty POST dictionary – if, say, a form is requested via the POST HTTP method but does not include form data. Therefore, you shouldn’t use if request.POST to check for use of the POST method; instead, use if request.method == "POST" (see HttpRequest.method).

        -   POST does not include file-upload information. See FILES.

    -   <b style="color:#EE82EE">HttpRequest</b>**.FILES**

        -   A dictionary-like object containing all uploaded files. Each key in FILES is the name from the `<input type="file" name="">`. Each value in FILES is an UploadedFile.
        -   FILES will only contain data if the request method was POST and the `<form>` that posted to the request had enctype="multipart/form-data". Otherwise, FILES will be a blank dictionary-like object.

    -   <b style="color:#EE82EE">HttpRequest</b>**.META**

        -   A dictionary containing all available HTTP headers. Available headers depend on the client and server, but here are some examples:

    -   Attributes set by middleware:

        -   <b style="color:#EE82EE">HttpRequest</b>**.session**

            -   From the `SessionMiddleware`: A readable and writable, dictionary-like object that represents the current session.

        -   <b style="color:#EE82EE">HttpRequest</b>**.site**

            -   From the `CurrentSiteMiddleware`: An instance of Site or RequestSite as returned by `get_current_site()` representing the current site.

        -   <b style="color:#EE82EE">HttpRequest</b>**.user**
            -   From the `AuthenticationMiddleware`: An instance of `AUTH_USER_MODEL` representing the currently logged-in user. If the user isn’t currently logged in, user will be set to an instance of `AnonymousUser`.

#### [Class-Based Views (CBVs)](https://docs.djangoproject.com/en/4.1/topics/class-based-views/)

-   [Built-in class-based views API](https://docs.djangoproject.com/en/4.1/ref/class-based-views/)
-   [Class-based generic views - flattened index](https://docs.djangoproject.com/en/4.1/ref/class-based-views/flattened-index/)
-   [Detailed descriptions of Class-Based Views](https://ccbv.co.uk/)

```python
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.contrib.auth.views import LoginView, LogoutView
```

-   Django's Class-Based Views (CBVs) offer a wide range of useful views for handling common web development scenarios. Here are some of the most commonly used CBVs, along with their primary use cases and important parameters:

    -   `DetailView (DetailView)`:

        -   `Primary Use Case`: Display details of a single object.
        -   `Parameters`: model, template_name, context_object_name, slug_field, queryset, pk_url_kwarg.

    -   `ListView (ListView)`:

        -   `Primary Use Case`: Display a list of objects.
        -   `Parameters`: model, template_name, context_object_name, paginate_by, queryset.

    -   `CreateView (CreateView)`:

        -   `Primary Use Case`: Handle form submissions for creating new objects.
        -   `Parameters`: model, template_name, form_class, success_url.

    -   `UpdateView (UpdateView)`:

        -   `Primary Use Case`: Handle form submissions for updating existing objects.
        -   `Parameters`: model, template_name, form_class, success_url, slug_field, queryset, pk_url_kwarg.

    -   `DeleteView (DeleteView)`:

        -   `Primary Use Case`: Handle object deletion and confirmation.
        -   `Parameters`: model, template_name, success_url, slug_field, queryset, pk_url_kwarg.

    -   `TemplateView (TemplateView)`:

        -   `Primary Use Case`: Render static template pages.
        -   `Parameters`: template_name, extra_context.

    -   `RedirectView (RedirectView)`:

        -   `Primary Use Case`: Redirect to a different URL.
        -   `Parameters`: url, permanent, query_string, pattern_name.

    -   `ListView with Pagination (ListView with paginate_by)`:

        -   `Primary Use Case`: Display large lists of objects with pagination.
        -   `Parameters`: paginate_by (number of items per page).

    -   `DetailView with Slug (DetailView with slug_field)`:

        -   `Primary Use Case`: Display details of a single object based on a slug field.
        -   `Parameters`: slug_field, queryset, pk_url_kwarg.

    -   `Custom TemplateView (TemplateView)`:

        -   `Primary Use Case`: Render custom template pages with additional context data.
        -   `Parameters`: template_name, extra_context.

    -   `FormView (FormView)`:

        -   `Primary Use Case`: Handle form submissions with custom logic.
        -   `Parameters`: form_class, template_name, success_url.

    -   `Custom Views`:

        -   `Primary Use Case`: Create custom views by extending View or other CBVs to implement custom behavior tailored to your application's requirements.
        -   `Parameters`: Varies depending on the custom view's purpose.

-   These are some of the most commonly used CBVs in Django, each designed for specific use cases. Parameters can be customized to configure the views according to your project's requirements. Django's CBVs provide a structured and organized way to handle various aspects of web development.

-   CBVs provide several benefits over function-based views:

    -   `Reusability`: CBVs can be subclassed and customized to create new views with similar functionality. This reduces the amount of code duplication and makes it easier to maintain the code.
    -   `Extensibility`: CBVs can be easily extended to add new behavior or modify existing behavior. This allows developers to build complex views with minimal effort.
    -   `Consistency`: CBVs provide a consistent way to define views, making it easier to maintain and refactor code. This consistency also makes it easier for other developers to understand and work with the code.
    -   `Separation of concerns`: CBVs allow developers to separate the logic of handling HTTP requests and rendering responses from the implementation details of the view. This makes it easier to test the code and reduces the risk of errors.

-   CBVs can be used in a variety of contexts, such as rendering HTML templates, handling form submissions, and generating API responses. They can also be combined with mixins to add additional functionality to views, such as authentication, caching, and pagination.

-   Overall, class-based views are a powerful and flexible way to define views in Django, providing a consistent and extensible interface for handling HTTP requests and responses in a variety of contexts.

#### django.views.generic.base

-   <b style="color:#C71585">ContextMixin</b>

    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>

-   <b style="color:#C71585">View</b>

    -   <b style="color:#9370DB">.**init**(self, \*\*kwargs)</b>
    -   `as_view(cls, **initkwargs)`
    -   `view(request, *args, **kwargs)`
    -   <b style="color:#9370DB">.setup(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.dispatch(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.http_method_not_allowed(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.options(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.\_allowed_methods(self)</b>

-   <b style="color:#C71585">TemplateResponseMixin</b>

    -   `template_name = None`
    -   `template_engine = None`
    -   `response_class = TemplateResponse`
    -   `content_type = None`
    -   <b style="color:#9370DB">.render_to_response(self, context, \*\*response_kwargs)</b>
    -   <b style="color:#9370DB">.get_template_names(self)</b>

-   <b style="color:#C71585">TemplateView(TemplateResponseMixin, ContextMixin, View)</b>

    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>

-   <b style="color:#C71585">RedirectView(View)</b>
    -   `permanent = False`
    -   `url = None`
    -   `pattern_name = None`
    -   `query_string = False`
    -   <b style="color:#9370DB">.get_redirect_url(self, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.head(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.post(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.options(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.delete(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.put(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.patch(self, request, \*args, \*\*kwargs)</b>

#### django.views.generic.edit

-   <b style="color:#C71585">FormMixin(ContextMixin)</b>
    -   `initial = {}`
    -   `form_class = None`
    -   `success_url = None`
    -   `prefix = None`
    -   <b style="color:#9370DB">.get_initial(self)</b>
    -   <b style="color:#9370DB">.get_prefix(self)</b>
    -   <b style="color:#9370DB">.get_form_class(self)</b>
    -   <b style="color:#9370DB">.get_form(self, form_class=None)</b>
    -   <b style="color:#9370DB">.get_form_kwargs(self)</b>
    -   <b style="color:#9370DB">.get_success_url(self)</b>
    -   <b style="color:#9370DB">.form_valid(self, form)</b>
    -   <b style="color:#9370DB">.form_invalid(self, form)</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">ModelFormMixin(FormMixin, SingleObjectMixin)</b>
    -   `fields = None`
    -   <b style="color:#9370DB">.get_form_class(self)</b>
    -   <b style="color:#9370DB">.get_form_kwargs(self)</b>
    -   <b style="color:#9370DB">.get_success_url(self)</b>
    -   <b style="color:#9370DB">.form_valid(self, form)</b>
-   <b style="color:#C71585">ProcessFormView(View)</b>
    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.post(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.put(self, \*args, \*\*kwargs)</b>
-   <b style="color:#C71585">BaseFormView(FormMixin, ProcessFormView)</b>
-   <b style="color:#C71585">FormView(TemplateResponseMixin, BaseFormView)</b>
-   <b style="color:#C71585">BaseCreateView(ModelFormMixin, ProcessFormView)</b>
    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.post(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:#C71585">CreateView(SingleObjectTemplateResponseMixin, BaseCreateView)</b>
    -   `template_name_suffix = '_form'`
-   <b style="color:#C71585">BaseUpdateView(ModelFormMixin, ProcessFormView)</b>
    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.post(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:#C71585">UpdateView(SingleObjectTemplateResponseMixin, BaseUpdateView)</b>
    -   `template_name_suffix = '_form'`
-   <b style="color:#C71585">DeletionMixin</b>
    -   `success_url = None`
    -   <b style="color:#9370DB">.delete(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.post(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.get_success_url(self)</b>
-   <b style="color:#C71585">BaseDeleteView(DeletionMixin, BaseDetailView)</b>
-   <b style="color:#C71585">DeleteView(SingleObjectTemplateResponseMixin, BaseDeleteView)</b>
    -   `template_name_suffix = '_confirm_delete'`

#### django.views.generic.list

-   <b style="color:#C71585">MultipleObjectMixin(ContextMixin)</b>
    -   <b style="color:#9370DB">.get_queryset(self)</b>
    -   <b style="color:#9370DB">.get_ordering(self)</b>
    -   <b style="color:#9370DB">.paginate_queryset(self, queryset, page_size)</b>
    -   <b style="color:#9370DB">.get_paginate_by(self, queryset)</b>
    -   <b style="color:#9370DB">.get_paginator(self, queryset, per_page, orphans=0</b>
    -   <b style="color:#9370DB">.get_paginate_orphans(self)</b>
    -   <b style="color:#9370DB">.get_allow_empty(self)</b>
    -   <b style="color:#9370DB">.get_context_object_name(self, object_list)</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*, object_list=None, \*\*kwargs)</b>
-   <b style="color:#C71585">BaseListView(MultipleObjectMixin, View)</b>
    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:#C71585">MultipleObjectTemplateResponseMixin(TemplateResponseMixin)</b>
    -   <b style="color:#9370DB">.get_template_names(self)</b>
-   <b style="color:#C71585">ListView(MultipleObjectTemplateResponseMixin, BaseListView)</b>

#### django.views.generic.detail

-   <b style="color:#C71585">SingleObjectMixin(ContextMixin)</b>
    -   <b style="color:#9370DB">.get_object(self, queryset=None)</b>
    -   <b style="color:#9370DB">.get_queryset(self)</b>
    -   <b style="color:#9370DB">.get_slug_field(self)</b>
    -   <b style="color:#9370DB">.get_context_object_name(self, obj)</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">BaseDetailView(SingleObjectMixin, View)</b>
    -   <b style="color:#9370DB">.get(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:#C71585">SingleObjectTemplateResponseMixin(TemplateResponseMixin)</b>
    -   <b style="color:#9370DB">.get_template_names(self)</b>
-   <b style="color:#C71585">DetailView(SingleObjectTemplateResponseMixin, BaseDetailView)</b>

#### django.contrib.auth.views

-   <b style="color:#C71585">SuccessURLAllowedHostsMixin</b>
    -   <b style="color:#9370DB">.get_success_url_allowed_hosts(self)</b>
-   <b style="color:#C71585">LoginView(SuccessURLAllowedHostsMixin, FormView)</b>
    -   `form_class = AuthenticationForm`
    -   `authentication_form = None`
    -   `redirect_field_name = REDIRECT_FIELD_NAME`
    -   `template_name = 'registration/login.html'`
    -   `redirect_authenticated_user = False`
    -   `extra_context = None`
    -   <b style="color:#9370DB">.dispatch(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.get_success_url(self)</b>
    -   <b style="color:#9370DB">.get_redirect_url(self)</b>
    -   <b style="color:#9370DB">.get_form_class(self)</b>
    -   <b style="color:#9370DB">.get_form_kwargs(self)</b>
    -   <b style="color:#9370DB">.form_valid(self, form)</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">LogoutView(SuccessURLAllowedHostsMixin, TemplateView)</b>
    -   `next_page = None`
    -   `redirect_field_name = REDIRECT_FIELD_NAME`
    -   `template_name = 'registration/logged_out.html'`
    -   `extra_context = None`
    -   <b style="color:#9370DB">.dispatch(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.post(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.get_next_page(self)</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">PasswordContextMixin</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">PasswordResetView(PasswordContextMixin, FormView)</b>
    -   `email_template_name = 'registration/password_reset_email.html'`
    -   `extra_email_context = None`
    -   `form_class = PasswordResetForm`
    -   `from_email = None`
    -   `html_email_template_name = None`
    -   `subject_template_name = 'registration/password_reset_subject.txt'`
    -   `success_url = reverse_lazy('password_reset_done')`
    -   `template_name = 'registration/password_reset_form.html'`
    -   `title = _('Password reset')`
    -   `token_generator = default_token_generator`
    -   <b style="color:#9370DB">.dispatch(self, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.form_valid(self, form)</b>
-   <b style="color:#C71585">PasswordResetDoneView(PasswordContextMixin, TemplateView)</b>
    -   `template_name = 'registration/password_reset_done.html'`
    -   `title = _('Password reset sent')`
-   <b style="color:#C71585">PasswordResetConfirmView(PasswordContextMixin, FormView)</b>
    -   `form_class = SetPasswordForm`
    -   `post_reset_login = False`
    -   `post_reset_login_backend = None`
    -   `reset_url_token = 'set-password'`
    -   `success_url = reverse_lazy('password_reset_complete')`
    -   `template_name = 'registration/password_reset_confirm.html'`
    -   `title = _('Enter new password')`
    -   `token_generator = default_token_generator`
    -   <b style="color:#9370DB">.dispatch(self, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.get_user(self, uidb64)</b>
    -   <b style="color:#9370DB">.get_form_kwargs(self)</b>
    -   <b style="color:#9370DB">.form_valid(self, form)</b>
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">PasswordResetCompleteView(PasswordContextMixin, TemplateView)</b>
    -   `template_name = 'registration/password_reset_complete.html'`
    -   `title = _('Password reset complete')`
    -   <b style="color:#9370DB">.get_context_data(self, \*\*kwargs)</b>
-   <b style="color:#C71585">PasswordChangeView(PasswordContextMixin, FormView)</b>
    -   `form_class = PasswordChangeForm`
    -   `success_url = reverse_lazy('password_change_done')`
    -   `template_name = 'registration/password_change_form.html'`
    -   `title = _('Password change')`
    -   <b style="color:#9370DB">.dispatch(self, \*args, \*\*kwargs)</b>
    -   <b style="color:#9370DB">.get_form_kwargs(self)</b>
    -   <b style="color:#9370DB">.form_valid(self, form)</b>
-   <b style="color:#C71585">PasswordChangeDoneView(PasswordContextMixin, TemplateView)</b>
    -   `template_name = 'registration/password_change_done.html'`
    -   `title = _('Password change successful')`
    -   <b style="color:#9370DB">.dispatch(self, \*args, \*\*kwargs)</b>

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Signals</summary>

##### [Django Signals](https://docs.djangoproject.com/en/4.1/ref/signals/)

-   [Django ORM - Introducing Django Signals and the Observer Pattern](https://www.youtube.com/watch?v=p4vLpz1D4ow&list=PLOLrQ9Pn6cayYycbeBdxHUFrzTqrNE7Pe&index=38)
-   [Django ORM - Receiving Signals](https://www.youtube.com/watch?v=c4NEn7H5czA&list=PLOLrQ9Pn6cayYycbeBdxHUFrzTqrNE7Pe&index=36)
-   [Django ORM - Receiving Signals Specifying a Model](https://www.youtube.com/watch?v=BZ0vJDclU74&list=PLOLrQ9Pn6cayYycbeBdxHUFrzTqrNE7Pe&index=37)
-   []()

Signals are used to enable the "sender" of a signal to notify a group of "receivers" that something has happened. Receivers are functions or methods that are triggered when a signal is sent. Here are some key concepts related to signals in Django:

-   `Signals`: Signals are objects representing specific actions or events that occur within a Django application. Django provides built-in signals, such as pre_save, post_save, pre_delete, post_delete, etc., which are triggered at different points during the lifecycle of a model.
-   `Senders`: A sender is the entity that sends a signal. In Django, senders are typically Django model classes, but they can be any Python object.
-   `Receivers`: A receiver is a function or method that gets executed in response to a signal being sent. Receivers define the actions to be performed when a specific signal is received. Receivers are registered to signals and can be located anywhere in the codebase.
-   `Signal Handlers`: Signal handlers are the functions or methods that implement the logic to be executed when a signal is received. They perform the desired actions based on the received signal.
-   `Signal Registration`: Signal receivers need to be registered with the appropriate signal to establish the connection between the sender and the receiver. This registration usually occurs in the `ready()` method of the application's configuration module or in a separate signals.py module.

Signals in Django provide a way to implement decoupled and reusable functionality. They allow different parts of an application to communicate with each other without tight coupling, enabling modularity and extensibility. Signals are commonly used for tasks like updating related models, sending notifications, triggering background tasks, and more.

To use signals in your Django project, you'll need to import the necessary signals, write signal handlers, and register the handlers with the corresponding signals. Django's documentation provides detailed information on how to work with signals and examples of their usage.

Django signals are a mechanism for allowing decoupled applications to get notified when certain actions occur elsewhere in the application. Here are key points about Django signals:

-   `Decoupled Communication`:

    -   Signals enable a decoupled communication mechanism between different parts of a Django application.
    -   One part of the application can send a signal, and another part can listen for that signal without directly importing or depending on each other.

-   `Publisher-Subscriber Pattern`:

    -   Django signals follow the publisher-subscriber pattern.
    -   The part of the code that sends (publishes) a signal is known as the sender, and the part that listens (subscribes) to the signal is known as the receiver.

-   `Signal Sending`:

    -   Sending a signal involves using the django.dispatch.Signal class to create a signal instance.

    -   The send method of the signal instance is then called to dispatch the signal along with any necessary data.

        ```python
        from django.dispatch import Signal

        my_signal = Signal()

        # Sending the signal with some data
        my_signal.send(sender=my_model_instance, data='some_data')
        ```

-   `Signal Receiving`:

    -   Receiving a signal involves defining a receiver function or method and connecting it to the signal.

    -   The @receiver decorator is commonly used to connect a function or method to a signal.

        ```python
        from django.dispatch import receiver

        @receiver(my_signal)
        def my_signal_handler(sender, **kwargs):
            # Handle the signal
            data = kwargs.get('data')
        ```

-   `Built-in Signals`:

    -   Django provides some built-in signals for common events, such as post_save and post_delete for model instance changes.
    -   Developers can use these signals to perform additional actions after certain database operations.

-   `Custom Signals`:

    -   Developers can create custom signals for application-specific events.
    -   Custom signals are often defined in a signals module within an app.

-   `Decoupling Applications`:

    -   Signals are particularly useful for decoupling applications within a Django project.
    -   For example, a blog application might send a signal when a new comment is posted, and a notification application could listen for that signal to send email notifications.

-   `Ordering Receivers`:

    -   The order in which receivers are connected to a signal can be controlled to determine the execution order.

    -   The dispatch_uid parameter or the @receiver decorator's order attribute is used for this purpose.

        ```python
        @receiver(my_signal, dispatch_uid='my_unique_identifier')
        def first_handler(sender, **kwargs):
            # Handle the signal

        @receiver(my_signal, dispatch_uid='my_unique_identifier', order=1)
        def second_handler(sender, **kwargs):
            # Handle the signal after the first handler
        ```

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Authentication, Authorizations and Admin Panel</summary>

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

<details><summary style="font-size:18px;color:magenta;text-align:left">Authentication and Authorizations</summary>

-   [Using the Django authentication system](https://docs.djangoproject.com/en/4.1/topics/auth/default/)

Django, a high-level web framework written in Python, provides a robust authentication and authorization system. These two components are essential for securing web applications by verifying the identity of users and determining their access rights. Let's delve into the details of the authentication and authorization system in Django:

**Authentication in Django**:

Authentication in Django revolves around the concept of users and their identity verification.

-   `User Model`:

    -   Django provides a built-in User model that represents users in the authentication system.
    -   This model includes fields like username, password, email, etc.
    -   You can extend the User model or use a custom user model to add additional fields.

-   `Authentication Backends`:

    -   Django supports pluggable authentication backends that allow you to customize the authentication process.
    -   Common authentication backends include ModelBackend (default), which uses the database-backed user model, and LDAPBackend, which integrates with LDAP directories.

-   `User Authentication`:

    -   Django provides authentication views and forms for login and logout.
    -   The `django.contrib.auth` module includes functions like `authenticate`, `login`, and `logout` for programmatic authentication.

-   `Middleware`:

    -   The AuthenticationMiddleware is included by default in Django settings.
    -   It associates users with requests using session-based authentication.

-   `Authentication Decorators`:

    -   Decorators like @login_required can be used to restrict access to certain views only to authenticated users.

    ```python
    from django.contrib.auth.decorators import login_required

    @login_required
    def my_protected_view(request): # View code for authenticated users only
    ...
    ```

**Authorization in Django**:

Authorization in Django involves determining what actions a user is allowed to perform within the application.

-   `Permission System`:

    -   Django provides a permission system where permissions are associated with models and views.
    -   Permissions include actions like view, add, change, and delete.
    -   Users can be assigned specific permissions directly or through group memberships.

-   `User Groups`:

    -   Users can be organized into groups, and permissions can be assigned to groups.
    -   This simplifies the process of managing permissions for multiple users.

-   `@permission_required Decorator`:

    -   Django offers the `@permission_required` decorator to restrict access to views based on specific permissions.

        ```python
        from django.contrib.auth.decorators import permission_required

        @permission_required('myapp.can_publish')
        def my_publishing_view(request): # View code for users with 'myapp.can_publish' permission
        ...
        ```

-   `Object-level Permissions`:

    -   Django supports object-level permissions to control access to individual instances of a model.
    -   This is achieved using the `django.contrib.auth.mixins.PermissionRequiredMixin` or by checking permissions manually in views.

-   `Authorization Middleware`:

    -   Django uses the `django.contrib.auth.middleware.AuthorizationMiddleware` to add user and `user_permissions` attributes to the request.

**Integration with Django Models**:

Django's authentication and authorization system integrates with models through the User model and permissions associated with models.

-   `User Model Integration`:

    -   The User model is often linked to other models using relationships (e.g., ForeignKey or OneToOneField).

-   `Permissions in Models`:

    -   Models can define custom permissions using the class Meta option permissions.
    -   This allows for fine-grained control over who can perform specific actions on instances of a model.

    ```python
    class MyModel(models.Model):
    name = models.CharField(max_length=100)

        class Meta:
            permissions = [
                ("can_change_name", "Can change the name of the model"),
            ]
    ```

In summary, Django's authentication and authorization system is a comprehensive framework that provides tools for verifying user identity, restricting access to views based on permissions, and managing user permissions at both the model and object levels. It plays a crucial role in securing Django web applications.

</details>

---

<details><summary style="font-size:18px;color:magenta;text-align:left">Session-based vs Token-based Authentication</summary>

-   ![Django Session Archictures](/assets/django/django-session-steps.png)

Django supports both session-based authentication and token-based authentication, and each approach has its own characteristics and use cases. Let's explore each authentication method in detail:

#### Session-Based Authentication

1. **Overview**:

    - `Description`: Session-based authentication relies on server-side sessions to manage user authentication. When a user logs in, a session is created on the server, and a session ID is stored in a cookie on the client side. Subsequent requests include this session ID, allowing the server to identify the user.
    - `Implementation`: Django provides built-in support for session-based authentication through the use of middleware and the `django.contrib.auth` module.

2. **Usecases**:

    - `Traditional Web Applications`:

        - `Description`: Session-based authentication is well-suited for traditional web applications where the server maintains session state for each user.
        - `How It Works`: When a user logs in, the server creates a session and stores user-related information on the server. A session identifier (usually stored in a cookie) is sent to the client, and subsequent requests include this identifier for authentication.
        - `Pros`:
            - `Simplicity`: Django's built-in authentication system supports session-based authentication out of the box, making it easy to implement.
            - `Server-Side State`: The server can store and manage user-specific data on the server side.

    - `Web Applications with Server-Side Rendering (SSR)`:

        - `Description`: Applications using server-side rendering, where the server generates HTML content for each request, can benefit from session-based authentication.
        - `How It Works`: The server can include user-specific data in the HTML response, making it available on the client side.

    - `Confidential Information`:

        - `Description`: For applications dealing with highly sensitive information, session-based authentication provides an additional layer of security.
        - `How It Works`: Sessions can be configured with additional security measures, such as short expiration times, to minimize the risk of unauthorized access.

3. **Key Components**:

    - `Middleware`: The `django.contrib.sessions.middleware.SessionMiddleware` is responsible for handling sessions. Make sure it's included in the MIDDLEWARE setting.

    - `Authentication Views`: Django provides built-in views for authentication, including login and logout views. These can be used or customized as needed.

    - `User Model`: Django's User model (in `django.contrib.auth.models`) represents the user, including fields for username, password, email, etc.

4. **Workflow**:

    - User logs in using credentials.
    - Server validates credentials and creates a session for the user.
    - Session ID is stored in a cookie on the client side.
    - Subsequent requests include the session ID for server-side identification.
    - Sessions can have expiration times, and users may need to re-authenticate after a certain period of inactivity.

    -   4. Code Example:

    ```python
    # Login view
    from django.contrib.auth import authenticate, login
    from django.shortcuts import render, redirect

    def login_view(request):
        if request.method == 'POST':
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('home')
            else:
                return render(request, 'login.html', {'error': 'Invalid credentials'})
        else:
            return render(request, 'login.html')

    # Logout view
    from django.contrib.auth import logout

    def logout_view(request):
        logout(request)
        return redirect('home')
    ```

#### Token-Based Authentication

1. **Overview**:

    - `Description`: Token-based authentication involves the use of tokens (usually JSON Web Tokens or JWTs) to authenticate users. Instead of storing session information on the server, the server sends a token to the client upon successful authentication. The client includes this token in the headers of subsequent requests for authentication.
    - `Implementation`: While Django itself does not provide built-in support for JWTs, third-party packages like `djangorestframework-simplejwt` can be used to implement token-based authentication in Django.

2. **Usecases**:

    - `Single-Page Applications (SPAs) and APIs`:

        - `Description`: Token-based authentication is commonly used in Single-Page Applications (SPAs) and APIs where the server is stateless, and each request should include authentication information.
        - `How It Works`: Upon successful login, the server issues a token (usually a JSON Web Token or JWT) to the client. Subsequent requests include this token in the authorization header.
        - `Pros`:
            - `Stateless`: The server does not need to store session state, making it easier to scale horizontally.
            - `Decoupled Architecture`: Allows for a decoupled architecture where the server and client can be developed independently.

    - `Mobile Applications`:

        - `Description`: Mobile applications, where the client may not be trusted to store session cookies securely, often use token-based authentication.
        - `How It Works`: The token is stored securely on the mobile device and sent with each request to authenticate the user.

    - `Microservices Architecture`:

        - `Description`: In a microservices architecture, where services may be distributed and stateless, token-based authentication simplifies the authentication process.
        - `How It Works`: Each microservice can independently validate and authorize requests based on the token.

    - `Cross-Domain Authentication`:

        - `Description`: Token-based authentication is suitable for scenarios where the client and server may reside on different domains.
        - `How It Works`: CORS (Cross-Origin Resource Sharing) headers can be configured to allow requests with the authentication token to be made from different origins.

3. **Key Components**:

    - `Token Generation`: When a user logs in, a token is generated on the server and sent to the client.

    - `Token Validation`: For each subsequent request, the server validates the token in the request header.

    - `Expiration`: Tokens can have expiration times, and users may need to refresh their tokens to maintain an active session.

4. **Workflow**:

    - User logs in, and a token is generated.
    - Token is sent to the client.
    - Subsequent requests include the token in the request header.
    - The server validates the token for authentication.

    -   4. Code Example:

    - Install the djangorestframework-simplejwt package:

        - `$ pip install djangorestframework-simplejwt`

    - `Configure settings`:

        ```python
        # settings.py
        REST_FRAMEWORK = {
            'DEFAULT_AUTHENTICATION_CLASSES': [
                'rest_framework_simplejwt.authentication.JWTAuthentication',
            ],
        }
        ```

    - `Usage in views`:

        ```python
        # views.py
        from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

        # Obtain token
        class MyTokenObtainPairView(TokenObtainPairView):
            serializer_class = MyTokenObtainPairSerializer

        # Refresh token
        class MyTokenRefreshView(TokenRefreshView):
            serializer_class = MyTokenRefreshSerializer
        ```

-   **DRF Token vs JSON Web Token (JWT) Authentication**

    Both Token Authentication (using rest_framework.authtoken) and JSON Web Token (JWT) Authentication (using djangorestframework-simplejwt) are popular methods for securing APIs in Django Rest Framework (DRF). Each method has its own characteristics, and the choice between them depends on factors such as ease of use, flexibility, and specific project requirements.

    -   ##### DRF Token Authentication (`rest_framework.authtoken`):

        -   Uses a simple token system where a unique token is generated for each user.
        -   Tokens are stored in a database table associated with the user.
        -   Tokens are created and managed by the Django authentication framework.
        -   Tokens are stored in the database, and each user has a corresponding token.
        -   Tokens are random strings, providing a level of security.
        -   Tokens can be manually invalidated by removing them from the database.

    -   ##### JSON Web Token (JWT) Authentication (`djangorestframework-simplejwt`):
        -   Uses JSON Web Tokens, which are self-contained and can include user information and expiration.
        -   Tokens are not stored on the server; the server validates and decodes the token on each request.
        -   Tokens are created based on user credentials during authentication and can include claims (e.g., user ID, expiration).
        -   Tokens are signed using a secret key or a public/private key pair.
        -   Provides stateless authentication, as tokens contain all necessary information.
        -   Token expiration adds an additional layer of security.

#### Comparison

-   `Stateless vs Stateful`:
    -   Session-based authentication is stateful as it relies on the server storing user-related information.
    -   Token-based authentication is stateless, making it suitable for distributed and scalable architectures.
-   `Security`: Both mechanisms can be secure when implemented correctly. Session-based authentication may provide additional security features such as session timeout and CSRF protection.
-   `Complexity`: Token-based authentication is often considered more complex to implement, but it provides greater flexibility and decoupling.

Both session-based and token-based authentication have their pros and cons. Session-based authentication is simpler to implement in Django, especially for web applications, while token-based authentication is often used in API-driven applications and provides more flexibility for decoupled systems. The choice between them depends on the specific requirements and architecture of the project.

</details>

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Middleware</summary>

-   [Middleware](https://docs.djangoproject.com/en/4.2/topics/http/middleware/)

### What is middleware:

-   Middleware is a framework of hooks into Django’s request/response processing. It’s a light, low-level “plugin” system for globally altering Django’s input or output.
-   Each middleware component is responsible for doing some specific function. For example, Django includes a middleware component, AuthenticationMiddleware, that associates users with requests using sessions.

-   There's middleware that isn't applied by default which we could activate obviously.
-   Security middleware is there by default.
-   the locale middleware is very interesting enables language selection based on data from the request that isn't activated by default and the gzip middleware also so this is a middleware which can compress content for browsers that understand gzip compression and that can help speed up the delivery of data

#### Writing your own middleware

-   A middleware factory is a callable that takes a `get_response` callable and returns a middleware. A middleware is a callable that takes a request and returns a response, just like a view.

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

#### Session Management:

-   In Django, session management refers to the handling and storage of user-specific data across multiple requests. Sessions are used to persist user data between different interactions with a web application. Django provides a convenient session framework that allows developers to store and retrieve data on a per-site-visitor basis. Here are the key components and concepts related to session management in Django:

-   Django uses middleware to enable session management. The `django.contrib.sessions.middleware.SessionMiddleware` middleware is responsible for managing sessions. It must be included in the MIDDLEWARE setting.

    Example MIDDLEWARE setting in settings.py:

    ```python
    MIDDLEWARE = [
    # ...
    'django.contrib.sessions.middleware.SessionMiddleware',
    # ...
    ]
    ```

-   **Session Engine**:

    -   Django supports multiple session engines, which are responsible for storing and retrieving session data. The default session engine is the database-backed engine (django.contrib.sessions.backends.db), but other options include caching engines, file-based sessions, and more.

    Example SESSION_ENGINE setting in settings.py:

    ```python
    SESSION_ENGINE = 'django.contrib.sessions.backends.db'
    ```

-   **Session Configuration**:

    -   Configuration options for sessions can be customized in the settings.py file. This includes settings such as SESSION_COOKIE_NAME, SESSION_COOKIE_AGE, SESSION_SAVE_EVERY_REQUEST, and others.

    Example session settings:

    ```python
    SESSION_COOKIE_NAME = 'my_session_cookie'
    SESSION_COOKIE_AGE = 1209600 # Two weeks in seconds
    ```

-   **Using Sessions in Views**:

    -   In Django views, you can interact with session data through the request.session object. This object is a dictionary-like interface that allows you to store and retrieve data.

    Example usage in a view:

    ```python
    def my_view(request): # Storing data in the session
    request.session['user_id'] = 123

        # Retrieving data from the session
        user_id = request.session.get('user_id')

        # Deleting a session key
        del request.session['user_id']
    ```

-   **Session Expiry and Cleanup**:

    -   Session data can have an expiration time, which is controlled by the SESSION_COOKIE_AGE setting. Django automatically deletes expired sessions during its cleanup process.

-   **Security Concerns**:

    -   Session data is typically stored as a cookie on the user's browser. It's important to use secure and tamper-proof session cookies to prevent security vulnerabilities. Django provides settings like SESSION_COOKIE_SECURE and SESSION_COOKIE_HTTPONLY for this purpose.

    Example security-related session settings:

    ```python
    SESSION_COOKIE_SECURE = True
    SESSION_COOKIE_HTTPONLY = True
    ```

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Django Security Features</summary>

##### CSRF (Cross Site Request Forgery)

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

---

##### CORS (Cross Origin Resource Sharing): [Django CORS Guide](https://www.stackhawk.com/blog/django-cors-guide/)

Cross-Origin Resource Sharing (CORS) is a security feature implemented by web browsers to control which web applications are allowed to make requests to a web server from a different origin (domain). This security measure is in place to prevent unauthorized cross-origin requests, which could potentially lead to security vulnerabilities.

In the context of Django and web development, CORS comes into play when you have a frontend application (e.g., written in JavaScript and running in a browser) that needs to make requests to a Django backend server located on a different domain.

Here's a breakdown of how CORS is implemented in Django:

-   `Django Middleware`: In Django, CORS handling is typically done using middleware. Middleware in Django allows you to process requests globally before they reach the view and responses before they are sent to the client.

-   `Django CORS Headers`: One popular Django package for handling CORS is `django-cors-headers`. You can install it using:

    -   `$  pip install django-cors-headers`
    -   After installation, you need to add it to your INSTALLED_APPS and MIDDLEWARE in your Django settings:

        ```python
        # settings.py

        INSTALLED_APPS = [
            # ...
            'corsheaders',
            # ...
        ]

        MIDDLEWARE = [
            # ...
            'corsheaders.middleware.CorsMiddleware',
            # ...
        ]
        ```

-   `Configuration`: With django-cors-headers installed and configured, you can control CORS behavior in your Django project's settings. For example, you might allow all origins (not recommended for production) or specify specific origins that are allowed to access your API:

    ```python
    # settings.py

    CORS_ALLOWED_ORIGINS = [
        "http://localhost:3000",  # Example: Allow requests from a specific frontend
        "https://yourfrontenddomain.com",

    ]
    # Other CORS settings...
    ```

    -   Additionally, you can configure other CORS-related settings, such as allowing or disallowing credentials (e.g., cookies) in cross-origin requests, exposing certain headers, and more.

-   `Handling Preflight Requests`:

    -   Cross-origin requests that are not simple requests trigger a preflight request. The preflight request is an HTTP OPTIONS request that checks what HTTP methods and headers are allowed by the server.

    -   django-cors-headers takes care of handling preflight requests by default.

With CORS properly configured in your Django project, your backend will include the necessary headers in its responses to allow or deny cross-origin requests from different domains, based on the rules you've set.

It's important to configure CORS thoughtfully to strike a balance between security and the functional requirements of your web application. Always consider the security implications, especially if you are allowing cross-origin requests from multiple domains.

##### Cross-Site Scripting (XSS)

Cross-Site Scripting (XSS) is a common web application security vulnerability that occurs when an attacker injects malicious scripts (typically JavaScript) into web pages that are then viewed by other users. These scripts execute in the context of the user's browser, potentially leading to unauthorized access, data theft, session hijacking, or other security breaches.

In the context of the Django framework, XSS vulnerabilities can occur if web developers do not properly handle and sanitize user-generated content or input. Django provides several built-in features and best practices to mitigate the risk of XSS:

-   `Django Templates and Autoescaping`: Django templates use an autoescape feature by default. This means that by wrapping any data within template tags, such as {{ variable }}, Django will automatically escape the content to ensure it's safe to render in the HTML. For example, if a user-provided input is displayed using {{ user_input }}, any HTML or JavaScript in the input will be escaped, rendering it harmless.

-   `Safe Unescaping`: Sometimes, you may need to include HTML or JavaScript in your templates. In such cases, you can use the |safe filter to explicitly mark content as safe. However, use this with caution, as it can introduce vulnerabilities if not handled correctly.

-   `Middleware and Content Security Policies (CSP)`: Django allows you to add middleware to set Content Security Policies (CSP) in your application. CSP headers can restrict the sources from which content can be loaded, mitigating the risk of loading malicious scripts.

-   `Input Validation and Sanitization`: Always validate and sanitize any user input on the server side. Django provides form handling mechanisms that help you define what is valid input.

-   `Cross-Site Request Forgery (CSRF) Protection`: Protect your application against CSRF attacks using Django's built-in CSRF protection. This ensures that any actions requiring state-changing requests are performed by the user intentionally.

-   `Avoiding Inline JavaScript`: Whenever possible, avoid using inline JavaScript within HTML elements. Use event handlers and external JavaScript files.

Here's an example of a simple Django template that demonstrates how autoescaping works:

```html
<!DOCTYPE html>
<html>
    <head>
        <title>XSS Example</title>
    </head>
    <body>
        <h1>{{ user_input }}</h1>
    </body>
</html>
```

In this example, if the user_input variable contains malicious JavaScript, it will be automatically escaped and displayed as plain text, making it safe.

By following best practices, using Django's built-in security features, and being cautious about user-generated content, you can significantly reduce the risk of XSS vulnerabilities in your Django applications. Security should always be a top priority when developing web applications to protect both your application and your users.

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Message Framework</summary>

In the context of the Django framework, the term "message" typically refers to the messages framework, which is a part of Django's contrib packages. The messages framework allows you to store simple messages in one request and retrieve them for display in a subsequent request. This is particularly useful for displaying notifications or feedback to users after they perform certain actions on a website.

Here are the key components and concepts related to the Django messages framework:

-   `Usage Scenario`: The messages framework is commonly used to display feedback messages to users after they submit forms, perform actions, or encounter errors on a website.

-   `Storage Backend`: Django provides a storage backend to store messages across requests. By default, it uses the session as the storage backend, but you can customize it to use other backends.

-   `Message Levels`: Messages are classified into different levels based on their importance or nature. The available message levels in Django are:
    -   `DEBUG`
    -   `INFO`
    -   `SUCCESS`
    -   `WARNING`
    -   `ERROR`
-   `Storage in Session`: Messages are stored in the session during one request and retrieved in the subsequent request. This allows you to display messages to users after a form submission or any other action.

-   `Setting a Message`: To set a message, you use the messages module in Django. For example:

    ```python
    from django.contrib import messages

    messages.success(request, 'Your profile was successfully updated.')
    ```

    -   `Displaying Messages in Templates`: In a template, you can use the {% messages %} template tag to iterate over and display messages. For example:

    ```html
    {% messages %}
    ```

-   `Clearing Messages`: Messages can be automatically cleared from the storage after being displayed. This prevents messages from persisting across multiple requests. The default behavior is to clear messages after rendering them in the template. Here's a basic example of how messages are used in a Django view:

    ```python
    from django.contrib import messages
    from django.shortcuts import render, redirect

    def my_view(request):
        # Some logic...

        # Add a success message
        messages.success(request, 'Your message here.')

        # Redirect to another page
        return redirect('some_other_view')
    ```

    -   And in the corresponding template:

    ```html
    {% messages %}
    ```

This template tag will render the messages stored in the session for display. The specific CSS classes applied to each message will depend on its level (success, warning, error, etc.).

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Django Managements</summary>

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">MISC</summary>

##### Configure logging for Django app

-   [Logging](https://docs.djangoproject.com/en/4.2/topics/logging/)

##### django-admin and manage.py

-   [Doc: django-admin and manage.py](https://docs.djangoproject.com/en/4.1/ref/django-admin/#django-admin-and-manage-py)

##### [Validators](https://docs.djangoproject.com/en/4.1/ref/validators/)

### ChatGPT

-   demo audit trails that log and monitor user activities with Django project

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Raised Questions</summary>

-   What is reverse url?

In Django, the reverse function is used to dynamically build a URL for a given view or URL pattern. It is particularly useful when you want to generate a URL in your Python code rather than hardcoding it. The reverse function takes a view name or a URL pattern name as an argument and returns the corresponding URL.

You can also reverse URLs with parameters. If your URL pattern has parameters, you can pass them as arguments to the reverse function.

-   What is a proxy model?

In Django, a proxy model is a way to create a new model that extends the functionality of an existing model without creating a new database table. It allows you to reuse the fields and methods of an existing model while providing a different Python class for the model. Proxy models are a form of model inheritance that doesn't create a new table in the database but rather relies on the same table as the original model. Key characteristics of proxy models:

-   **Inherits from an Existing Model**: A proxy model is defined by creating a new model class that inherits from an existing model. The proxy model extends or overrides the behavior of the original model.

-   **Same Database Table**: Both the original model and the proxy model share the same database table. This means that any changes made to instances of the proxy model are reflected in the instances of the original model and vice versa.

-   **Same Fields and Methods**: The proxy model inherits all the fields and methods from the original model. You can add new fields or override methods in the proxy model to extend or modify the behavior.

-   **Meta Options**: Proxy models use the Meta class to provide additional options. For example, you can set the proxy attribute to True in the Meta class to indicate that it is a proxy model.

-   **Example of a proxy model**:

    ```python
        from django.db import models

    class BaseModel(models.Model):
        name = models.CharField(max_length=50)

        class Meta:
            abstract = True

    class ProxyModel(BaseModel):
        class Meta:
            proxy = True

        def custom_method(self):
            return f"Custom method for {self.name}"
    ```

    -   In this example, ProxyModel is a proxy model that inherits from BaseModel. Both models share the same database table, and you can use the custom_method in instances of ProxyModel.

Proxy models are useful when you want to reuse an existing model's fields and methods but need a different representation in the Django admin, add custom methods, or use a different manager.

</details>

---

<details><summary style="font-size:22px;color:Orange;text-align:left">Importing Important Objects</summary>

```python
========================================================================================
from django.db import models

from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager, Group, Permission, PermissionsMixin
from django.contrib.auth.models import
from django.contrib.auth import login, logout, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, PasswordResetForm, SetPasswordForm
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.tokens import PasswordResetTokenGenerator

from django.contrib import admin, messages
from django.contrib.admin import ModelAdmin
from django.contrib.sites.shortcuts import get_current_site

from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.views.decorators.csrf import csrf_exempt

from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static

from django.http import HttpResponse, JsonResponse
from django.utils import reverse, timezone
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.shortcuts import render, redirect, get_object_or_404

from django.template.loader import render_to_string
from decimal import Decimal
from six import text_type
from django.forms.models import model_to_dict
# =============================================================================

from django.core.mail import send_mail
send_mail('Subject here','Here is the message.','from@example.com',['to@example.com'],fail_silently=False,)
```

</details>
