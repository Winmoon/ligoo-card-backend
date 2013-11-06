// Additional JS functions here
window.fbAsyncInit = function() {
    FB.init({
        appId      : '201018843405894', // App ID
        channelUrl : '//ligoo-card.herokuapp.com/channel.html', // Channel File
        staus     : true, // check login status
        cookie     : true, // enable cookies to allow the server to access the session
        xfbml      : true  // parse XFBML
    });
    console.log('facebook inicializado');

    // Additional init code here
};

// Load the SDK asynchronously
(function(d){
    var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement('script'); js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    ref.parentNode.insertBefore(js, ref);
}(document));
