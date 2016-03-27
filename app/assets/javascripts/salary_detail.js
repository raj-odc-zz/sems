$(document).ready(function(){
    SalaryDetailListGrid()
})
function SalaryDetailListDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/salary_details",
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
                    staff_name: { type: "string", editable: true},
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

function SalaryDetailListGrid() {
    jQuery("#salary_detail_List").kendoGrid({
        dataSource: SalaryDetailListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
           {
                field: "staff_name",
                title: "Staff Name"
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
    openModal("salary_details/"+dataItem.id+"/edit","#salarydetailModal")
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/salary_details/"+dataItem.id,dataItem.id,'#salary_detail_List')
}

// window.location.href = "/roles/new"
