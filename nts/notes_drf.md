##### Imports

```python
from rest_framework import generics, views, mixins, authentication, permissions, serializers, viewsets
from rest_framework.generics import GenericAPIView, ListAPIView, CreateAPIView, RetrieveAPIView, UpdateAPIView, DestroyAPIView
from rest_framework.mixins import ListModelMixin,RetrieveModelMixin,
from rest_framework.viewsets import GenericViewSet, ModelViewSet
from rest_framework.routers import DefaultRouter

from rest_framework.serializers import HyperlinkedIdentityField, SerializerMethodField
from rest_framework.validators import UniqueValidator

from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework.renderers import JSONRenderer
from rest_framework.decorators import api_view
from rest_framework.parsers import JSONParser

from rest_framework.authentication import TokenAuthentication as BaseTokenAuth
from rest_framework.authtoken.models import Token
```

<details open><summary style="font-size:22px;color:Orange;text-align:left">DRF</summary>

In Django, a ViewSet is a high-level abstraction that provides an interface for interacting with database models or other data sources. ViewSets are a part of Django REST framework (DRF), an extension to Django for building Web APIs. A ViewSet handles how data is retrieved, created, updated, and deleted. It is designed to work seamlessly with the Django ORM and provides a powerful, customizable, and consistent way to define API endpoints.

ViewSet classes are almost the same thing as View classes, except that they provide operations such as retrieve, or update, and not method handlers such as get or put.

A ViewSet class is only bound to a set of method handlers at the last moment, when it is instantiated into a set of views, typically by using a Router class which handles the complexities of defining the URL conf for you.

Here are the main components and concepts associated with ViewSets in Django REST framework:

-   **ViewSet Class**

    -   A ViewSet is a class that defines the behavior of an API endpoint. It combines the logic for handling different HTTP methods (GET, POST, PUT, DELETE, etc.) into a single class.
    -   DRF provides various types of ViewSets, including ModelViewSet (for working with database models), ReadOnlyModelViewSet (for read-only operations), and more.

-   **CRUD Operations**

    -   ViewSets typically handle CRUD (Create, Read, Update, Delete) operations on a particular resource (e.g., a database model).
    -   The methods list, create, retrieve, update, and destroy correspond to the HTTP methods GET, POST, GET (single object), PUT, and DELETE, respectively.

-   **Serializer**

    -   A ViewSet uses a serializer to convert complex data types (such as database models) into Python data types that can be easily rendered into JSON and vice versa.
    -   Serializers define the format of the data that will be sent and received by the API.

-   **Queryset**

    -   The queryset attribute of a ViewSet defines the set of objects that the ViewSet will operate on. It is often used to filter and retrieve data from a database.

-   **Routing**

    -   ViewSets are typically used in conjunction with a router to automatically generate URL patterns for the API. DRF provides a DefaultRouter that can be used for this purpose.
    -   The router automatically generates URL patterns for the standard CRUD operations of a ViewSet.

-   **Example - ModelViewSet**

    ```python
    from rest_framework import viewsets
    from .models import MyModel
    from .serializers import MyModelSerializer

    class MyModelViewSet(viewsets.ModelViewSet):
        queryset = MyModel.objects.all()
        serializer_class = MyModelSerializer
    ```

    -   In this example, MyModelViewSet is a ModelViewSet that handles CRUD operations for the MyModel database model. It specifies the queryset and serializer class to use.

-   **URL Patterns**

    -   Once a ViewSet is defined, it needs to be registered with a router to generate URL patterns for the API. The URL patterns are then included in the project's main urls.py file.

    ```python
    from rest_framework import routers
    from .views import MyModelViewSet

    router = routers.DefaultRouter()
    router.register(r'mymodel', MyModelViewSet, basename='mymodel')
    urlpatterns = router.urls
    ```

    -   In this example, the router generates URL patterns for the MyModelViewSet under the path 'mymodel/'.

ViewSets provide a clean and organized way to define API endpoints and handle CRUD operations. They promote code reuse and consistency in API design. When combined with serializers, routers, and Django's ORM, ViewSets form a powerful framework for building RESTful APIs in Django.

##### Permission

</details>

---

<details open><summary style="font-size:22px;color:Orange;text-align:left">rest_framework.generics</summary>

#### Inheritence Hierarchy

