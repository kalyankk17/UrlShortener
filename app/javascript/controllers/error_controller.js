import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { message: String }

    connect() {
        const errorMessage = this.element.dataset.errorMessage

        if (errorMessage) {
            this.displayError(errorMessage)
        }
    }

    displayError(message) {
        this.open(message)
    }

    open(message) {
        this.errorMessageElement.textContent = message
        this.modalElement.style.display = "block"
        this.modalElement.classList.add("show")
    }

    close() {
        this.modalElement.style.display = "none"
        this.modalElement.classList.remove("show")
    }

    get modalElement() {
        return this.element.querySelector(".modal")
    }

    get errorMessageElement() {
        return this.element.querySelector("#modal-error-message")
    }
}