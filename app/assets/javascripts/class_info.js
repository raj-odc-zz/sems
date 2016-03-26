$(document).ready(function(){
  var tabStrips = jQuery('#tabstrip').kendoTabStrip().data("kendoTabStrip");
  subInfoGrid()
  examTypeGrid()
    // classListGrid()
})
function subInfoDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/subjects",
                dataType: "json",
                data: {class_list_id: class_list_id},
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

function subInfoGrid() {
    jQuery("#subInfo").kendoGrid({
        dataSource: subInfoDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "name",
                title: "Subject"
            },
            {command: [
                        { name:"edit",text: "Edit",click: edit_systems },
                        { name:"Delete", text: "Delete", click: delete_systems },
                      ]
            },

        ],
    });

}

function examTypeDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/exam_types",
                dataType: "json",
                data: {class_list_id: class_list_id},

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

function examTypeGrid() {
    jQuery("#examInfo").kendoGrid({
        dataSource: examTypeDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "name",
                title: "Subject"
            },
            {command: [
                        { name:"edit",text: "Edit",click: edit_systems },
                        { name:"Delete", text: "Delete", click: delete_systems },
                      ]
            },

        ],
    });

}

function studentDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/students",
                dataType: "json",
                data: {class_list_id: class_list_id},
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
    jQuery("#subInfo").kendoGrid({
        dataSource: studentDataSource(),
        resizable: true,
        pageable: {
            refresh: true,
        },
        scrollable: false,
        sortable: true,
        columns: [
            {
                field: "name",
                title: "Subject"
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
    openModal("address/"+dataItem.id+"/edit","#classListModal")
}

function delete_systems(e){
    var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
    doDelete("/api/addresses/"+dataItem.id,dataItem.id,'#classListModal')
}

function showClass(e){
    window.location.href = "/class_lists/class_list_info"
}

