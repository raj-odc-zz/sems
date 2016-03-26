class CreateVirtualTableForMarkInfo < ActiveRecord::Migration[5.0]
  def change
    execute <<-SQL
      CREATE MATERIALIZED VIEW class_inofs AS
      (select cl.id as id,
              cl.class_name,
              cl.board_id,
              cl.section as class_section,
              cl.major,s.name as sub_name,
              m.mark,
              m.profile_id,ex_type.name as exam_type_name,
              ex_type.major as exam_type_major
              from class_lists cl
       inner join subjects s on cl.id = s.class_list_id
       inner join marks m on s.id = m.subject_id
       inner join exam_types ex_type on cl.id = ex_type.class_list_id);
    SQL
  end
  def self.down
     execute <<-SQL
     DROP MATERIALIZED VIEW IF EXISTS class_inofs
     SQL
   end
end
