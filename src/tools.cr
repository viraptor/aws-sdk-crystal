require "file_utils"

if File.basename(PROGRAM_NAME) == "cleanup"
  puts "Cleaning up services..."
  service_dirs = Dir.glob("src/aws_sdk/*")
  service_dirs.reject!("src/aws_sdk/runtime")
  service_dirs.reject!("src/aws_sdk/runtime.cr")

  service_dirs.sort.each do |service|
    puts "Deleting #{service}"
    FileUtils.rm_r(service)
  end
end
