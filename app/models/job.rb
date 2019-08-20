class Job < ApplicationRecord

    has_one_attached :image
    validates :name, presence: true, length: { maximum: 30 }
    validate :validate_name_not_including_comma

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }

    def self.csv_attributes
      ["name", "description", "created_at", "updated_at"]
    end
  
    def self.generate_csv
      CSV.generate(headers: true) do |csv|
        csv << csv_attributes
        all.each do |job|
          csv << csv_attributes.map{ |attr| job.send(attr) }
        end
      end
    end
  
    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        job = new
        job.attributes = row.to_hash.slice(*csv_attributes)
        job.save!
      end
    end
  
    private
  
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end
end
