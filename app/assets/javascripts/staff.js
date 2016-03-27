$(document).ready(function(){
  markListGrid()
})
function markListDataSource(){
  var datasource = new kendo.data.DataSource({
    transport:{
            read:{
              url: "/api/marks",
              dataType: "json",
            },
            parameterMap: function(data, type) {
              if (type == "read") {
                                  return {
                                    class_list_id: $("#class_list option:selected").val(),
                                    "exam_type_id": $("#exam_types option:selected").val()
                                  }
                                 }
            }
        },
         schema: {
          total: 'total',
          data: 'data',
          model: {
            id: "id",
            fields: {
               id: { type: "string", editable: false},
               first_name: { type: "string", editable: true},
               last_name: { type: "string", editable: true},
               student_id: { type: "string", editable: true},
               exam_type: { type: "string", editable: true},
               mark: { type: "string", editable: true},
             }
            }
        },

        batch: true,
        pageSize: 10,
        serverPaging: false,
        serverFiltering: false,
        serverSorting: false
  });
 return datasource
}

 function markListGrid() {
     $("#markListGrid").kendoGrid({
         dataSource: markListDataSource(),
         resizable: true,
          pageable: {
            refresh: true,
          },
         scrollable: false,
         sortable: true,
         columns: [
              {
                  field: "first_name",
                  title: "First Name"
              },
              {
                  field: "last_name",
                  title: "Last Name"
              },
              {
                  field: "exam_type",
                  title: "Exam Type"
              },

              {
                  field: "mark",
                  title: "Mark"
              },
              {command: [{ name:"edit",text: "Edit",click: edit_systems },{ name:"Delete", text: "Delete", click: delete_systems }]},

          ],
     });

  }

function edit_systems(e){
  var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
  openModal("/staffs/"+dataItem.id+"/edit","#staffModal")
}

function delete_systems(e){
  var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
  doDelete("/api/marks/"+dataItem.id,dataItem.id,'#markListGrid')
}

  // window.location.href = "/roles/new"
function changeMarkList(){
  refereshGrid("#markListGrid")
}