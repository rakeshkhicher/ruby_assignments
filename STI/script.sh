rails new users
cd users

rails g model person name:string email:string
rake db:migrate

cd app/models/

touch admin.rb
echo "class Admin < Person
      has_many :accounts
end" >> admin.rb

touch user.rb 
echo "class User < Person
      has_many :posts
end" >> user.rb

cd ..

rails g model post content:text description:string user:references
rails g model account account_number:string admin:references

rake db:migrate

rails c

#user add and post by user
user = User.create(name:"rakesh",email:"khicher@gmail.com")
post = user.posts.build(content:"ruby is nice",description:"ror")
post.save

user = User.create(name:"dhiraj",email:"dhiraj@gmail.com")
post = user.posts.build(content:"javascript",description:"js")
post.save

#admin add and account by admin
admin = Admin.create(name:"akash",email:"akshasa@gmail.com")
admin.accounts.create(account_number:"123465879654")

admin = Admin.create(name:"monika",email:"monika@ait.com")
admin.accounts.create(account_number:"42341hrt3455")
#add post to specific user
user = User.find_by(name:"rakesh")
post = user.posts.build(content:"c++ and oops",description:"c++")
post.save

#add account to specific admin
admin = Admin.find_by(name:"monika")
admin.accounts.create(account_number"562342@4524")
