const cardContainer = document.getElementById("cards")
const button = document.getElementById("shuffle")
                                                                  
button.addEventListener("click", (event) => {
  let cards = document.getElementsByClassName("card")
                                                                  
  let shuffled = _.shuffle(cards)
  cardContainer.innerHTML = ""
  shuffled.forEach(element => cardContainer.appendChild(element))
  onLoad()
})

function onLoad() {
  var featuredCard = document.getElementById('featuredCard')
  var cards = document.getElementById('cards').getElementsByTagName('div')
  featuredCard.replaceChildren(cards[0].cloneNode(true))
  var mapImage = document.getElementById('featuredCard').getElementsByTagName('img')[0]
  mapImage.style.height = '600px'
  mapImage.style.width = '600px'
}

function onClick(card) {
  document.getElementById('featuredCard').replaceChildren(card.cloneNode(true))
  var mapImage = document.getElementById('featuredCard').getElementsByTagName('img')[0]
  mapImage.style.height = '600px'
  mapImage.style.width = '600px'
}

window.addEventListener('load', onLoad)
