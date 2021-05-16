export default function onLoad() {
  var featuredCard = document.getElementById('featuredCard')
  var cards = document.getElementById('cards').getElementsByTagName('div')
  featuredCard.replaceChildren(cards[0].cloneNode(true))
  var mapImage = document.getElementById('featuredCard').getElementsByTagName('img')[0]
}
window.addEventListener('load', onLoad)
