

(function () {
    $(document).ready(function () {
        $("div.album a.upload").click(function () {
            var link = $(this);
            var albumId = link.parent().attr("data-albumId");
            var iframe = $("<iframe src=/Albums/Upload.aspx?AlbumId=" + albumId + "/>");
            $("body").append(iframe);
            iframe.dialog();

            window.closeIframe = function () 
            {
                iframe.dialog('close');
                document.location.reload(true);
                return false;
            }
        });

    });


})()