# Notes

### Capital cities card table

| Column   | Type   |
| :-----:  | :----: |
| id:      | integer|
| name:    | string | 
| country: | string |
| lat:     | float  |
| lon:     | float  |
| map_s:   | text   |
| map_l:   | text   |
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
- [x] There is deck of Capital cities names cards that includes the country it belongs to.
- [x] deck is presented alphabetically the first time.
- [x] there is shuffle button in the page that when clicked shuffles the deck.
- [x] When the page is refreshed the deck is back to displaying in alphabetical order

### Issue 3

- [x] A card has a static map of the capital city

### Issue 4

- [x] by default a random feature card displays upon page loading
- [x] There is temporary card showing while the page loads
- [x] Once loaded the featured card is the first card in the deck
- [x] Clicking shuffle also updates the featured card
- [x] Clicking directly on a card displays it as a featured card

#### Issue 5

##### Change source for countries data

Switching to an api versus the csv file. The file has some bad data and the latitude and longitude are not always correct.

- [x] Create a countries service

#### Issue 6

##### Change country card display and table

- [x] Update card model validations
- [x] Create deck_cards join table
- [x] Update relationships
- [x] Update tests
- [x] Update how decks generate cards
 
#### Issue 7

##### Add weather api

- [x] Change the card display in the home page to display the country flag instead of the map
- [x] Add other stats but no map in the index display.

#### Issue 8

- [x] Add weather service
- [ ] Create method to dynamically obtain current weather

#### Issue 9

##### Add images api

- [ ] Create image service
- [ ] Add images collection to card

#### Issue 10

##### Create card show page

- [ ] it has a map centered on the capital city
- [ ] it has all the stats  included in the small card
- [ ] it has images of the country
- [ ] it has the capital city current weather

#### Issue 11

##### Navigation

- [ ] There is navigation to go back to the home page
