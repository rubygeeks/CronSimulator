
require './lib/cronsim'
require './lib/cronparse.rb'

#=begin
c= CronSim.new
c.every_minute("server up",1)
c.every_hour("newscheck",10)
c.every_5_minute("stale session clear",15)
c.add_task_duration(1,"data load",30)
c.add_task_duration(22*60,"data backup",30)
c.add_task_duration(22*60+15,"upload to server",30)
c.add_task_duration(23*60+45,"zombie",30)
#c.every_minute("server down",3)
#c.add_task(1,"hello world",5)
c.dump_load
#=end





["20 2,6,10,14,18,22 * * *","10 * * * *","40 0 * * *","0 4 * * *","0,31 * * * *","0 4 1,5,9,13,17,21,25,29 * *","30 7 * * *"].each do |occurance|
  puts CronLine.new(occurance).next_time(Time.now)
end