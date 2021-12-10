document.addEventListener('turbolinks:load', () => {

  function inputChange() {
    // owner
    owner_value = document.getElementById('post_owner_sugar_amount').value;
    // user
    user_value = document.getElementById('user_sugar_amount').textContent;
    let user_value_change = user_value.substr( 0, 3 );
    user_value_int = parseInt(user_value_change, 10);
    // difference
    difference = owner_value - user_value_int
    console.log(difference)
    document.getElementById('post_difference').value = difference;
  }
  
  let text = document.getElementById('post_owner_sugar_amount')
  text.addEventListener('input', inputChange);

})