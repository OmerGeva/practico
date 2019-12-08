function readURL(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        const form = document.querySelector('#avatar-uploader');
        reader.addEventListener('load', (e) => {
          console.log('looooooaaad')
          form.submit()
          // const photo = event.target.result
          // fetch(rails_app_url, {
          //   method: 'POST',
          //   body: photo,
          // })
          // .then(response => response.json())
          // .then(data => console.log(data))
        });

        // reader.onload = function(e) {
        //     $('#imagePreview').css('background-image', 'url('+e.target.result +')');
        //     $('#imagePreview').hide();
        //     $('#imagePreview').fadeIn(650);
        // }
        // reader.readAsDataURL(input.files[0]);
    }
}
$("#imageUpload").change(function() {
    readURL(this);
    const form = document.querySelector('#avatar-uploader');
    form.submit()

});
