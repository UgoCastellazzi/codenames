import consumer from "./consumer";

const initGameCable = () => {
  const cluesContainer = document.getElementById('clues');
  const messagesContainer = document.getElementById('messages');
  if (cluesContainer) {
    const id = cluesContainer.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        printMessage(data, cluesContainer, messagesContainer);
        changeColor(data);
      },
    });
  }
}

const printMessage = (data, cluesContainer, messagesContainer) => {
  if (data.word_id) {
    messagesContainer.insertAdjacentHTML('beforeend', 
    `<div class='clue-container' id='clue'>
        <p> ${data.content} </p>
    </div>`
    );
    messagesContainer.scrollTop = messagesContainer.scrollTopMax;
  } else {
    cluesContainer.insertAdjacentHTML('beforeend', 
    `<div class='clue-container' id='clue'>
        <p> ${data} </p>
    </div>`
    );
    const formInput = document.getElementById("new_clue");
    formInput.reset();
    cluesContainer.scrollTop = cluesContainer.scrollTopMax;
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