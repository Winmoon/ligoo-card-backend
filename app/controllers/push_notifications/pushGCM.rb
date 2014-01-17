require 'rubygems'
require 'pushmeup'
GCM.host = 'https://android.googleapis.com/gcm/send'
GCM.format = :json
GCM.key = "AIzaSyBNjXO-G8Di463EDyd6UNlCvHBGXQ6bEY4"
destination = "APA91bF-SYo7C1YqMKBT6ZcNoURnDndGWr_7-chnXZO8Ln-qGzooYtO8JZE_pH2CyMoqy7aJbXSE6EM5aULhAgf5yHAmLwWDA1jazF36AslR84Zg1w_6Y2j9cXN7ZP5tSqqYCKzJ1HxwLtZyR_QQb6HhOOKc-WRIww"
data = {:title => 'Ligoocard - Burguer', :message => "PhoneGap Build rocks!2", :msgcnt => "1"}
GCM.send_notification(destination, data)