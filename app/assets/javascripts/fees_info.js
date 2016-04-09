$(document).ready(function(){
    FeesInfoListGrid()
})
function FeesInfoListDataSource(){
    
    console.log(params)
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/students/fees_info",
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

function FeesInfoListGrid() {
    jQuery("#fees_info_List").kendoGrid({
        dataSource: FeesInfoListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
           {
                field: "id",
                title: "Fee Type"
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
