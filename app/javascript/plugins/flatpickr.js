import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
    defaultDate: "today",
    minDate: "today"
})

flatpickr(".datepicker-end", {
    defaultDate: ["2019-11-30"]
})
