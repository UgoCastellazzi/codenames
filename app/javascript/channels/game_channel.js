import consumer from "./consumer";

const initGameCable = () => {
  const cluesContainer = document.getElementById('clues');
  if (cluesContainer) {
    const id = cluesContainer.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        console.log(data);
        cluesContainer.insertAdjacentHTML('beforeend', 
        `<div class='clue-container' id='clue'>
            <p> ${data} </p>
        </div>`

        );
      },
    });
  }
}

export { initGameCable };