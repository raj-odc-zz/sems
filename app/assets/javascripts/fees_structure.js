$(document).ready(function(){
    FeesStructureListGrid()
})
function FeesStructureListDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/fees_structures",
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
                    class_name: { type: "string", editable: true},
                    fees_type: { type: "string", editable: true},
                    amount: { type: "string", editable: true},
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

function FeesStructureListGrid() {
    jQuery("#fees_structure_List").kendoGrid({
        dataSource: FeesStructureListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
           {
                field: "class_list",
                title: "Class"
            },
            {
                field: "fees_type",
                title: "Fee Type"
            },
            {
                field: "amount",
                title: "Amount"
            },
            {command: [{ name:"edit",text: "Edit",click: edit_systems },{ name:"Delete", text: "Delete", click: delete_systems }]},

        ],
    });

}

function edit_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    openModal("fees_structures/"+dataItem.id+"/edit","#feesstructureModal")
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/fees_structures/"+dataItem.id,dataItem.id,'#fees_structure_List')
}

// window.location.href = "/roles/new"
