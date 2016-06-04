$(document).ready(function(){
    batchListGrid()
})
function batchListDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/batch_lists",
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
                    board_name: { type: "string", editable: true},
                    batch_name: { type: "string", editable: true},
                    section: { type: "string", editable: true},
                    major: { type: "string", editable: true},
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
    jQuery("#batchList").kendoGrid({
        dataSource: batchListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "academic_year",
                title: "Batch Name"
            },

            {command: [
                        { name:"edit",text: "Edit",click: edit_systems },
                        { name:"Delete", text: "Delete", click: delete_systems },
                      ]
            },

        ],
    });

}

function edit_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    openModal("batch_lists/"+dataItem.id+"/edit","#batchListModal")
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/batch_lists/"+dataItem.id,dataItem.id,'#batchList')
}



