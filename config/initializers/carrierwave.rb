CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :file
end
