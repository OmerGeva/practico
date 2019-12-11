// TIME TYPE PICKER
const dataPickerHomepage = () => {
if (document.URL.match('/challenges/new')) {

var el = {};

// const placeHolderTime = document.querySelector('.time_type_placeholder');
// const timeTypeList = document.querySelector('.time_type_list');

// placeHolderTime.addEventListener('click', event => {
//   event.currentTarget.style.opacity = 0;
//   timeTypeList.classList.toggle('d-none')
// })
$('.time_type_placeholder').on('click', function (ev) {
  $('.time_type_placeholder').css('opacity', '0');
  $('.time_type_list').toggle();
});


 $('.time_type_list a').on('click', function (ev) {
   ev.preventDefault();
   var index = $(this).parent().index();

   $('.time_type_placeholder').text( $(this).text() ).css('opacity', '1');

   $('.time_type_list').find('li').eq(index).prependTo('.time_type_list');
   $('.time_type_list').toggle();

 });


$('select').on('change', function (e) {

  // Set text on placeholder hidden element
  $('.time_type_placeholder').text(this.value);

  // Animate select width as time_type_placeholder
  $(this).animate({width: $('.time_type_placeholder').width() + 'px' });

});

// COUNT TYPE PICKER

var el = {};

$('.count_type_placeholder').on('click', function (ev) {
  $('.count_type_placeholder').css('opacity', '0');
  $('.count_type_list').toggle();
});

 $('.count_type_list a').on('click', function (ev) {
   ev.preventDefault();
   var index = $(this).parent().index();

   $('.count_type_placeholder').text( $(this).text() ).css('opacity', '1');

   $('.count_type_list').find('li').eq(index).prependTo('.count_type_list');
   $('.count_type_list').toggle();

 });


$('select').on('change', function (e) {

  // Set text on count_type_placeholder hidden element
  $('.count_type_placeholder').text(this.value);

  // Animate select width as count_type_placeholder
  $(this).animate({width: $('.count_type_placeholder').width() + 'px' });

});

// MILESTONE

const countList1 = document.querySelector('.milestone_input');
const countInput1 = document.getElementById("challenge_milestone")

countList1.addEventListener('change', (e) => {
  countInput1.value = e.currentTarget.value
})

// TIME TYPE

const countList2 = document.querySelector(".time_type_list")
const countInput2 = document.getElementById("challenge_time_type")
const timeItems = countList2.querySelectorAll('li');

const handleTimeItem = (event) => {
  countInput2.value = event.currentTarget.innerText
}
timeItems.forEach(item => item.addEventListener('click', handleTimeItem))

// COUNT_TYPE

const countList3 = document.querySelector(".count_type_list")
const countInput3 = document.getElementById("challenge_count_type")
const countItems = countList3.querySelectorAll('li');


const handleCountItem = (event) => {
  countInput3.value = event.currentTarget.innerText
}
countItems.forEach(item => item.addEventListener('click', handleCountItem))

// countList3.addEventListener('click', (e) => {
//   countInput3.value = e.currentTarget.firstChild.firstChild.innerText
//     console.log(e.currentTarget.firstChild.firstChild.innerText);

// })
}

// FRIENDS DROPDOWN

const friendsSelectItems = document.querySelectorAll(".friend_list .dropdown-item")
const selectedFriends = document.querySelectorAll('.friend-checkbox')

friendsSelectItems.forEach((fse) => {
  fse.addEventListener('click', (e) => {
    // 1. get the id of which friend was clicked
    const friendId = e.target.dataset.friendId
    // 2. find the corresponding checkbox
    const cb = document.getElementById(`challenge_users_${friendId}`)
    // 3. toggle its checked value
    cb.checked = !cb.checked
  })
})

// PROOF CHECKBOXES

document.querySelector('.checkbox').addEventListener("click", (e) => {
  document.querySelector("#challenge_validation_type_checkbox").checked = !document.querySelector("#challenge_validation_type_checkbox").checked;
})

document.querySelector('.duration').addEventListener("click", (e) => {
  document.querySelector("#challenge_validation_type_duration").checked = !document.querySelector("#challenge_validation_type_duration").checked;
})

// change proof color when selected
const proofs = document.querySelectorAll('.proofs .proof')
proofs.forEach((proof) => {
  proof.addEventListener('click', (e) => {
    e.preventDefault()
  })
})

}
export { dataPickerHomepage };
