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








});
