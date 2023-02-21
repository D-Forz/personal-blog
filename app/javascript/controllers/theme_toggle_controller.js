import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-toggle"
export default class extends Controller {
  static targets = ["body"];
  static values = {
    darkMode: Boolean,
  };

  toggle() {
    this.darkModeValue = !this.darkModeValue;
    this.bodyTarget.classList.toggle("bg-gray-900", this.darkModeValue);
    this.bodyTarget.classList.toggle("text-white", this.darkModeValue);
    localStorage.setItem("darkMode", this.darkModeValue);
  }

  initialize() {
    this.darkModeValue = localStorage.getItem("darkMode") === "true";
    this.bodyTarget.classList.toggle("bg-gray-900", this.darkModeValue);
    this.bodyTarget.classList.toggle("text-white", this.darkModeValue);
  }

  get bodyTarget() {
    return document.querySelector("body");
  }
}
