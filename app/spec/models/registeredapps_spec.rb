require 'rails_helper'
 RSpec.describe Registeredapp, type: :model do
	let(:user) { User.create!(email: "Stutay.Monga9@gmail.com", password: "helloworld") }
	let(:registeredapp) { Registeredapp.create!(name: "Registered App Example", url: "www.myregisteredapp.com", user: user) }
 	describe "attributes" do
		it "has name, url, and user attributes" do
			expect(registeredapp).to have_attributes(name: "Registered App Example", url: "www.myregisteredapp.com", user: user)
		end
	end
end
