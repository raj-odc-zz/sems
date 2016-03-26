$(document).ready(function(){
  var tabStrips = $('#tabstrip').kendoTabStrip().data("kendoTabStrip");
    // classListGrid()
    // callExamTypesGrid()
})

function callExamTypesGrid() {
    $.each(exam_types,function(i,val){
        var id = "#"+val
        examDataSource()
    });
}

function examDataSource(exam_name){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/marks",
                dataType: "json",
                data: {class_list_id: exam_name},
            },
        },
        schema: {
            total: 'total',
            data: 'data',
            model: {
                id: "id",
                fields: createSubHash
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

function examGrid(id,exam_name) {
    jQuery(id).kendoGrid({
        dataSource: examDataSource(exam_name),
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
            {command: [
                        { name:"edit",text: "Edit",click: edit_systems },
                        { name:"Delete", text: "Delete", click: delete_systems },
                        { name:"show", text: "Exam Info", click: showExamInfo },
                      ]
            },

        ],
    });

}


function createSubHash() {
    return {
        id: { type: "string", editable: false},
        subject: { type: "string", editable: true},
    }

}