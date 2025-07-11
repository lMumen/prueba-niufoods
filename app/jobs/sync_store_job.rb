class SyncStoreJob < ApplicationJob
  queue_as :default

  def perform(store_id, store_params)
    store = Store.find_by(id: store_id)
    devices_info = store_params[:devices_info]

    devices_info.each do |device_info|
      device = store.devices.find_by(code: device_info[:code])
      if device.present?
        device.update!(
          name: device_info[:name],
          kind: device_info[:kind],
          status: device_info[:status]
        )
      else
        store.devices.create!(
          name: device_info[:name],
          kind: device_info[:kind],
          code: device_info[:code],
          status: device_info[:status]
        )
      end
    end
    store.update_status
  end
end
