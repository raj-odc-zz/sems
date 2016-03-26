$(document).ready(function(){
  $("#tabstrip").kendoTabStrip();
  $('#rootwizard').bootstrapWizard({
    onTabClick: function(tab, navigation, index) {}
  });
  $(".board_type_select").on("change",function(){ showClassLists() })
})

function showClassLists(){
  var id = $("#profile_board_id option:selected").val()
  simpleAjaxCall("/class_lists/update_class_list","GET",{board_id: id})
}

function submitForm(form_id) {
  var form = $(form_id)
  var valuesToSubmit = form.serialize();
  var url = form.attr( "action" );
  var method = form.attr( "method" );
  formAjaxCall(url,method,valuesToSubmit)
}

function formAjaxCall(url,method,valuesToSubmit){
  $.ajax({
    url: url,
    type: method,
    data: valuesToSubmit,
    success: function (data) {
      window.location.href = "/profiles"
    },
  });
}