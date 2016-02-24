$(document).ready(function(){
    ProfileTypeListGrid()
})
function ProfileTypeListDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/profile_types",
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
                    username: { type: "string", editable: true},
                    email_id: { type: "string", editable: true},
                    role: { type: "string", editable: true},
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

function ProfileTypeListGrid() {
    jQuery("#profile_type_List").kendoGrid({
        dataSource: ProfileTypeListDataSource(),
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
    openModal("profile_types/"+dataItem.id+"/edit","#profiletypeModal")
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/profile_types/"+dataItem.id,dataItem.id,'#profile_type_List')
}

// window.location.href = "/roles/new"
