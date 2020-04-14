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
    $('#userMenu').toggle( "slide", { direction: "up" }, 330);
    $('#dropDownScreenCover').toggle();
  });

  $('#userScreenCover').click(function() {
    $('#userMenu').toggle( "slide", { direction: "up" }, 330);
    $('#userScreenCover').toggle();
  });

  $('#hamburgerMenuIcon').click(function(e) {
    $('#landingNavDropDownItems').toggle( "slide", { direction: "up" }, 330);
    $('#dropDownScreenCover').toggle();
  });

  $('#dropDownScreenCover').click(function() {
    $('#landingNavDropDownItems').toggle( "slide", { direction: "up" }, 330);
    $('#userMenu').toggle( "slide", { direction: "up" }, 330);
    $('#dropDownScreenCover').toggle();
  });

  $(window).scroll(function() {
      if ($(document).scrollTop() > 100) {
        $('#landingNavDropDownItems').hide( "slide", { direction: "up" }, 330);
        $('#dropDownScreenCover').hide();
        $('#userMenu').hide( "slide", { direction: "up" }, 330);
      }
    });



});
