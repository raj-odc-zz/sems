require 'open3'
class Pdf
  class << self
    def execute_command(html_string)
      path = "#{Rails.root.to_s}/public/html_string.html"
      File.open(path,"wb+") { |f| f << html_string}
      return ["wkhtmltopdf",
        path,
        "#{Rails.root.to_s}/public/salary_#{Time.now.to_s.gsub(/\W+/,"")}.pdf"
       ]
    end

    def execute_pdf(html_string)
      commends = self.execute_command(html_string)
      err = Open3.popen3(*commends) do |stdin, stdout, stderr, w|
        begin
          Timeout::timeout(300) do
            until stdout.eof? do
              stderr.read
            end
          end
        rescue Timeout::Error
          Process.kill("KILL", w.pid)
        end
        # temp_file.flush
      end
      return commends[2]
    end
  end
end