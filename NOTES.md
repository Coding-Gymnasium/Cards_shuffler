# Notes

### Capital cities card table

| Column   | Type   |
| :-----:  | :----: |
| id:      | integer|
| name:    | string | 
| country: | string |
| lat:     | float  |
| lon:     | float  |
| deck_id: | integer|


### Capital cities deck table

| Column   | Type   |
| :------: | :----: |
| id:      | integer|

### Relations

#### Deck:

has_many: cards

#### Card:

belongs_to: deck

### Issue 1

#### Deck generation

Create a deck generation method that includes all countries capitals (cards)

### Issue 2

When a visitor visits the capitals index page:
- a deck auto generates upon rendering of the page.
- deck is presented alphabetically the first time.
- there is shuffle button that uses a deck.shuffle method to shuffle the deck.

