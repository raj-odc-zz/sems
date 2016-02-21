$(document).ready(function(){
  roleListGrid()
})
function roleListDataSource(){
  var datasource = new kendo.data.DataSource({
    transport:{
            read:{
              url: "/api/roles",
              dataType: "json",
            },
        },
         schema: {
          total: 'total',
          data: 'data',
          model: {
            id: "id",
            fields: {
               id: { type: "string", editable: false},
               name: { type: "string", editable: true},
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

 function roleListGrid() {
     jQuery("#roleList").kendoGrid({
         dataSource: roleListDataSource(),
         resizable: true,
          pageable: {
            refresh: true,
          },
         scrollable: false,
         sortable: true,
         columns: [
              {
                  field: "name",
                  title: "Name"
              },

              {command: [{ name:"edit",text: "Edit",click: edit_systems },{ name:"Delete", text: "Delete", click: delete_systems }]},

          ],
     });

  }

function edit_systems(e){
  var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
  openModal("/roles/"+dataItem.id+"/edit","#roleModal")
}

function delete_systems(e){
  var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
  doDelete("/api/roles/"+dataItem.id,dataItem.id,'#roleList')
}

  // window.location.href = "/roles/new"
