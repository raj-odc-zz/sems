function submitForm(e){var t=$(e),i=t.serialize(),s=t.attr("action"),n=t.attr("method");formAjaxCall(s,n,i)}function formAjaxCall(e,t,i){$.ajax({url:e,type:t,data:i,success:function(e){window.location.href="/profiles"}})}