$(document).ready(function(){
    FeesDetailListGrid()
})
function FeesDetailListDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/amount_transactions",
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
                    profile: { type: 'string', editable: false},
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

function FeesDetailListGrid() {
    jQuery("#fees_detail_List").kendoGrid({
        dataSource: FeesDetailListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "profile",
                title: "Student Name"
            },
            {
                field: "fees_type",
                title: "Fee Type"
            },
            {
                field: "amount",
                title: "Amount"
            },
            {
                field: 'a',template:"<a href='/students/fees_receipt/${id}'>Download Bill</a>"
            },
           // {command: [{ name:"edit",text: "Edit",click: edit_systems },{ name:"Delete", text: "Delete", click: delete_systems }]},

        ],
    });

}

function download_bill(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    window.location.href = "student/fees_receipt/"+dataItem.id;
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/salary_details/"+dataItem.id,dataItem.id,'#salary_detail_List')
}

// window.location.href = "/roles/new"
