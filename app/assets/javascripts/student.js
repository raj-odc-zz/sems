$(document).ready(function(){
  studentGrid()
})

function studentDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/students",
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

function studentGrid() {
    jQuery("#studentInfo").kendoGrid({
        dataSource: studentDataSource(),
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
            // {command: [
            //             { name:"edit",text: "Edit",click: edit_systems },
            //             { name:"Delete", text: "Delete", click: delete_systems },
            //             { name:"show", text: "Exam Info", click: showExamInfo },
            //           ]
            // },

        ],
    });

}
