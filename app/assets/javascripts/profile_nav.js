document.addEventListener("DOMContentLoaded", function(){

  // var avatarButton = document.querySelector('div#profile-avatar-button');
  // var userMenu = document.querySelector('#user-menu');
  // var closeButton = document.querySelector('#close-button');

  // avatarButton.addEventListener("click", function(e) {
  //   $('#user-menu').toggleClass('hidden');
  // });
  //
  // closeButton.addEventListener("click", function(e) {
  //   $('#user-menu').toggleClass('hidden');
  // });


  $('#profile-avatar-button').click(function(e) {
    $('#user-menu').toggle( "slide", { direction: "down" }, 330);
  });

  $('#close-button').click(function() {
    $('#user-menu').toggle( "slide", { direction: "down" }, 330);
  });





});
