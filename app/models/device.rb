class Device < ApplicationRecord
	belongs_to :store
	validates :name, presence: true

	STATUSES = %w[active inactive malfunctioning mainteinance] # 0 , 1 , 2 , 3
	SPANISH_STATUSES = %w[activo inactivo fallando mantenimiento]
	STATUSES_COLORS = %w[#28a745 #6c757d #dc3545 #f7ba06]

	def status_name
		STATUSES[status].capitalize
	end

	def spanish_status_name
		SPANISH_STATUSES[status].capitalize
	end

	def status_color
		STATUSES_COLORS[status]
	end

end
