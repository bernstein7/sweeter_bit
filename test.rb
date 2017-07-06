class Model
  include SweeterBit::Field

  has_options_field :role, with_values: [:rookie, :moderator, :admin]
end
