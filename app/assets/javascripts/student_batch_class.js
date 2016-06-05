$(document).ready(function(){
    batchListGrid()
})
function batchListDataSource(){
    console.log(profile)
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/student_class_batches",
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
                    batch_name: { type: "string", editable: true},
                    class_name: { type: "string", editable: true},
                    section: { type: "string", editable: true},
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

function batchListGrid() {
    jQuery("#student_batch_info").kendoGrid({
        dataSource: batchListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "batch_name",
                title: "Batch Name"
            },
            {
                field: "class_name",
                title: "Class Name"
            },
            {
                field: "section",
                title: "Section"
            },

            {command: [
                        { name:"edit",text: "Edit",click: edit_systems },
                        { name:"Delete", text: "Delete", click: delete_batch_systems },
                      ]
            },

        ],
    });

}

function edit_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    openModal("/student_class_batches/"+dataItem.id+"/edit?profile_id="+dataItem.profile_id,"#batchclassModal")
}

function delete_batch_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/student_class_batches/"+dataItem.id,dataItem.id,'#student_batch_info')
}



