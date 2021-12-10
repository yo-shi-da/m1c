document.addEventListener('turbolinks:load', () => {

  function inputChange() {
    // height
    personal_height1 = document.getElementById('personal_height').value;
    personal_height2 = personal_height1/100;
    personal_height3 = personal_height2.toFixed(1);
    // body_weight
    personal_body_weight = document.getElementById('personal_body_weight').value;
    // BMI
    personal_bmi = personal_body_weight/personal_height3/personal_height3
    personal_bmi2 = personal_bmi.toFixed(0);
    document.getElementById('personal_bmi').value = personal_bmi2;
  }
  // BMIの計算は、体重からなので「body_weight」を指定する。
  let text = document.getElementById('personal_body_weight')
  text.addEventListener('input', inputChange);
  
})
