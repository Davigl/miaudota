class ApplianceSerializer < ActiveModel::Serializer
	attributes :id, :date, :status
	has_one :animal
	has_one :adopter, unless: -> { @instance_options[:custom_element].eql? "appliance" }

	def id
    object.id.to_s
  end

  def date
  	day, month, year = object.created_at.day, object.created_at.month, object.created_at.year

  	output = "#{day}/#{month}/#{year}"
  end
end