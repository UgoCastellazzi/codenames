import { event } from "jquery";
import { fetchWithToken } from "../utils/fetch_with_token";

const clueFormSubmit = document.getElementById("new_clue");
// const clueNumber = document.getElementById("clue_number_clue");
const cards = document.querySelectorAll("div.word-card")
const clueContainer = document.getElementById("clues")

const launchGuessingWork = () => {
    cards.forEach((card) => {
        card.addEventListener("click", () => {
            fetchWithToken("/games/32/clues", {
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                    body: JSON.stringify({ word_clue: "blop" })
                })
        });
    });

}

const checkColor = (event) => {
    const classes = event.currentTarget.classList.value;
    if (classes.includes("black-card")) {
        displayMessage("<p>perdu</p>")
    } else if (classes.includes("blue-card")) {
        displayMessage("<p>encore perdu</p>");
    } else if (classes.includes("white-card")) {
        displayMessage("<p>encore perdu</p>");
    } else {
        displayMessage("<p>continue</p>")
    }
}

const displayMessage = (message) => {
    clueContainer.insertAdjacentHTML("beforeend", message)
    console.log(message)
}

export { launchGuessingWork }