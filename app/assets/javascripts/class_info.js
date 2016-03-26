$(document).ready(function(){
    classListGrid()
})
function classListDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/class_lists",
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

function classListGrid() {
    jQuery("#addressList").kendoGrid({
        dataSource: classListDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "class_name",
                title: "Class"
            },
            {
                field: "section",
                title: "Section"
            },
            {
                field: "major",
                title: "Major"
            },

            {command: [
                        { name:"edit",text: "Edit",click: edit_systems },
                        { name:"Delete", text: "Delete", click: delete_systems },
                        { name:"show", text: "Show", click: showClass },
                      ]
            },

        ],
    });

}

function edit_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    openModal("address/"+dataItem.id+"/edit","#classListModal")
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/addresses/"+dataItem.id,dataItem.id,'#classListModal')
}

function showClass(e){
    window.location.href = "/class_list_infos   "
}

