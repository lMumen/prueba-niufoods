class Store < ApplicationRecord
	has_many :devices
	validates :name, presence: true

	STATUSES = %w[working warning critical]
	SPANISH_STATUSES = %w[operativo advertencia crítico]
	STATUSES_COLORS = %w[#28a745 #f7ba06 #dc3545]
	
	def update_status
		new_status = 0
		total_devices = devices.count
		malfunctioning_devices = devices.where(status: 2).count
		mainteinance_devices = devices.where(status: 3).count

		puts "EQUIPOS MALFUNCIONADOS: #{malfunctioning_devices}"
		puts "EQUIPOS EN MANTENIMIENTO: #{mainteinance_devices}"
		puts "TOTAL DE EQUIPOS: #{total_devices}"
		puts " malfunctioning_devices >= 1 #{ malfunctioning_devices >= 1 }"
		puts " mainteinance_devices >= (total_devices / 2) #{ mainteinance_devices >= (total_devices / 2) }"
		puts " malfunctioning_devices >= (total_devices / 2) #{ malfunctioning_devices >= (total_devices / 2) }"
		puts " mainteinance_devices >= (total_devices*0.8) #{ mainteinance_devices >= (total_devices*0.8) }"

		new_status = 1 if malfunctioning_devices >= 1 || mainteinance_devices >= (total_devices / 2)
		new_status = 2 if malfunctioning_devices >= (total_devices / 2) || mainteinance_devices >= (total_devices*0.8)

		puts "NUEVO ESTADO: #{new_status}"
		update!(status: new_status)

		{status: new_status, status_name: status_name}
	end

	def status_color
		STATUSES_COLORS[status]
	end

	def status_name
		STATUSES[status].capitalize
	end

	def spanish_status_name
		SPANISH_STATUSES[status].capitalize
	end
end