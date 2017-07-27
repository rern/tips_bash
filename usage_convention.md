`usage` convention
---
```
utility_name [-a][-b][-c option_argument][-d|-e][-foption_argument] [operand...] operands

utility_name         - should be <lowercase>, 1st character cannot be digit
[  ]                 - <square bracket> option = can be omitted
...                  - multiples allowed

[-a]                 - without argument
[-c option_argument] - with argument
[-d|-e]              - <|> = only one or another allowed
[-foption_argument]  - without <space> before argument = long option name
[operand...]         - optional operand
operands             - required


utility_name [OPTIONS...] OPERANDS

<uppercase>          - has descriptions
[OPTIONS...]         - multiple options with descriptions
OPERANDS             - required with descriptions
```
