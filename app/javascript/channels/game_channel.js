import consumer from "./consumer";

const initGameCable = () => {
  console.log("data")
  const cluesContainer = document.getElementById('clues');
  if (cluesContainer) {
    const id = cluesContainer.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        cluesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initGameCable };