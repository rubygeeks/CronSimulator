
=begin
queue

daemon

minutes

number of tasks per minute is a array

60minutes*24hours
=end


class CronSim
  MINUTES_IN_A_DAY =1440
  MINUTE_FOR_COUNTER = 1440 -1

def initialize
  @instant= Array.new(MINUTES_IN_A_DAY,[])
end


def add_task_duration(minute,task,duration)

(0..(duration-1)).to_a.each do |instant|
moment =  minute+instant
add_task(moment,task)
end
end

def add_task(minute,task)
  return if minute > MINUTE_FOR_COUNTER
@instant[minute]=@instant[minute] + [task]
end  

def every_minute(task,duration)
  every_x_minute(task,duration,1)
end
  
def every_hour(task,duration)
  every_x_minute(task,duration,60)
end

def every_x_minute(task,duration,x)
  (0..MINUTE_FOR_COUNTER).to_a.each do |minute|
  add_task_duration(minute,task,duration)  if minute%x==0
  end  
end

def every_5_minute(task,duration)
  every_x_minute(task,duration,5)
end

def dump_serverload
  (0..MINUTE_FOR_COUNTER).to_a.each do |i|
    puts "%02d" % (i/60) + ":" "%02d" % (i%60) + " : tasks #{@instant[i].length} :names #{@instant[i].join' - '}" ##{i}m
  end
end  

def dump_data
  @instant
end

end


