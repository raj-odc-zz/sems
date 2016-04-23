function BoardTypeListDataSource(){var e=new kendo.data.DataSource({transport:{read:{url:"/api/board_types",dataType:"json"}},schema:{total:"total",data:"data",model:{id:"id",fields:{id:{type:"string",editable:!1},username:{type:"string",editable:!0},email_id:{type:"string",editable:!0},role:{type:"string",editable:!0}}}},batch:!0,pageSize:100,serverPaging:!1,serverFiltering:!1,serverSorting:!1});return e}function BoardTypeListGrid(){jQuery("#board_type_List").kendoGrid({dataSource:BoardTypeListDataSource(),resizable:!0,pageable:{refresh:!0},scrollable:!1,sortable:!0,columns:[{field:"name",title:"Name"},{command:[{name:"edit",text:"Edit",click:edit_systems},{name:"Delete",text:"Delete",click:delete_systems}]}]})}function edit_systems(e){var t=this.dataItem(jQuery(e.currentTarget).closest("tr"));openModal("board_types/"+t.id+"/edit","#boardtypeModal")}function delete_systems(e){var t=this.dataItem(jQuery(e.currentTarget).closest("tr"));doDelete("/api/board_types/"+t.id,t.id,"#board_type_List")}$(document).ready(function(){BoardTypeListGrid()});