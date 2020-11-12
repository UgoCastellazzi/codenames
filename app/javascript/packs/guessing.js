import { event } from "jquery";
import { fetchWithToken } from "../utils/fetch_with_token";

const cards = document.querySelectorAll("div.word-card")
const gameId = document.getElementById('clues').dataset.gameId

const launchGuessingWork = () => {
    cards.forEach((card) => {
        card.addEventListener("click", (event) => {
            const wordId = event.currentTarget.id
            fetchWithToken(`/games/${gameId}/messages`, {
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                    body: JSON.stringify({ content: generateMessage(event), word_id: wordId })
                })
        });
    });
}

const generateMessage = (event) => {
    const classes = event.currentTarget.classList.value;
    const word = event.currentTarget.dataset.word
    if (classes.includes("black-card")) {
        return `"${word}" est une carte noire, c'est perdu !`;
    } else if (classes.includes("blue-card")) {
        return `"${word}" est une carte bleue, trop triste !`;
    } else if (classes.includes("white-card")) {
        return `"${word}" est une carte blanche, ça craint mais pas trop !`;
    } else {
        return `"${word}" est une carte rouge, youpi !`;
    }
}

export { launchGuessingWork }