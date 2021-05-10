# Notes

### Capital cities card table

| Column   | Type   |
| -------- | ------ |
| id:      | integer|
| name:    | string | 
| country: | string |
| lat:     | float  |
| lon:     | float  |


### Capital cities deck table

| Column   | Type   |
| -------- | ------ |
| id:      | integer|

### Relations

Deck:
has_many: cards

Card:
belongs_to: deck
