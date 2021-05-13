import onLoad from './featuredCard.js'

document.addEventListener("DOMContentLoaded", () => {

const cardContainer = document.getElementById("cards")
const button = document.getElementById("shuffle")

button.addEventListener("click", (event) => {
  let cards = document.getElementsByClassName("card")

  let shuffled = _.shuffle(cards)
  cardContainer.innerHTML = ""
  shuffled.forEach(element => cardContainer.appendChild(element))
  onLoad()
})
});