-   <b style="color:red">APIView(django.views.generic.View)</b>

    -   `.renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES`
    -   `.parser_classes = api_settings.DEFAULT_PARSER_CLASSES`
    -   `.authentication_classes = api_settings.DEFAULT_AUTHENTICATION_CLASSES`
    -   `.throttle_classes = api_settings.DEFAULT_THROTTLE_CLASSES`
    -   `.permission_classes = api_settings.DEFAULT_PERMISSION_CLASSES`
    -   `.content_negotiation_class = api_settings.DEFAULT_CONTENT_NEGOTIATION_CLASS`
    -   `.metadata_class = api_settings.DEFAULT_METADATA_CLASS`
    -   `.versioning_class = api_settings.DEFAULT_VERSIONING_CLASS`
    -   `.settings = api_settings`
    -   `.schema = DefaultSchema()`

    -   <b style="color:rgb(54, 128, 233)">.as_view(cls, \*\*initkwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.force_evaluation()</b>
    -   <b style="color:rgb(54, 128, 233)">.allowed_methods(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.default_response_headers(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.http_method_not_allowed(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.permission_denied(self, request, message=None, code=None)</b>
    -   <b style="color:rgb(54, 128, 233)">.throttled(self, request, wait)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_authenticate_header(self, request)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_parser_context(self, http_request)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_renderer_context(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_exception_handler_context(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_view_name(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_view_description(self, html=False)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_format_suffix(self, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_renderers(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_parsers(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_authenticators(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_permissions(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_throttles(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_content_negotiator(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_exception_handler(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.perform_content_negotiation(self, request, force=False)</b>
    -   <b style="color:rgb(54, 128, 233)">.perform_authentication(self, request)</b>
    -   <b style="color:rgb(54, 128, 233)">.check_permissions(self, request)</b>
    -   <b style="color:rgb(54, 128, 233)">.check_object_permissions(self, request, obj)</b>
    -   <b style="color:rgb(54, 128, 233)">.check_throttles(self, request)</b>
    -   <b style="color:rgb(54, 128, 233)">.determine_version(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.initialize_request(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.initial(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.finalize_response(self, request, response, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.handle_exception(self, exc)</b>
    -   <b style="color:rgb(54, 128, 233)">.raise_uncaught_exception(self, exc)</b>
    -   <b style="color:rgb(54, 128, 233)">.dispatch(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.options(self, request, \*args, \*\*kwargs)</b>

-   <b style="color:red">GenericAPIView(views.APIView)</b>

    -   `.queryset = None`
    -   `.serializer_class = None`
    -   `.lookup_field = 'pk'`
    -   `.lookup_url_kwarg = None`
    -   `.filter_backends = api_settings.DEFAULT_FILTER_BACKENDS`
    -   `.pagination_class = api_settings.DEFAULT_PAGINATION_CLASS`
    -   <b style="color:rgb(54, 128, 233)">.get_queryset(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_object(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_serializer(self, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_serializer_class(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_serializer_context(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.filter_queryset(self, queryset)</b>
    -   <b style="color:rgb(54, 128, 233)">.paginator(self)</b>
    -   <b style="color:rgb(54, 128, 233)">.paginate_queryset(self, queryset)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_paginated_response(self, data)</b>

-   <b style="color:red">CreateAPIView(mixins.CreateModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.post(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">ListAPIView(mixins.ListModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.get(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">RetrieveAPIView(mixins.RetrieveModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.get(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">DestroyAPIView(mixins.DestroyModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.delete(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">UpdateAPIView(mixins.UpdateModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.put(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.patch(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">ListCreateAPIView(mixins.ListModelMixin,mixins.CreateModelMixin,GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.get(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.post(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">RetrieveUpdateAPIView(mixins.RetrieveModelMixin,mixins.UpdateModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.get(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.put(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.patch(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">RetrieveDestroyAPIView(mixins.RetrieveModelMixin, mixins.DestroyModelMixin, GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.get(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.delete(request, \*args, \*\*kwargs)</b>

-   <b style="color:red">RetrieveUpdateDestroyAPIView(mixins.RetrieveModelMixin,mixins.UpdateModelMixin,mixins.DestroyModelMixin,GenericAPIView)</b>

    -   <b style="color:rgb(54, 128, 233)">.get(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.put(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.patch(request, \*args, \*\*kwargs)</b>

    -   <b style="color:rgb(54, 128, 233)">.delete(request, \*args, \*\*kwargs)</b>

</details>

---

<details open><summary style="font-size:22px;color:Orange;text-align:left">rest_framework.mixins</summary>

-   <b style="color:red">CreateModelMixin</b>
    -   <b style="color:rgb(54, 128, 233)">.create(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.perform_create(self, serializer)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_success_headers(self, data)</b>
-   <b style="color:red">ListModelMixin</b>
    -   <b style="color:rgb(54, 128, 233)">.list(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:red">RetrieveModelMixin</b>
    -   <b style="color:rgb(54, 128, 233)">.retrieve(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:red">UpdateModelMixin</b>
    -   <b style="color:rgb(54, 128, 233)">.update(self, request, \*args, \*\*kwargs)</b>
    -   `perform_update(self, serializer)`
    -   <b style="color:rgb(54, 128, 233)">.partial_update(self, request, \*args, \*\*kwargs)</b>
-   <b style="color:red">DestroyModelMixin</b>
    -   <b style="color:rgb(54, 128, 233)">.destroy(self, request, \*args, \*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.perform_destroy(self, instance)</b>

</details>

---

<details open><summary style="font-size:22px;color:Orange;text-align:left">rest_framework.serializers</summary>

-   <b style="color:red">BaseSerializer(Field)</b>

    -   <b style="color:rgb(54, 128, 233)">.to_internal_value(data)</b>
    -   <b style="color:rgb(54, 128, 233)">.to_representation(instance)</b>
    -   <b style="color:rgb(54, 128, 233)">.update(instance, validated_data)</b>
    -   <b style="color:rgb(54, 128, 233)">.create(validated_data)</b>
    -   <b style="color:rgb(54, 128, 233)">.save(\*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.is_valid(raise_exception=False)</b>
    -   <b style="color:rgb(54, 128, 233)">.data()</b>
    -   <b style="color:rgb(54, 128, 233)">.errors()</b>
    -   <b style="color:rgb(54, 128, 233)">.validated_data()</b>

-   <b style="color:red">Serializer(BaseSerializer, metaclass=SerializerMetaclass)</b>

    -   <b style="color:rgb(54, 128, 233)">.fields()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_fields()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_validators()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_initial()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_value(dictionary)</b>
    -   <b style="color:rgb(54, 128, 233)">.run_validation(data=empty)</b>
    -   <b style="color:rgb(54, 128, 233)">.run_validators(value)</b>
    -   <b style="color:rgb(54, 128, 233)">.to_internal_value(data)</b>
    -   <b style="color:rgb(54, 128, 233)">.to_representation(instance)</b>
    -   <b style="color:rgb(54, 128, 233)">.validate(attrs)</b>

-   <b style="color:red">ListSerializer(BaseSerializer)</b>

    -   <b style="color:rgb(54, 128, 233)">.get_initial()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_value(dictionary)</b>
    -   <b style="color:rgb(54, 128, 233)">.run_validation(data=empty)</b>
    -   <b style="color:rgb(54, 128, 233)">.to_internal_value(data)</b>
    -   <b style="color:rgb(54, 128, 233)">.to_representation(data)</b>
    -   <b style="color:rgb(54, 128, 233)">.validate(attrs)</b>
    -   <b style="color:rgb(54, 128, 233)">.update(instance, validated_data)</b>
    -   <b style="color:rgb(54, 128, 233)">.create(validated_data)</b>
    -   <b style="color:rgb(54, 128, 233)">.save(\*\*kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.is_valid(raise_exception=False)</b>
    -   <b style="color:rgb(54, 128, 233)">.data()</b>
    -   <b style="color:rgb(54, 128, 233)">.errors()</b>

-   <b style="color:red">ModelSerializer(Serializer)</b>

    -   `.serializer_related_field = PrimaryKeyRelatedField`
    -   `.serializer_related_to_field = SlugRelatedField`
    -   `.serializer_url_field = HyperlinkedIdentityField`
    -   `.serializer_choice_field = ChoiceField`
    -   `.url_field_name = None`

    -   <b style="color:rgb(54, 128, 233)">.create(validated_data)</b>
    -   <b style="color:rgb(54, 128, 233)">.update(instance, validated_data)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_fields()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_field_names(declared_fields, info)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_default_field_names(declared_fields, model_info)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_field(field_name, info, model_class, nested_depth)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_standard_field(field_name, model_field)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_relational_field(field_name, relation_info)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_nested_field(field_name, relation_info, nested_depth)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_property_field(field_name, model_class)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_url_field(field_name, model_class)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_unknown_field(field_name, model_class)</b>
    -   <b style="color:rgb(54, 128, 233)">.include_extra_kwargs(kwargs, extra_kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_extra_kwargs()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_uniqueness_extra_kwargs(field_names, declared_fields, extra_kwargs)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_validators()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_unique_together_validators()</b>
    -   <b style="color:rgb(54, 128, 233)">.get_unique_for_date_validators()</b>

-   <b style="color:red">HyperlinkedModelSerializer(ModelSerializer)</b>
    -   <b style="color:rgb(54, 128, 233)">.get_default_field_names(declared_fields, model_info)</b>
    -   <b style="color:rgb(54, 128, 233)">.build_nested_field(field_name, relation_info, nested_depth)</b>

</details>

---

<details open><summary style="font-size:22px;color:Orange;text-align:left">Views</summary>

</details>

---

<details open><summary style="font-size:22px;color:Orange;text-align:left">Views</summary>

</details>

---

<details open><summary style="font-size:22px;color:Orange;text-align:left">Views</summary>

</details>
