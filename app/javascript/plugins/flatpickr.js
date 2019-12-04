import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_orange.css"

flatpickr(".datepicker", {
  enableTime: true,
  minDate: "today",
  minTime: "12:00",
  maxTime: "16:00"
})
