import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_orange.css"

flatpickr(".datepicker", {
  minDate: "today",
  dateFormat: "j F Y"
})
