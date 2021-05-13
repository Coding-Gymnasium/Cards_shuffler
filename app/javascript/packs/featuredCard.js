export default function onLoad() {
  var featuredCard = document.getElementById('featuredCard')
  var cards = document.getElementById('cards').getElementsByTagName('div')
  featuredCard.replaceChildren(cards[0].cloneNode(true))
  var mapImage = document.getElementById('featuredCard').getElementsByTagName('img')[0]
  mapImage.style.height = '600px'
  mapImage.style.width = '600px'
}
window.addEventListener('load', onLoad)
