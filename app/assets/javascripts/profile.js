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