$(function () {
    $('[rel="tooltip"]').tooltip();     
});

$("#formSearch").submit(function () {
    var strQry = $.trim($("#q").val());
    $("#q").val(strQry);
    if (strQry.length > 0) {
        return true;
    } else {
        return false;
    }
});

function scrlTo(objID) {
    if (objID != "") $(window).scrollTo($('#' + objID), 1200)
}

window.___gcfg = { lang: 'en-US' };

(function (doc, script) {
    var js,
        fjs = doc.getElementsByTagName(script)[0],
        add = function (url, id) {
            if (doc.getElementById(id)) { return; }
            js = doc.createElement(script);
            js.src = url;
            id && (js.id = id);
            fjs.parentNode.insertBefore(js, fjs);
        };

    // Google Analytics
    //add(('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js', 'ga');
    // Google+ button
    add('//apis.google.com/js/plusone.js');
    // Facebook SDK
    add('//connect.facebook.net/en_US/all.js#xfbml=1', 'facebook-jssdk');
    // Twitter SDK
    add('//platform.twitter.com/widgets.js', 'twitter-wjs');

    add('//assets.pinterest.com/js/pinit.js', 'pinterest-js');
    //Stumbleupon SDK
    //add('//platform.stumbleupon.com/1/widgets.js', 'stumbleupon-wjs');
    //Linkedin SDK
    //add('//platform.linkedin.com/in.js', 'linkedin-wjs');

}(document, 'script'));