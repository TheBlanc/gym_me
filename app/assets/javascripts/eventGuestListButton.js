document.addEventListener("DOMContentLoaded", function(){

  var guestListButton = document.querySelector('#seeAllUsersButton');
  var longGuestListArray = document.querySelectorAll('#longGuestList');


  guestListButton.addEventListener("click", function(e) {
    $('.longGuestListItem').slideToggle("fast");
  });

});
