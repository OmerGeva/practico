// TIME TYPE PICKER

const dataPickerHomepage = () => {

var el = {};

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

countList2.addEventListener('click', (e) => {
  countInput2.value = e.currentTarget.firstChild.firstChild.innerText
})

// COUNT_TYPE

const countList3 = document.querySelector(".count_type_list")
const countInput3 = document.getElementById("challenge_count_type")

countList3.addEventListener('click', (e) => {
  countInput3.value = e.currentTarget.firstChild.firstChild.innerText
})
}

export { dataPickerHomepage };
