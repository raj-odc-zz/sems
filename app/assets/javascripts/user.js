$(document).ready(function(){
  userListGrid()
})
function userListDataSource(){
  var datasource = new kendo.data.DataSource({
    transport:{
            read:{
              url: "/users",
              dataType: "json",
              complete: function (data, status) {
                if(status == "success"){ }
              },
            },
            update: {
              url: function(options, operation) { return "/users/"+options.models[0]["id"]},
              dataType : "json",
              type: 'PUT',
              complete: function (data, status) {
                jQuery("#userList").data("kendoGrid").dataSource.read();
              },
            },
            parameterMap: function(options, operation) {
              if (operation == "update" && options.models) {
                return { "user": options.models[0]}
              }
            },
        },
         schema: {
          total: 'total',
          data: 'data',
          model: {
            id: "id",
            fields: {
               id: { type: "string", editable: false},
               username: { type: "string", editable: true},
               email_id: { type: "string", editable: true},
               role: { type: "string", editable: true},
              }
            }
        },

        batch: true,
        pageSize: 100,
        serverPaging: false,
        serverFiltering: false,
        serverSorting: false
  });
 return datasource
}

 function userListGrid() {
     jQuery("#userList").kendoGrid({
         dataSource: userListDataSource(),
         resizable: true,
          pageable: {
            refresh: true,
          },
         scrollable: false,
         sortable: true,
         columns: [
              {
                  field: "username",
                  title: "User Name"
              },
              {
                  field: "email",
                  title: "Email"
              },
              {
                  field: "role_id",
                  title: "role"
              },

              {command: [{ name:"edit",text: " "},{ name:"Delete", text: " ", click: delete_systems }],width: "150px"},

          ],
     });

  }

function edit_systems(e){
  var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
  openModal("/users/"+dataItem.id+"/edit","#userModal")
}

function delete_systems(e){
  var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
  doDelete(dataItem.id)
}

  // window.location.href = "/users/new"
