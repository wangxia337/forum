Paperclip.interpolates :assigned_filename do |attachment, style|
  "#{attachment.instance.send("#{attachment.name}_file_name")}"
end