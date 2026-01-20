require "file_utils"

def cleanup
  puts "Cleaning up services..."
  service_dirs = Dir.glob("src/*")
  service_dirs.reject!("src/runtime")
  service_dirs.reject!("src/runtime.cr")

  service_dirs.sort.each do |service|
    puts "Deleting #{service}"
    FileUtils.rm_r(service)
  end
end

def update_apis
  puts "Updating APIs..."
  api_paths = ARGV.first
  Dir.children(api_paths).sort.each do |api_path|
    service = File.basename(api_path)
    dates = Dir.children(File.join(api_paths, service))
    if !dates.all? { |date| date =~ /^\d{4}-\d{2}-\d{2}$/ }
      puts "Skipping #{service} because it looks unusual (no dates)"
      next
    end
    if !File.exists?(File.join(api_paths, service, dates.first, "api-2.json"))
      puts "Skipping #{service} because it looks unusual (no api json file)"
      next
    end
    puts "Updating #{service}"
    source_dir = File.join(api_paths, service)
    target_dir = File.join("apis", service)
    FileUtils.rm_r(target_dir) if Dir.exists?(target_dir)
    FileUtils.cp_r(source_dir, "apis")
  end
end

if File.basename(PROGRAM_NAME) == "cleanup"
  cleanup
elsif File.basename(PROGRAM_NAME) == "update-apis"
  update_apis
end
