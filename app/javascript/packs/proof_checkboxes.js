const checkboxLink = document.querySelector(".proof.checkbox")
const durationLink = document.querySelector(".proof.duration")
const checkCheckbox = document.getElementById("challenge_validation_type_checkbox")
const durationCheckbox = document.getElementById("challenge_validation_type_duration")


durationLink.addEventListener("click", (e) => {
  console.log(durationCheckbox.checked)
  if (durationCheckbox.checked) {
       e.currentTarget.classList.remove("orange")
  } else {
     e.currentTarget.classList.add("orange")
    checkboxLink.classList.remove("orange")
  }
})

checkboxLink.addEventListener("click", (e) => {
  console.log(checkCheckbox.checked)
  if (checkCheckbox.checked) {
     e.currentTarget.classList.remove("orange")

  } else {
    e.currentTarget.classList.add("orange")
    durationLink.classList.remove("orange")
  }
})
