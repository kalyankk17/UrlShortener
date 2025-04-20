import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    copy(event) {
        const input = event.currentTarget.closest(".input-group").querySelector("input");
        navigator.clipboard.writeText(input.value)
    }
}