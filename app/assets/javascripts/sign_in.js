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

  $('.owl-carousel').owlCarousel({
      loop:true,
      margin:20,
      nav:true,
      responsive:{
          0:{
              items:1
          },
          600:{
              items:1
          },
          1000:{
              items:1
          }
      }
  });

  $('#sign-in-button').click(function(e) {
    $('#sign-in-modal').toggle("fade");
    $('#sign-in-overlay').toggle();
  });


  $('#sign-in-overlay').click(function() {
    $('#sign-in-modal').toggle("fade");
    $('#sign-in-overlay').toggle();
  });





});
