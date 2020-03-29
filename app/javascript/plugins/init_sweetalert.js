import swal from 'sweetalert';

const initSweetAlertDeleteFriend = () => {

  // const swalButton = document.querySelector(selector);
  const linkbtns = document.querySelectorAll('#remove-friend-btn')
  linkbtns.forEach((swalButton) => {
    swalButton.addEventListener('click', (event) => {
      event.preventDefault();
      swal("Are you sure?", {
        dangerMode: true,
        buttons: true,
        buttons: ["Cancel", "Yes"],
      })
      .then((value) => {
        if (value) {
          document.getElementById(`remove-friend-${swalButton.dataset.friendid}`).click();
          }
        });
    });

  });

};

export { initSweetAlertDeleteFriend };
