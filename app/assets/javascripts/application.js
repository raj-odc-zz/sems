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
  $(modalId).modal({
    remote: url,
    backdrop: 'static'
  })
}

function submitForm(form_id){
  $('form'+form_id).submit()
}

function closeAllModals(){
  $(".modal").modal("hide");
}

function closeModalByID(id){
  $(id).modal("hide");
}

function message(type,message,title){
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