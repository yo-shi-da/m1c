document.addEventListener('turbolinks:load', () => {

  function inputChange() {
    toushitsu_value = document.getElementById('meal_sugar_amount').value;
    kaku_change = Math.round(toushitsu_value/4);  
    document.getElementById('meal_sugar_cube').value = kaku_change;
  }
  
  let text = document.getElementById('meal_sugar_amount')
  text.addEventListener('input', inputChange);

})