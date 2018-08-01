document.addEventListener("DOMContentLoaded", function(){

  var avatarButton = document.querySelector('#profile-avatar-button')
  var userMenu = document.querySelector('#user-menu')

  avatarButton.addEventListener("click", function(e) {
    $('#user-menu').toggleClass('hidden');
  });


});
