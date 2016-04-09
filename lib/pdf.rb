class Pdf
  class << self
    def execute_command
      return ["/usr/local/bin/wkhtmltopdf",
         "-T",
         "0mm",
         "-B",
         "0mm",
         "-L",
         "0mm",
         "-R",
         "0mm",
         "cover",
         "public/cover.html",
         "toc",
         "--xsl-style-sheet",
         "vendor/modified_pdf_toc.xsl",
         "public/mail_html_#{@dealer.try(:id)}.html",
         "public/mail_html_#{@dealer.try(:id)}_pdf.pdf"
       ]
    end

    def execute_pdf
      err = Open3.popen3(*self.execute_command) do |stdin, stdout, stderr, w|
        begin
          Timeout::timeout(300) do
            until stdout.eof? do
              stderr.read
            end
          end
        rescue Timeout::Error
          Process.kill("KILL", w.pid)
        end
      end
      pusher_message("Preparing Email",90)
    end
  end
end