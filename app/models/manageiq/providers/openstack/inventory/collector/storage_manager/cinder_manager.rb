class ManageIQ::Providers::Openstack::Inventory::Collector::StorageManager::CinderManager < ManageIQ::Providers::Openstack::Inventory::Collector
  include ManageIQ::Providers::Openstack::Inventory::Collector::HelperMethods

  def cloud_volumes
    return @cloud_volumes if @cloud_volumes.any?
    @cloud_volumes = cinder_service.handled_list(:volumes)
  end

  def cloud_volume_snapshots
    return @cloud_volume_snapshots if @cloud_volume_snapshots.any?
    @cloud_volume_snapshots = cinder_service.handled_list(:list_snapshots_detailed, :__request_body_index => "snapshots")
  end

  def cloud_volume_backups
    return @cloud_volume_backups if @cloud_volume_backups.any?
    @cloud_volume_backups = cinder_service.list_backups_detailed.body["backups"]
  end
end
