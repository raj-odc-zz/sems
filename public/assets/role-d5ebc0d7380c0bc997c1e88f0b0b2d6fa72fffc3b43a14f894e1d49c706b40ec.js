function roleListDataSource(){var e=new kendo.data.DataSource({transport:{read:{url:"/api/roles",dataType:"json"}},schema:{total:"total",data:"data",model:{id:"id",fields:{id:{type:"string",editable:!1},name:{type:"string",editable:!0}}}},batch:!0,pageSize:100,serverPaging:!1,serverFiltering:!1,serverSorting:!1});return e}function roleListGrid(){jQuery("#roleList").kendoGrid({dataSource:roleListDataSource(),resizable:!0,pageable:{refresh:!0},scrollable:!1,sortable:!0,columns:[{field:"name",title:"Name"},{command:[{name:"edit",text:"Edit",click:edit_systems},{name:"Delete",text:"Delete",click:delete_systems}]}]})}function edit_systems(e){var t=this.dataItem(jQuery(e.currentTarget).closest("tr"));openModal("/roles/"+t.id+"/edit","#roleModal")}function delete_systems(e){var t=this.dataItem(jQuery(e.currentTarget).closest("tr"));doDelete("/api/roles/"+t.id,t.id,"#roleList")}$(document).ready(function(){roleListGrid()});