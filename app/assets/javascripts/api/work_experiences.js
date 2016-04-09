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