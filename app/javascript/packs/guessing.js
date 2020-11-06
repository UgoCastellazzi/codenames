import { event } from "jquery";

const clueFormSubmit = document.getElementById("form-submit");
// const clueNumber = document.getElementById("clue_number_clue");
const cards = document.querySelectorAll("div.word-card")
const clueContainer = document.getElementById("clues")

const launchGuessingWork = () => {
    cards.forEach((card) => {
        card.removeEventListener("click", (checkColor));
        console.log("weremoved")
    });
    console.log("i ran")
    cards.forEach((card) => {
        card.addEventListener("click", (checkColor));
        console.log("weran")
    });
    console.log("i stopped running")
}

const checkColor = (event) => {
    console.log(event)
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