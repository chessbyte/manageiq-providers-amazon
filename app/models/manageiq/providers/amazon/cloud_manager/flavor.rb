class ManageIQ::Providers::Amazon::CloudManager::Flavor < ::Flavor
  virtual_column :supports_instance_store, :type => :boolean
  virtual_column :supports_ebs,            :type => :boolean

  supports :instance_store do
    unsupported_reason_add(:instance_store, _("Only Block Storage is available")) if block_storage_based_only?
  end

  supports :ebs do
    unsupported_reason_add(:ebs, _("Block Storage is not available")) unless block_storage_based_only?
  end

  def self.display_name(number = 1)
    n_('Flavor (Amazon)', 'Flavors (Amazon)', number)
  end
end
