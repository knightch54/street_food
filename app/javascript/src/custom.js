function showPayoutInformationRelativeToPercentage() {
  let slider = $("#chef-salary-range");
  if (slider.length) {
    let chef_salary_section = $(".chef-salary-section");
    let chef_salary = chef_salary_section.find(".chef-salary");
    let percent_salary = chef_salary_section.find(".percent-salary");

    slider.on("change", function() {
      let cash_balance = $(this).attr("balance");
      let percent_value = this.value;
      percent_salary.text("%" + percent_value);
      chef_salary.text("$" + parseInt(percentageOfNumber(cash_balance, percent_value)));
    });
  }
}

function percentageOfNumber(number, percent) {
  return parseFloat(number) / 100 * parseFloat(percent);
}

$(document).on('turbolinks:load', function() {
  showPayoutInformationRelativeToPercentage();
});