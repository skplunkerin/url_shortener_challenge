class Redirect < ApplicationRecord
  # Relationships
  belongs_to    :domain

  # Validations
  validates_presence_of     :full_url,
                            on: [:create]
  validates_uniqueness_of   :short_url,
                            on: [:create,:update]

  # Need to do this before above "belongs_to" validation blocks creation
  before_validation   :set_domain
  # Before we create a record
  before_create       :generate_short_url

  # Generate full short url used for redirecting
  def get_shortened_full_url
    return "#{self.domain.base_domain}/s/#{self.short_url}"
  end

  private

  # If not set, use last domain
  def set_domain
    # If not set
    if !domain_id.present?
      # Use last Domain in system
      # NOTE: this works if only 1 user uses this website.
      #       Add User Model that owns Domain(s) and Redirect(s)
      self.domain_id = Domain.last.id
    end
  end

  # If no short_url is specified, generate random url
  def generate_short_url
    # If short_url isn't set
    if !short_url.present?
      # Get total count of redirects
      short = Redirect.all.count || 1
      # Loop until we have a short_url that doesn't exist
      begin
        self.short_url = short + 1
      end while Redirect.exists?(short_url: self.short_url)
    end
  end
end
