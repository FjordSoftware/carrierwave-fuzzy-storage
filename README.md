# Fuzzy Storage for CarrierWave

https://github.com/FjordSoftware/carrierwave-fuzzy-storage


## Getting started
Add carrierwave-fuzzy-storage to your Gemfile
```ruby
gem 'carrierwave-fuzzy-storage', '~> 0.1.0'
```
run bundle install

Create or modify existing uploader:

```ruby
class AttachmentUploader < CarrierWave::Uploader::Base
  storage CarrierWave::Storage::Fuzzy

  # ...
end
```

Finally in your ActiveRecord models add something like:
```ruby
class Attachment < ApplicationRecord
  include CarrierWave::FuzzyStorage::ActiveRecordSupport.new('aws', :file)

  mount_uploader :file, AttachmentUploader
end
```

Your models need to respond to #file_storage method (note that file is the name
of attribute on which uploader is mounted).

Carrierwave fuzzy storage doesn't support moving files between storages, yet.
Currently it only supports storing files on various storages supported by carrier wave (s3/file).
This allows some files to be kept on disk while some files being kept in s3.


Including CarrierWave::FuzzyStorage::ActiveRecordSupport is optional. First
argument is default storage and all other arguments are uploader mounts.

## TODO

Write some tests
