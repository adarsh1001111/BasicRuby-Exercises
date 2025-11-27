# Time class didnt had any + method to add Time objects so i created one
class Time
  def +(other)
    total = (hour * 3600 + min * 60 + sec) + (other.hour * 3600 + other.min * 60 + other.sec)
    days, rem =  total.divmod(24 * 3600)
    hours, rem = rem.divmod(3600)
    mins, secs = rem.divmod(60)
    days.positive? ? "#{days} day & %02d:%02d:%02d" % [hours, mins, secs] : "%02d:%02d:%02d" % [hours, mins, secs]
  end

  def self.from_hms(str)
    str =~ /\A(\d+):(\d+):(\d+)\z/
    hours, mins, secs = $1.to_i, $2.to_i, $3.to_i
    raise ArgumentError, 'Invalid 24-hour time value' if hours > 23 || mins > 59 || secs > 59
		
    curr_time = Time.now
    Time.new(curr_time.year, curr_time.month, curr_time.day, hours, mins, secs)
  end
end

input = ARGV
if input.empty?
  print 'Please provide an input'
else
  begin
    times = input.map { |t| Time.from_hms(t) }
    p times.inject { |sum, time_obj| sum + time_obj }
  rescue ArgumentError => e
    p e.message
  end
end