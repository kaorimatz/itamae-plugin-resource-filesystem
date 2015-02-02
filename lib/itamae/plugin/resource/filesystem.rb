require 'itamae/resource/base'

module Itamae
  module Plugin
    module Resource
      class Filesystem < Itamae::Resource::Base
        define_attribute :action, default: :create
        define_attribute :fstype, type: String, required: true
        define_attribute :device, type: [String, Array], required: true
        define_attribute :force, type: [TrueClass, FalseClass], default: false
        define_attribute :options, type: Array, default: []

        def pre_action
          attributes.device = [attributes.device].flatten
        end

        def set_current_attributes
          current.fstype = get_fstype(attributes.device.first)
        end

        def action_create(options)
          ensure_mkfs_available
          ensure_device_exist

          args = [mkfs]
          if attributes.force
            if %w(ext2 ext3 ext4 ext4dev).include? attributes.fstype
              args << '-F'
            elsif %w(xfs btrfs).include? attributes.fstype
              args << '-f'
            end
          end
          args += attributes.options
          args += attributes.device

          run_command(args)
        end

        private

        def get_fstype(device)
          result = run_command(['blkid', '-c', '/dev/null', '-o', 'value', '-s', 'TYPE', device], error: false)
          if result.success?
            result.stdout.strip
          else
            nil
          end
        end

        def ensure_mkfs_available
          unless check_command(['which', mkfs])
            raise "`#{mkfs}` command is not available."
          end
        end

        def ensure_device_exist
          attributes.device.each do |dev|
            unless check_command(['test', '-e', dev])
              raise "device #{dev} doesn't exist."
            end
          end
        end

        def mkfs
          "mkfs.#{attributes.fstype}"
        end
      end
    end
  end
end
