# Itamae::Plugin::Resource::Filesystem

[Itamae](https://github.com/ryotarai/itamae) resource plugin to create filesystem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-resource-filesystem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-resource-filesystem

## Usage

    filesystem 'RAID 1 btrfs filesystem over /dev/sdb and /dev/sdc' do
      fstype  'btrfs'
      device  ['/dev/sdb', '/dev/sdc']
      force   true
      options ['-d', 'raid1', '-m', 'raid1']
    end

## Contributing

1. Fork it ( https://github.com/kaorimatz/itamae-plugin-resource-filesystem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
