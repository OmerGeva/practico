
if (document.URL.match(/challenges\/\d+/)) {
const chatHeader = document.querySelector('.chat-header');
const chatBoard = document.querySelector('.chat-board');
chatHeader.addEventListener(('click'), (event) => {
  chatBoard.classList.toggle('up');
  console.log('up');

})
}
