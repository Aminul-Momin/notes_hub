### Table of Content:

-   Folding and chomping
-   Nested sequences
-   Nested mappings
-   Combining sequences and mappings Dates in markdown files
-   Repeated nodes Adding data types

---

-   One file can contain multiple documents
-   Documents are separated by 3 hyphens (---)
-   Can be ended with suffix of 3 dots (...)

---

### Multi-line Strings: Folding and Chomping:

-   Folding: Dealing with new lines in multi-line strings
-   Chomping: How to deal with trailing newlines in multi-line strings

-   show for folding: > and |
-   show for chomping: + - and nothing

```yaml
multi-line: |+
Some silly text across multiple lines,
very important to include some white space:

And some
    more indentation
And some trailing newlines.

```

### Nested Sequences

```yaml
flow_list:
    - [of, lists]
    - [and, lists]

block_list:
    - - of
      - lists
    - - and
      - lists
```

```yaml
- [programming, coding, scripting]
- [data serialization, serializing]
```

Alternatively,

```yaml
- - programming
  - coding
  - scripting
- - data serialization
  - serializing
```

### YAML Nested Mappings

```yaml
person:
    name: Maaike
    age: 30
    address:
        streetname: Langstraat
        number: 1
        zipcode: 1234AB
        country: The Netherlands
    flow-mapping: { where: inside, what: mapping }
```

### Combining Sequences and Mappings

-   Map scalar to sequence
-   Sequence of mappings
-   Mapping of sequence of mappings

```yaml
languages:
    - programming:
          - frontend:
                - html
                - css
                - js
          - backend:
                - java
                - python
                - c#
    - data serialization:
          - yaml
          - json

languages:
    - programming: [frontend: [html, css, js], backend: [java, python, c#]]
    - data serialization: [yaml, json]
```

### YAML Dates

```yaml
timestamp: 2022-03-22T22:19:56.10+02:00
simple-date: 2022-03-22
```

### Repeated Nodes:

-   You define a block using an anchor (`&anchor_name`), and then refer to it using an alias (`*anchor_name`).
-   Anchors are denoted using a `&` character followed by the anchor name. We specify an alias using the `*` character followed by the anchor name
-   Anchor person (`&person`) and next referenced with alias (`*person`)
-   Overwrite part of the repeated node with merge key `<<`:

```yaml
person: &person
    name: Maaike
    age: 30
    address:
        streetname: Langstraat
        number: 1
        zipcode: 1234AB
        country: The Netherlands
another_person: *person

yet_another_person:
    <<: *person
    name: maria
```

### YAML Working with Tags

-   Tags give a node a type
-   Untagged nodes are given a type
-   Explicit typing can be done with the `!`
-   Schemas specify the tags

```yaml
not-a-date: !!str 2022-03-21
not-a-number: !!str 20
unnecessary: !!int 20
```

### Working with Schemas

-   Default: Failsafe schema, JSON schema and core schema
-   Used to create custom data types with language specific schemas
-   Programming languages have their own schema that map YAML to the language native data structure
-   Interoperable schemas use global tags to represent the same data across different languages

#### Failsafe Schema

-   Three tags: string, mapping, sequence

```yaml
!!str: a string value !
!map: a mapping
!!seq: a sequence
! Is shorthand for !<tag:yaml.org,2002:...>
```

#### JSON Schema

-   Failsafe tags

```yaml
!!null: a null value
!!bool: boolean
!!int: integer
!!float: float
```
