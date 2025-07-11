
store1 = Store.create!(name: 'Mcdonalds', address: 'Gran Av. José Miguel Carrera 6567')
store2 = Store.create!(name: 'KFC', address: 'Av. Vicuña Mackenna 4560')
store3 = Store.create!(name: 'Starbucks', address: 'Av. Apoquindo 1234')

Device.create!([
  # McDonalds
  { name: 'Caja 1', kind: 'Caja Registradora', code: 'CAD01232', status: 0, store: store1 },
  { name: 'Caja 2', kind: 'Caja Registradora', code: 'CAD2341', status: 0, store: store1 },
  { name: 'Congeladora Carnes', kind: 'Congeladora', code: 'REF0232', status: 0, store: store1 },
  { name: 'Impresora Ticket', kind: 'Impresora Térmica', code: 'PRNT01', status: 1, store: store1 },
  { name: 'Refrigerador Bebidas', kind: 'Refrigerador', code: 'REFB001', status: 3, store: store1 },
  { name: 'Tablet Ordenes', kind: 'Tablet', code: 'TBL012', status: 2, store: store1 },

  # KFC
  { name: 'Caja 1', kind: 'Caja Registradora', code: 'KCAD1', status: 0, store: store2 },
  { name: 'Refrigerador Alitas', kind: 'Refrigerador', code: 'KREF1', status: 1, store: store2 },
  { name: 'Tablet Cocina', kind: 'Tablet', code: 'KTBL01', status: 3, store: store2 },
  { name: 'Congeladora General', kind: 'Congeladora', code: 'KCONG1', status: 0, store: store2 },
  { name: 'Impresora Factura', kind: 'Impresora', code: 'KPRNT1', status: 2, store: store2 },
  { name: 'Caja 2', kind: 'Caja Registradora', code: 'KCAD2', status: 0, store: store2 },

  # Starbucks
  { name: 'Caja Central', kind: 'Caja Registradora', code: 'SCAD01', status: 0, store: store3 },
  { name: 'Refrigerador Leche', kind: 'Refrigerador', code: 'SREF01', status: 1, store: store3 },
  { name: 'Tablet Pedidos', kind: 'Tablet', code: 'STBL01', status: 0, store: store3 },
  { name: 'Impresora Recibos', kind: 'Impresora', code: 'SPRNT01', status: 3, store: store3 },
  { name: 'Congeladora Pastelería', kind: 'Congeladora', code: 'SCON01', status: 0, store: store3 },
  { name: 'Caja Móvil', kind: 'Caja Registradora', code: 'SMCAD01', status: 2, store: store3 },
  { name: 'Refrigerador Frutas', kind: 'Refrigerador', code: 'SREF02', status: 0, store: store3 },
  { name: 'Impresora Cocina', kind: 'Impresora Térmica', code: 'SPRNT02', status: 0, store: store3 },
  { name: 'Tablet Barista', kind: 'Tablet', code: 'STBL02', status: 1, store: store3 }
])