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

 - [x] Create a deck generation method that includes all countries capitals (cards)
 - [x] A deck auto generates upon rendering of the page.

### Issue 2

When a visitor visits the capitals index page:
- [ ] There is deck of Capital cities names cards that includes the country it belongs to.
- [ ] deck is presented alphabetically the first time.
- [ ] there is shuffle button that uses a deck.shuffle method to shuffle the deck.

