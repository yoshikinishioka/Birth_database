{"filter":false,"title":"20170301091155_create_friend.rb","tooltip":"/db/migrate/20170301091155_create_friend.rb","undoManager":{"mark":0,"position":0,"stack":[[{"start":{"row":0,"column":0},"end":{"row":4,"column":0},"action":"remove","lines":["class CreateFriend < ActiveRecord::Migration","  def change","  end","end",""],"id":2},{"start":{"row":0,"column":0},"end":{"row":14,"column":0},"action":"insert","lines":["class CreateFriend < ActiveRecord::Migration","  def change","    create_table :friends do |t|","      t.string :user_id","      t.string :fb_user_id","      t.date :birthday","      t.string :name","      t.string :icon","      t.string :friends","      ","      t.timestamps null: false","    end","  end","end",""]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":14,"column":0},"end":{"row":14,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1488359519314,"hash":"49fb4393997f8096737de66ec2fc918daa524720"}