class Product < ApplicationRecord
    has_many :reviews

    #validates is a method from ActiveRecord
    #creates validations to enforce a shape to your model
    #first arg(s) : col names
    #last arg: key->val args describing the validation rules


    validates(:title, presence: true, uniqueness: { case_sensitive: false })
    # uniqueness is useful e.g. emails, usernames
    validates(:description,
        presence: {
        message: "must be given" #creates custom validation msg
            },
        length: {
            minimum: 10        }
    )
    validates(
        :price,
        numericality: { greater_than: 0 }
    )
            
    after_initialize do
        self.price = 1.0 if price.blank?
    end
    after_validation :normalize_title , on: :create
    def normalize_title
        self.title = title&.downcase&.titleize #safe & not nec. since after valid.
    end
    # definition: 'record' is instance of model

    # can create custom validation as follows 
    # validate(:no_monkey)
    # private
    # def no_monkey
    #     # if body && body.downcase.include?("monkey")
    #     if body&.downcase&.include?("monkey")  #safe navigation operator.
    #         errors.add(:body, "must not contain monkey")
    #     end
    # end
end
