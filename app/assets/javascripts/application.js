// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require common_js/bootstrap.min.js

function deleteConformation(onclickMethod){
  $('#deleteProductModal').on('show.bs.modal', function () {
    var modal = $(this)
    modal.find('.conform').attr("onclick",onclickMethod)
  });
}

function openModal(url,modalId){
  remove_data_modal();
  $(modalId).modal({
    remote: url,
    backdrop: 'static'
  })
}

function submitForm(form_id,gridId){
  var form = $(form_id)
  var valuesToSubmit = form.serialize();
  var url = form.attr( "action" );
  var method = form.attr( "method" );
  ajaxCall(url,method,valuesToSubmit,gridId)
}

function closeAllModals(){
  $(".modal").modal("hide");
}

function closeModalByID(id){
  $(id).modal("hide");
}

function refereshGrid(gridId){
  $(gridId).data("kendoGrid").dataSource.read();
}

function doDelete(url,id,gridId) {
  ajaxCall(url,"Delete",{},gridId,"Deleted")
}

function ajaxCall(url,method,valuesToSubmit,gridId,messageContent){
  var messageContent = messageContent || "Saved"
  $.ajax({
    url: url,
    type: method,
    data: valuesToSubmit,
    success: function (data) {
      closeAllModals()
      if (gridId != "undefined" && gridId !="") {refereshGrid(gridId);}
      if (data.status == 200) { message("success",messageContent);}
    },
  });
}

function remove_data_modal(){
  jQuery('body').on('hidden.bs.modal', '.modal', function () {
    jQuery(this).removeData('bs.modal');
  });
}

function message(type,message){
  switch(type){
    case "success":
                  new Messi('', {autoclose:1200,padding: '0px',closeButton: false, width: '100px', title: message, titleClass: 'success',animate: {open:'fadein',close:'fadeOut'}});
                  // new Messi(null,{title: 'message',titleClass: 'success',animate: {open:'fadein',close:'fadeOut'},autoclose: "1200",closeButton: false});
                  break;
    case "error":
                  new Messi(message,{title: 'Error',titleClass: 'anim error',animate: { open: 'swing', close: 'bounceOutRight' },buttons: [ {id: 0, label: 'Close', val: 'X'} ]});
                  break;
  }
}