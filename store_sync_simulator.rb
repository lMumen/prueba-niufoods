require 'net/http'
require 'json'
require 'uri'

# Device transition logic
def transition_status(current_status)
  roll = rand(100)
  case current_status
  when 0
    return 2 if roll < 30
    return 3 if roll < 45
    return 1 if roll < 50
    0
  when 1
    return 0 if roll < 60
    1
  when 2
    return 3 if roll < 70
    return 1 if roll < 95
    2
  when 3
    return 0 if roll < 50
    return 1 if roll < 70
    3
  end
end

stores = [
  {
    id: 1,
    name: 'Mcdonalds',
    devices: [
      { name: 'Caja 1', kind: 'Caja Registradora', code: 'CAD01232', status: 0 },
      { name: 'Caja 2', kind: 'Caja Registradora', code: 'CAD2341', status: 0 },
      { name: 'Congeladora Carnes', kind: 'Congeladora', code: 'REF0232', status: 0 },
      { name: 'Impresora Ticket', kind: 'Impresora Térmica', code: 'PRNT01', status: 1 },
      { name: 'Refrigerador Bebidas', kind: 'Refrigerador', code: 'REFB001', status: 3 },
      { name: 'Tablet Ordenes', kind: 'Tablet', code: 'TBL012', status: 2 }
    ]
  },
  {
    id: 2,
    name: 'KFC',
    devices: [
      { name: 'Caja 1', kind: 'Caja Registradora', code: 'KCAD1', status: 0 },
      { name: 'Refrigerador Alitas', kind: 'Refrigerador', code: 'KREF1', status: 1 },
      { name: 'Tablet Cocina', kind: 'Tablet', code: 'KTBL01', status: 3 },
      { name: 'Congeladora General', kind: 'Congeladora', code: 'KCONG1', status: 0 },
      { name: 'Impresora Factura', kind: 'Impresora', code: 'KPRNT1', status: 2 },
      { name: 'Caja 2', kind: 'Caja Registradora', code: 'KCAD2', status: 0 }
    ]
  },
  {
    id: 3,
    name: 'Starbucks',
    devices: [
      { name: 'Caja Central', kind: 'Caja Registradora', code: 'SCAD01', status: 0 },
      { name: 'Refrigerador Leche', kind: 'Refrigerador', code: 'SREF01', status: 1 },
      { name: 'Tablet Pedidos', kind: 'Tablet', code: 'STBL01', status: 0 },
      { name: 'Impresora Recibos', kind: 'Impresora', code: 'SPRNT01', status: 3 },
      { name: 'Congeladora Pastelería', kind: 'Congeladora', code: 'SCON01', status: 0 },
      { name: 'Caja Móvil', kind: 'Caja Registradora', code: 'SMCAD01', status: 2 },
      { name: 'Refrigerador Frutas', kind: 'Refrigerador', code: 'SREF02', status: 0 },
      { name: 'Impresora Cocina', kind: 'Impresora Térmica', code: 'SPRNT02', status: 0 },
      { name: 'Tablet Barista', kind: 'Tablet', code: 'STBL02', status: 1 }
    ]
  }
]

# Sync loop
puts "Starting store sync simulation... Press Ctrl+C to stop."
loop do
  stores.each do |store|
    store[:devices].each do |device|
      device[:status] = transition_status(device[:status])
    end

    body = {
      store: {
        devices_info: store[:devices].map do |d|
          {
            name: d[:name],
            kind: d[:kind],
            code: d[:code],
            status: d[:status]
          }
        end
      }
    }

    uri = URI("http://localhost:3000/stores/#{store[:id]}/sync_store")
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = body.to_json

    begin
      res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
      puts "Synced store #{store[:name]} - Status: #{res.code}"
    rescue => e
      puts "Failed to sync store #{store[:name]}: #{e.message}"
    end
  end
  sleep 15
end