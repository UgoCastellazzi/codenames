import consumer from "./consumer";

const initGameCable = () => {
  const cluesContainer = document.getElementById('clues');
  if (cluesContainer) {
    const id = cluesContainer.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        console.log(data.word_id);
        printMessage(data, cluesContainer);
        changeColor(data);
      },
    });
  }
}

const printMessage = (data, cluesContainer) => {
  if (data.word_id) {
    cluesContainer.insertAdjacentHTML('beforeend', 
    `<div class='clue-container' id='clue'>
        <p> ${data.content} </p>
    </div>`
    );
  } else {
    cluesContainer.insertAdjacentHTML('beforeend', 
    `<div class='clue-container' id='clue'>
        <p> ${data} </p>
    </div>`
    );
  }
}

const changeColor = (data) => {
  if (data.word_id) {
    const card = document.getElementById(data.word_id);
    const classes = card.classList.value;
    if (classes.includes("black-card")) {
      card.classList.add("black-revealed-true");
    } else if (classes.includes("blue-card")) {
      card.classList.add("blue-revealed-true");
    } else if (classes.includes("white-card")) {
      card.classList.add("white-revealed-true");
    } else {
      card.classList.add("red-revealed-true");
    }
  }
}

export { initGameCable };