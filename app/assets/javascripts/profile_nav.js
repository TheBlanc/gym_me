document.addEventListener("DOMContentLoaded", function(){

  var avatarButton = document.querySelector('div#profile-avatar-button');
  var userMenu = document.querySelector('#user-menu');
  var closeButton = document.querySelector('#close-button');

  avatarButton.addEventListener("click", function(e) {
    $('#user-menu').toggleClass('hidden');
  });

  closeButton.addEventListener("click", function(e) {
    $('#user-menu').toggleClass('hidden');
  });


  // For desktop
  // Add event listener to the document to hide the user menu when a user clicks outside the menu and avatar area
  // document.addEventListener("click", function(e) {
  //   if ( e.target.closest('#user-menu') != userMenu && e.target.closest('div#profile-avatar-button') != avatarButton ) {
  //     $('#user-menu').addClass('hidden');
  //     }
  // });






});
