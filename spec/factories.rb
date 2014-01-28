FactoryGirl.define do
	factory :user do
		name	"Adam Nottingham"
		email 	"adam.nottingham@gmail.com"
		password "foobar"
		password_confirmation	"foobar"
	end
end
